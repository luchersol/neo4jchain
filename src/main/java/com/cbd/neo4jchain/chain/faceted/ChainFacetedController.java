package com.cbd.neo4jchain.chain.faceted;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chain/faceted")
public class ChainFacetedController {

    ChainFacetedService chainFacetedService;

    public ChainFacetedController(ChainFacetedService chainFacetedService) {
        this.chainFacetedService = chainFacetedService;
    }
}
