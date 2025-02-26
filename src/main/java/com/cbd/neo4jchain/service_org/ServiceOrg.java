package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.team.Team;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class ServiceOrg extends NamedNode {

    @Relationship("SERVICES")
    private List<Sla<ServiceOrg>> services;

    @Relationship("TEAMS")
    private List<Sla<Team>> teams;
}
