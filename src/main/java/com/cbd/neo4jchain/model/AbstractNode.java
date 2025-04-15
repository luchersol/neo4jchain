package com.cbd.neo4jchain.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.neo4j.core.schema.GeneratedValue;

import com.cbd.neo4jchain.util.Depth2Serializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonSerialize(using = Depth2Serializer.class)
public abstract class AbstractNode {

    @Id
    @GeneratedValue
    protected Long id;

    public AbstractNode() {
        super();
    }

    public AbstractNode(Long id) {
        this.id = id;
    }
}
