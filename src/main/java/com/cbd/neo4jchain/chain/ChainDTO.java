package com.cbd.neo4jchain.chain;

import com.cbd.neo4jchain.chain.state.ChainState;
import com.cbd.neo4jchain.enums.OwnershipType;

import lombok.Getter;

@Getter
public class ChainDTO {

    private String name;

    private String version;

    private String description;

    private OwnershipType ownershipType;

    public ChainState parse() {
        return new ChainState(null, this.name, this.version, this.description, this.ownershipType);
    }
}
