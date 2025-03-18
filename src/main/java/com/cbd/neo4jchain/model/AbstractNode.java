package com.cbd.neo4jchain.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.neo4j.core.schema.GeneratedValue;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder
public abstract class AbstractNode {

    @Id
    @GeneratedValue
    protected Long oid;

    public AbstractNode() {
        super();
    }

    public AbstractNode(Long oid) {
        this.oid = oid;
    }
}
