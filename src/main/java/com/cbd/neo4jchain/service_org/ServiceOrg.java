package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.sla.SlaToServiceOrg;
import com.cbd.neo4jchain.sla.SlaToTeam;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class ServiceOrg extends NamedNode {

    private String type;

    private String contactInfo;

    @Relationship(type = "SERVICE")
    private List<SlaToServiceOrg> services;

    @Relationship(type = "TEAM")
    private List<SlaToTeam> teams;
}
