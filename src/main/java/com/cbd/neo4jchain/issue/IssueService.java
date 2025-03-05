package com.cbd.neo4jchain.issue;

import org.springframework.stereotype.Service;

@Service
public class IssueService {

    IssueRepository issueRepository;

    public IssueService(IssueRepository issueRepository) {
        this.issueRepository = issueRepository;
    }
}
