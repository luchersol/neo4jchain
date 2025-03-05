package com.cbd.neo4jchain.chain.state;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chain/state")
public class ChainStateController {

    ChainStateService chainStateService;

    public ChainStateController(ChainStateService chainStateService) {
        this.chainStateService = chainStateService;
    }
}
