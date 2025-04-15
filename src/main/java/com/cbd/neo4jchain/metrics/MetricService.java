package com.cbd.neo4jchain.metrics;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.issue.IssueRepository;

@Service
public class MetricService {

    private final IssueRepository issueRepository;

    public MetricService(IssueRepository issueRepository) {
        this.issueRepository = issueRepository;
    }

    public Double getGlobalPassedSLA(Long chainId) {
        List<Issue> issues = issueRepository.getIssuesByOrganizationId(chainId);
        return null;
    }

}
