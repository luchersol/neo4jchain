package com.cbd.neo4jchain.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.neo4j.core.schema.GeneratedValue;

import lombok.Getter;

@Getter
public abstract class AbstractNode {
    
    @Id @GeneratedValue
    protected Long id;
}
