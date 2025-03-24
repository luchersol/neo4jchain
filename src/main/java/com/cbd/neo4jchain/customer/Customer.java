package com.cbd.neo4jchain.customer;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.util.RelationName.CustomerRelation;

import lombok.Getter;
import lombok.Setter;

@Node
@Getter
@Setter
public class Customer extends AbstractNode {

    public Customer(Long id) {
        super(id);
    }

    @Relationship(type = CustomerRelation.ORGANIZATION)
    Organization organization;

    @Relationship(type = CustomerRelation.SLA)
    Sla sla;

}
