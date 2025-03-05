package com.cbd.neo4jchain.objective;

import org.springframework.stereotype.Service;

@Service
public class ObjectiveService {

    ObjectiveRepository objectiveRepository;

    public ObjectiveService(ObjectiveRepository objectiveRepository) {
        this.objectiveRepository = objectiveRepository;
    }
}
