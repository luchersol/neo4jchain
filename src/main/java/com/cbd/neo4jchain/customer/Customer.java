package com.cbd.neo4jchain.customer;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.sla.Sla;

import lombok.Getter;

@Node
@Getter
public class Customer extends AbstractNode {

    @Relationship(type = "ORGANIZATION")
    Organization organization;

    @Relationship(type = "SLA")
    Sla sla;

}
