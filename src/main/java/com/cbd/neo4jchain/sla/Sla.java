package com.cbd.neo4jchain.sla;

import org.springframework.data.neo4j.core.schema.RelationshipProperties;

import com.cbd.neo4jchain.model.AbstractRelationship;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@RelationshipProperties
public class Sla<T> extends AbstractRelationship<T> {

    
}
