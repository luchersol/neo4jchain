package com.cbd.neo4jchain.objective;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class ObjectiveService {

    ObjectiveRepository objectiveRepository;

    public ObjectiveService(ObjectiveRepository objectiveRepository) {
        this.objectiveRepository = objectiveRepository;
    }

    public List<Objective> getAllObjective() {
        return this.objectiveRepository.findAll();
    }

    public Objective getObjectiveById(Long id) {
        return this.objectiveRepository.findById(id).orElseThrow();
    }

    public Objective createObjective(ObjectiveDTO objective) {
        return this.objectiveRepository.save(objective.parse());
    }

    public Objective updateObjective(Long objectiveId, ObjectiveDTO objective) {
        Objective objectiveToUpdate = getObjectiveById(objectiveId);
        BeanUtils.copyProperties(objective.parse(), objectiveToUpdate, "id");
        return this.objectiveRepository.save(objectiveToUpdate);
    }

    public void deleteObjective(Long objectiveId) {
        if (!this.objectiveRepository.existsById(objectiveId))
            throw new NotFoundResource(Objective.class, "ID", objectiveId);
        this.objectiveRepository.deleteById(objectiveId);
    }

}
