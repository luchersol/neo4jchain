package com.cbd.neo4jchain.metrics;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.issue.IssueRepository;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.scope.Scope;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.team.Team;

@Service
public class MetricService {

    private final IssueRepository issueRepository;

    public MetricService(IssueRepository issueRepository) {
        this.issueRepository = issueRepository;
    }

    public Double getGlobalPassedSLA(Long chainId) {
        List<Issue> issues = issueRepository.getIssuesByChainId(chainId);
        issues = issueRepository.findAll();
        Integer cont = 0;
        for (Issue issue : issues) {
            ServiceOrg serviceOrg = issue.getServiceOrg();
            if (serviceOrg == null)
                continue;
            List<Customer> customers = serviceOrg.getCustomers();
            for (Customer customer : customers) {
                Organization organization = customer.getOrganization();
                if (organization == null)
                    continue;
                List<Team> teams = organization.getTeams();
                for (Team team : teams) {
                    List<Person> members = team.getMembers();
                    for (Person person : members) {
                        if (person == issue.getOwner()) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        issue.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType().getId(),
                                                issue.getRequestType().getId())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTO) {
                                            isValid = objective.toSecond() > issue.getTTO();
                                        } else if (objective.getMetric() == Metric.TTR) {
                                            isValid = objective.toSecond() > issue.getTTR();
                                        }
                                    }
                                    if (true) {
                                        cont++;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return cont.doubleValue() / issues.size();
    }

}
