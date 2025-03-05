package com.cbd.neo4jchain.chain;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.OwnershipType;

import lombok.Getter;

@Node
@Getter
public class ChainFaceted extends Chain {

    public ChainFaceted(Long id, String name, String version, String description, OwnershipType ownershipType) {
        super(id, name, version, description, ownershipType);
    }

}
