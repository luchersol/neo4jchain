package com.cbd.neo4jchain.chain;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.OwnershipType;

import lombok.Getter;

@Node
@Getter
public class ChainFaceted extends Chain {

    public ChainFaceted(String name, String version, String description, OwnershipType ownershipType) {
        super(name, version, description, ownershipType);
    }

}
