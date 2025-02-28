package com.cbd.neo4jchain.sla;

import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

import com.cbd.neo4jchain.organization.Organization;

@RelationshipProperties
public class SlaToOrganization extends Sla {

    @TargetNode
    Organization target;
    
}
