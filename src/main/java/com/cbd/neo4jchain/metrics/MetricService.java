package com.cbd.neo4jchain.metrics;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.function.BiPredicate;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.issue.IssueRepository;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.organization.OrganizationRepository;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.scope.Scope;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.team.Team;

@Service
public class MetricService {

    private final IssueRepository issueRepository;
    private final OrganizationRepository organizationRepository;

    public MetricService(IssueRepository issueRepository,
            OrganizationRepository organizationRepository) {
        this.issueRepository = issueRepository;
        this.organizationRepository = organizationRepository;
    }

    private static BiPredicate<Objective, Issue> PASS_TTO = (obj, i) -> obj.toSecond() >= i.getTTO();
    private static BiPredicate<Objective, Issue> PASS_TTR = (obj, i) -> obj.toSecond() >= i.getTTR();
    private static BiPredicate<Objective, Issue> PASS_SLA = (obj, i) -> PASS_TTO.test(obj, i) && PASS_TTR.test(obj, i);

    public Double getGlobalPassedSLA(Long chainId) {
        List<Issue> issues = getIssues(chainId, issue -> issue.getStatus().isTerminal());
        return processIssues(issues, PASS_SLA);
    }

    public Double getProblematicOpenIssues(Long chainId) {
        List<Issue> issues = getIssues(chainId, issue -> !issue.getStatus().isTerminal());
        return processIssues(issues, PASS_SLA.negate());
    }

    public Double getPassedTTO(Long chainId) {
        List<Issue> issues = getIssues(chainId, _ -> true);
        return processIssues(issues, PASS_TTO);
    }

    public Double getPassedTTR(Long chainId) {
        List<Issue> issues = getIssues(chainId, _ -> true);
        return processIssues(issues, PASS_TTR);
    }

    public Double getMonthlyPassedSLA(Long chainId) {
        List<Issue> issues = getIssues(chainId,
                issue -> issue.getCreatedAt().getMonth().equals(LocalDate.now().getMonth())
                        && issue.getStatus().isTerminal());
        return processIssues(issues, PASS_SLA);
    }

    public Double getServicePassedTTO(Long serviceId) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceId);
        return processIssues(issues, PASS_TTO);
    }

    public Double getServicePassedTTR(Long serviceId) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceId);
        return processIssues(issues, PASS_TTR);
    }

    private List<Issue> getIssues(Long chainId, Predicate<Issue> predicate) {
        List<Organization> organizations = organizationRepository.findByChain_Id(chainId);
        List<Issue> issues = new ArrayList<>();
        for (Organization organization : organizations) {
            for (ServiceOrg serviceOrg : organization.getServices()) {
                List<Issue> filterIssues = issueRepository.findByServiceOrg_Id(serviceOrg.getId())
                        .stream()
                        .filter(predicate)
                        .toList();
                issues.addAll(filterIssues);
            }
        }
        return issues;
    }

    private Double processIssues(List<Issue> issues, BiPredicate<Objective, Issue> predicate) {
        Integer cont = 0;
        issuesBucle: for (Issue issue : issues) {
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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    for (Objective objective : objectives) {
                                        if (predicate.test(objective, issue)) {
                                            cont++;
                                            continue issuesBucle;
                                        }
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
