package com.cbd.neo4jchain.model;

import org.springframework.data.neo4j.core.schema.RelationshipId;
import org.springframework.data.neo4j.core.schema.RelationshipProperties;
import org.springframework.data.neo4j.core.schema.TargetNode;

@RelationshipProperties
public abstract class AbstractRelationship<T> {
    
    @RelationshipId
    protected Long id;

    @TargetNode
	protected T target;
}
