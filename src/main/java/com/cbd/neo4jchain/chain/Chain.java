package com.cbd.neo4jchain.chain;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.OwnershipType;
import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Chain extends NamedNode {

    private Double version;

    private String description;

    private OwnershipType ownershipType;

}
