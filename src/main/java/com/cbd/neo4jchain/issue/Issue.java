package com.cbd.neo4jchain.issue;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.status.Status;

import lombok.Getter;

@Node
@Getter
public class Issue {

    private String title;
    private String description;

    @Relationship(type = "SERVICE")
    private ServiceOrg serviceOrg;

    @Relationship(type = "STATUS")
    private Status status;

}
