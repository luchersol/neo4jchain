package com.cbd.neo4jchain.chain.state;

import java.util.List;

import com.cbd.neo4jchain.enums.OwnershipType;

import lombok.Getter;

@Getter
public class ChainStateDTO {

    private String version;
    
    private String description;

    private OwnershipType ownershipType;

    private String name;

    private List<Long> initial;

    private List<Long> terminal;

    private Long initialSla;

    public ChainState parse() {
        return new ChainState(null, this.name, this.version, this.description, this.ownershipType);
    }
}
