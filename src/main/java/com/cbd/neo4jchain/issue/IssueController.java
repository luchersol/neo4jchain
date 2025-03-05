package com.cbd.neo4jchain.issue;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/issue")
public class IssueController {

    IssueService issueService;

    public IssueController(IssueService issueService) {
        this.issueService = issueService;
    }
}
