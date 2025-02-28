package com.cbd.neo4jchain.sla;

import org.springframework.data.neo4j.core.schema.RelationshipId;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;

import lombok.Getter;

@Getter
@RelationshipProperties
public class Sla  {

    @RelationshipId
    Long id;

}
