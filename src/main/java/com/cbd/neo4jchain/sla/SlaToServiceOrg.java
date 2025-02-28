package com.cbd.neo4jchain.sla;

import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

import com.cbd.neo4jchain.service_org.ServiceOrg;

import lombok.Getter;

@Getter
@RelationshipProperties
public class SlaToServiceOrg extends Sla {
    
    @TargetNode
    ServiceOrg target;
    
}
