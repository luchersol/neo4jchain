package com.cbd.neo4jchain.chain.faceted;

import com.cbd.neo4jchain.enums.OwnershipType;

import lombok.Getter;

@Getter
public class ChainFacetedDTO {

    private String version;
    
    private String description;

    private OwnershipType ownershipType;

    private String name;

    public ChainFaceted parse(){
        return new ChainFaceted(null, this.name, this.version, this.description, this.ownershipType);
    }

}
