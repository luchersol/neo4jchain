package com.cbd.neo4jchain.provider;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;

import lombok.Getter;

@Node
@Getter
public class Provider extends AbstractNode {

    @Relationship(type = "ORGANIZATION")
    Organization organization;

    @Relationship(type = "SERVICE")
    ServiceOrg serviceOrg;

    @Relationship(type = "SLA")
    Sla sla;

}
