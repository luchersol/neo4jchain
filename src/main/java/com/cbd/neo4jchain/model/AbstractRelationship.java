package com.cbd.neo4jchain.model;

import org.springframework.data.neo4j.core.schema.RelationshipId;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;

@RelationshipProperties
public abstract class AbstractRelationship {
    
    @RelationshipId
    protected Long id;

}
