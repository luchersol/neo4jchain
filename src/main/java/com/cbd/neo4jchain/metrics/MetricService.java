package com.cbd.neo4jchain.metrics;

import java.time.LocalDate;
import java.util.List;
import java.util.function.Predicate;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NoIssuesException;
import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.issue.IssueRepository;
import com.cbd.neo4jchain.issue.IssueWithNumNextStatuses;

@Service
public class MetricService {

    private final IssueRepository issueRepository;

    public MetricService(IssueRepository issueRepository) {
        this.issueRepository = issueRepository;
    }

    private enum CheckMetric {
        CHECK_TTO, CHECK_TTR, CHECK_SLA, CHECK_NOT_SLA
    }

    public Double getGlobalPassedSLA(Long chainId) {
        List<Issue> issues = getIssues(chainId, issue -> issue.isTerminal());
        return processIssues(issues, CheckMetric.CHECK_SLA);
    }

    public Double getProblematicOpenIssues(Long chainId) {
        List<Issue> issues = getIssues(chainId, issue -> !issue.isTerminal());
        return processIssues(issues, CheckMetric.CHECK_NOT_SLA);
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
                issue -> issue.getIssue().getCreatedAt().getMonth().equals(LocalDate.now().getMonth())
                        && issue.isTerminal());
        return processIssues(issues, CheckMetric.CHECK_SLA);
    }

    public Double getServicePassedTTO(Long serviceId) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceId);
        return processIssues(issues, CheckMetric.CHECK_TTO);
    }

    public Double getServicePassedTTR(Long serviceId) {
        List<Issue> issues = issueRepository.findByServiceOrg_Id(serviceId);
        return processIssues(issues, CheckMetric.CHECK_TTR);
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
        MetricResponse result = issueRepository.processIssues(issueIds,
                checkMetric.name());
        if (result == null) {
            return 0.0;
        }
        return result.getResult();
    }

}
