package com.cbd.neo4jchain.metrics;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.function.BiPredicate;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.exception.NoIssuesException;
import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.issue.IssueRepository;
import com.cbd.neo4jchain.issue.IssueWithNumNextStatuses;
import com.cbd.neo4jchain.issue.IssueWithObjectives;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.service_org.ServiceOrgRepository;
import com.cbd.neo4jchain.service_org.ServiceOrgWithTTOAndTTR;

@Service
public class MetricService {

    private final IssueRepository issueRepository;
    private final ServiceOrgRepository serviceOrgRepository;

    public MetricService(IssueRepository issueRepository, ServiceOrgRepository serviceOrgRepository) {
        this.issueRepository = issueRepository;
        this.serviceOrgRepository = serviceOrgRepository;
    }

    private static BiPredicate<Objective, Issue> PASS_TTO = (obj, i) -> obj == null || obj.toSecond() >= i.getTTO();
    private static BiPredicate<Objective, Issue> PASS_TTR = (obj, i) -> obj == null || obj.toSecond() >= i.getTTR();

    private enum CheckMetric {
        CHECK_TTO, CHECK_TTR, CHECK_SLA, CHECK_NOT_SLA
    }

    public Double getGlobalPassedSLA(Long chainId) {
        List<Issue> issues = getIssues(chainId, issue -> issue.isTerminal());
        return processIssues(issues, CheckMetric.CHECK_SLA);
    }

    public Long getProblematicOpenIssues(Long chainId) {
        List<Issue> issues = getIssues(chainId, issue -> !issue.isTerminal());
        List<Long> issueIds = issues.stream().map(Issue::getId).toList();
        var result = issueRepository.processIssues(issueIds);
        if (result == null)
            return 0L;

        return result.stream()
                .filter(i -> filterObjectives(i, CheckMetric.CHECK_NOT_SLA))
                .count();
    }

    public Double getPassedTTO(Long chainId) {
        List<Issue> issues = getIssues(chainId, _ -> true);
        return processIssues(issues, CheckMetric.CHECK_TTO);
    }

    public Double getPassedTTR(Long chainId) {
        List<Issue> issues = getIssues(chainId, _ -> true);
        return processIssues(issues, CheckMetric.CHECK_TTR);
    }

    public Double getMonthlyPassedSLA(Long chainId) {
        List<Issue> issues = getIssues(chainId,
                issue -> issue.isThisMonth() && issue.isTerminal());
        return processIssues(issues, CheckMetric.CHECK_SLA);
    }

    public List<ServiceOrgWithTTOAndTTR> getServicesPassedTTOAndTTR(Long chainId) {
        List<ServiceOrg> services = serviceOrgRepository.findAllServiceOrgByChainId(chainId);
        return services.stream().map(service -> getServicePassedTTOAndTTR(service)).toList();
    }

    private ServiceOrgWithTTOAndTTR getServicePassedTTOAndTTR(ServiceOrg serviceOrg) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceOrg.getId());
        Double serviceTTO = 100 * processIssues(issues, CheckMetric.CHECK_TTO);
        Double serviceTTR = 100 * processIssues(issues, CheckMetric.CHECK_TTR);
        return new ServiceOrgWithTTOAndTTR(serviceOrg, serviceTTO, serviceTTR);
    }

    private List<Issue> getIssues(Long chainId,
            Predicate<IssueWithNumNextStatuses> predicate) {
        List<IssueWithNumNextStatuses> issueWithNumNextStatuses = issueRepository.findIssuesByChainId(chainId);
        List<Issue> issues = issueWithNumNextStatuses
                .stream()
                .filter(predicate)
                .map(IssueWithNumNextStatuses::getIssue)
                .toList();
        if (issues.isEmpty()) {
            throw new NoIssuesException();
        }
        return issues;
    }

    private Double processIssues(List<Issue> issues, CheckMetric checkMetric) {
        List<Long> issueIds = issues.stream().map(Issue::getId).toList();
        var result = Optional.ofNullable(issueRepository.processIssues(issueIds))
                .orElse(Collections.emptyList())
                .stream()
                .filter(i -> filterObjectives(i, checkMetric))
                .toList();
        if (result.size() == 0) {
            return 0.;
        }
        return (double) result.size() / issueIds.size();
    }

    private boolean filterObjectives(IssueWithObjectives issueObjectivesProjection, CheckMetric checkMetric) {
        Issue issue = issueObjectivesProjection.getIssue();
        List<Objective> objectives = issueObjectivesProjection.getObjectives();
        Objective objTTO = objectives.stream()
                .filter(obj -> obj.getMetric() == Metric.TTO)
                .findFirst().orElse(null);
        Objective objTTR = objectives.stream()
                .filter(obj -> obj.getMetric() == Metric.TTR)
                .findFirst().orElse(null);

        return switch (checkMetric) {
            case CHECK_NOT_SLA -> !(PASS_TTO.test(objTTO, issue) && PASS_TTR.test(objTTR, issue));
            case CHECK_SLA -> PASS_TTO.test(objTTO, issue) && PASS_TTR.test(objTTR, issue);
            case CHECK_TTO -> PASS_TTO.test(objTTO, issue);
            case CHECK_TTR -> PASS_TTR.test(objTTR, issue);
        };
    }

}
