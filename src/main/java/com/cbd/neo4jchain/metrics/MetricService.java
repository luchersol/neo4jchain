package com.cbd.neo4jchain.metrics;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.chain.ChainRepository;
import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.enums.Metric;
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
    private final ChainRepository chainRepository;
    private final OrganizationRepository organizationRepository;

    public MetricService(IssueRepository issueRepository, ChainRepository chainRepository,
            OrganizationRepository organizationRepository) {
        this.issueRepository = issueRepository;
        this.chainRepository = chainRepository;
        this.organizationRepository = organizationRepository;
    }

    public Double getGlobalPassedSLA(Long chainId) {
        List<Organization> organizations = organizationRepository.findByChain_Id(chainId);
        List<Issue> issues = new ArrayList<>();
        for (Organization organization : organizations) {
            for (ServiceOrg serviceOrg : organization.getServices()) {
                issues.addAll(issueRepository.findByServiceOrg_Id(serviceOrg.getId()));
            }
        }
        issues = issues.stream().filter(issue -> issue.getStatus().isTerminal()).toList();
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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTO) {
                                            isValid = objective.toSecond() >= issue.getTTO();
                                        } else if (objective.getMetric() == Metric.TTR) {
                                            isValid = objective.toSecond() >= issue.getTTR();
                                        }
                                    }
                                    if (isValid) {
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

    public Double getProblematicOpenIssues(Long chainId) {
        List<Organization> organizations = organizationRepository.findByChain_Id(chainId);
        List<Issue> issues = new ArrayList<>();
        for (Organization organization : organizations) {
            for (ServiceOrg serviceOrg : organization.getServices()) {
                issues.addAll(issueRepository.findByServiceOrg_Id(serviceOrg.getId()));
            }
        }
        issues = issues.stream().filter(issue -> !issue.getStatus().isTerminal()).toList();
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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTO) {
                                            isValid = objective.toSecond() >= issue.getTTO();
                                        } else if (objective.getMetric() == Metric.TTR) {
                                            isValid = objective.toSecond() >= issue.getTTR();
                                        }
                                    }
                                    if (!isValid) {
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

    public Double getPassedTTO(Long chainId) {
        List<Organization> organizations = organizationRepository.findByChain_Id(chainId);
        List<Issue> issues = new ArrayList<>();
        for (Organization organization : organizations) {
            for (ServiceOrg serviceOrg : organization.getServices()) {
                issues.addAll(issueRepository.findByServiceOrg_Id(serviceOrg.getId()));
            }
        }

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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTO) {
                                            isValid = objective.toSecond() >= issue.getTTO();
                                        }
                                    }
                                    if (isValid) {
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

    public Double getPassedTTR(Long chainId) {
        List<Organization> organizations = organizationRepository.findByChain_Id(chainId);
        List<Issue> issues = new ArrayList<>();
        for (Organization organization : organizations) {
            for (ServiceOrg serviceOrg : organization.getServices()) {
                issues.addAll(issueRepository.findByServiceOrg_Id(serviceOrg.getId()));
            }
        }

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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTR) {
                                            isValid = objective.toSecond() >= issue.getTTR();
                                        }
                                    }
                                    if (isValid) {
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

    public Double getMonthlyPassedSLA(Long chainId) {
        List<Organization> organizations = organizationRepository.findByChain_Id(chainId);
        List<Issue> issues = new ArrayList<>();
        for (Organization organization : organizations) {
            for (ServiceOrg serviceOrg : organization.getServices()) {
                issues.addAll(issueRepository.findByServiceOrg_Id(serviceOrg.getId()));
            }
        }
        issues = issues.stream().filter(issue -> issue.getCreatedAt().getMonth().equals(LocalDate.now().getMonth())
                && issue.getStatus().isTerminal()).toList();
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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTO) {
                                            isValid = objective.toSecond() >= issue.getTTO();
                                        } else if (objective.getMetric() == Metric.TTR) {
                                            isValid = objective.toSecond() >= issue.getTTR();
                                        }
                                    }
                                    if (isValid) {
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

    public Double getServicePassedTTO(Long serviceId) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceId);
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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTO) {
                                            isValid = objective.toSecond() >= issue.getTTO();
                                        }
                                    }
                                    if (isValid) {
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

    public Double getServicePassedTTR(Long serviceId) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceId);
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
                        if (person != null && Objects.equals(person, issue.getOwner())) {
                            Sla sla = customer.getSla();
                            if (sla == null)
                                continue;
                            List<Scope> guarantees = sla.getGuarantees();
                            for (Scope scope : guarantees) {
                                if (scope.getRequestType() != null &&
                                        Objects.equals(scope.getRequestType(), issue.getRequestType())) {
                                    List<Objective> objectives = scope.getObjectives();
                                    boolean isValid = true;
                                    for (Objective objective : objectives) {
                                        if (objective.getMetric() == Metric.TTR) {
                                            isValid = objective.toSecond() >= issue.getTTR();
                                        }
                                    }
                                    if (isValid) {
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
