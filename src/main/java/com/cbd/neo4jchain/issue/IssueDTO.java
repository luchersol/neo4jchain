package com.cbd.neo4jchain.issue;

import lombok.Getter;

@Getter
public class IssueDTO {

    private String name;

    private String title;

    private String description;

    private Long serviceOrg;

    private Long status;

    private Long assignedTeam;

    private Long assignedPerson;

    private Long owner;

    private Long requestType;

    public Issue parse() {
        return new Issue(null, name, title, description);
    }
}
