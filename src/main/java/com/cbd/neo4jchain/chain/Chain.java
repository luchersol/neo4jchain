package com.cbd.neo4jchain.chain;

import com.cbd.neo4jchain.enums.OwnershipType;
import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Chain extends NamedNode {

    private String version;
    private String description;
    private OwnershipType ownershipType;

    public Chain(String name, String version, String description, OwnershipType ownershipType) {
        this.name = name;
        this.version = version;
        this.description = description;
        this.ownershipType = ownershipType;
    }

}
