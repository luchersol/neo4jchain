package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.chain.Chain;
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

    @Relationship(type = "PARENT")
    private Organization parent;

    @Relationship(type = "TEAM")
    private List<Team> teams;

    @Relationship(type = "SERVICE")
    private List<ServiceOrg> services;

    @Relationship(type = "BELONGS_TO")
    private Chain chain;

}
