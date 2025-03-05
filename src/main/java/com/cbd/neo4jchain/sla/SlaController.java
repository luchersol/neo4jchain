package com.cbd.neo4jchain.sla;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sla")
public class SlaController {

    SlaService slaService;

    public SlaController(SlaService slaService) {
        this.slaService = slaService;
    }
}
