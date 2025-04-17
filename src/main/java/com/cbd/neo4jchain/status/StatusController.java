package com.cbd.neo4jchain.status;

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
@RequestMapping("/api/status")
public class StatusController {

    StatusService statusService;

    public StatusController(StatusService statusService) {
        this.statusService = statusService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getStatusById(@PathVariable Long id) {
        return ResponseEntity.ok(this.statusService.getStatusById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllStatuss() {
        return ResponseEntity.ok(this.statusService.getAllStatus());
    }

    @PostMapping
    public ResponseEntity<?> createStatus(@RequestBody @Valid StatusDTO status) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.statusService.createStatus(status));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateStatus(@RequestBody @Valid StatusDTO status, @PathVariable Long id) {
        this.statusService.updateStatus(id, status);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteStatus(@PathVariable Long id) {
        this.statusService.deleteStatus(id);
        return ResponseEntity.noContent().build();
    }

}
