package com.cbd.neo4jchain.issue;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IssueWithNumNextStatuses {
    private Issue issue;
    private Long numberOfNextStatuses;

    public IssueWithNumNextStatuses(Issue issue, Long numberOfNextStatuses) {
        this.issue = issue;
        this.numberOfNextStatuses = numberOfNextStatuses;
    }

    public boolean isTerminal() {
        return numberOfNextStatuses == 0;
    }

}