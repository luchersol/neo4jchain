package com.cbd.neo4jchain.chain.faceted;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.chain.Chain;
import com.cbd.neo4jchain.enums.OwnershipType;

import lombok.Getter;
import lombok.Setter;

@Node("ChainFaceted")
@Getter
@Setter
public class ChainFaceted extends Chain {

    public ChainFaceted(Long id, String name, String version, String description, OwnershipType ownershipType) {
        super(id, name, version, description, ownershipType);
    }

}
