package com.cbd.neo4jchain.objective;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/objective")
public class ObjectiveController {

    ObjectiveService objectiveService;

    public ObjectiveController(ObjectiveService objectiveService) {
        this.objectiveService = objectiveService;
    }

    @GetMapping
    public ResponseEntity<?> getAllObjectives() {
        return ResponseEntity.ok(objectiveService.getAllObjective());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getObjectiveById(@PathVariable Long id) {
        return ResponseEntity.ok(this.objectiveService.getObjectiveById(id));
    }

    @PostMapping
    public ResponseEntity<?> createObjective(@RequestBody @Valid ObjectiveDTO objective) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.objectiveService.createObjective(objective));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateObjective(@RequestBody @Valid ObjectiveDTO objective, @PathVariable Long id) {
        this.objectiveService.updateObjective(id, objective);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteObjective(@PathVariable Long id) {
        this.objectiveService.deleteObjective(id);
        return ResponseEntity.noContent().build();
    }

}
