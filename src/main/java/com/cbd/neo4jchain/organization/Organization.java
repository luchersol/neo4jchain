package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.enums.Status;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.team.Team;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class Organization extends NamedNode {

    private String code;

    private Status status;

    @Relationship(type = "PARENT")
    private Organization parent;

    @Relationship(type = "TEAM")
    private List<Team> teams;

    private List<ServiceOrg> services;

}
