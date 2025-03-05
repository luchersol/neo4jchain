package com.cbd.neo4jchain.status;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/status")
public class StatusController {

    StatusService statusService;

    public StatusController(StatusService statusService) {
        this.statusService = statusService;
    }
}
