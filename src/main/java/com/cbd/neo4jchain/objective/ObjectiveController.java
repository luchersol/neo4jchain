package com.cbd.neo4jchain.objective;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/objective")
public class ObjectiveController {

    ObjectiveService objectiveService;

    public ObjectiveController(ObjectiveService objectiveService) {
        this.objectiveService = objectiveService;
    }
}
