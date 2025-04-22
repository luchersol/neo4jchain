package com.cbd.neo4jchain.issue;

import java.util.List;

import com.cbd.neo4jchain.objective.Objective;

import lombok.Getter;

@Getter
public class IssueWithObjectives {
    private Issue issue;
    private List<Objective> objectives;

    public IssueWithObjectives(Issue issue, List<Objective> objectives) {
        this.issue = issue;
        this.objectives = objectives;
    }

}