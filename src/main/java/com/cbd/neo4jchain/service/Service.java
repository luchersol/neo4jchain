package com.cbd.neo4jchain.service;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.sla.Sla;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class Service extends NamedNode {

    @Relationship("SLAS")
    private List<Sla<Service>> slas;

    @Relationship("TEAMS")
    private List<Sla<Service>> teams;
}
