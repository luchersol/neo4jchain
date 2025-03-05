package com.cbd.neo4jchain.chain.faceted;

import org.springframework.stereotype.Service;

@Service
public class ChainFacetedService {

    ChainFacetedRepository chainFacetedRepository;

    public ChainFacetedService(ChainFacetedRepository chainFacetedRepository) {
        this.chainFacetedRepository = chainFacetedRepository;
    }
}
