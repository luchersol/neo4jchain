package com.cbd.neo4jchain.service_org;

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
public class ServiceOrg extends NamedNode {

    private String type;

    private String contactInfo;

    @Relationship(type = "SLA_SERVICE")
    private List<Sla> services;

    @Relationship(type = "SLA_ORGANIZATION")
    private List<Sla> organizations;
}
