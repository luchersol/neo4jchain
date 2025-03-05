package com.cbd.neo4jchain.chain.state;

import org.springframework.stereotype.Service;

@Service
public class ChainStateService {

    ChainStateRepository chainStateRepository;

    public ChainStateService(ChainStateRepository chainStateRepository) {
        this.chainStateRepository = chainStateRepository;
    }
}
