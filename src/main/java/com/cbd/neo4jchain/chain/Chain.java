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

    private String version;
    private String description;
    private OwnershipType ownershipType;

    public Chain(Long id, String name, String version, String description, OwnershipType ownershipType) {
        super(id, name);
        this.version = version;
        this.description = description;
        this.ownershipType = ownershipType;
    }

}
