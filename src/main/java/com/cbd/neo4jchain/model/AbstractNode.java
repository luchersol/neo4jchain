package com.cbd.neo4jchain.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Node;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
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
