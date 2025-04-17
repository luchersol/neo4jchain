package com.cbd.neo4jchain.sla;

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
@RequestMapping("/api/sla")
public class SlaController {

    SlaService slaService;

    public SlaController(SlaService slaService) {
        this.slaService = slaService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getSlaById(@PathVariable Long id) {
        return ResponseEntity.ok(this.slaService.getSlaById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllSlas() {
        return ResponseEntity.ok(this.slaService.getAllSla());
    }

    @PostMapping
    public ResponseEntity<?> createSla(@RequestBody @Valid SlaDTO sla) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.slaService.createSla(sla));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateSla(@RequestBody @Valid SlaDTO sla, @PathVariable Long id) {
        this.slaService.updateSla(id, sla);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSla(@PathVariable Long id) {
        this.slaService.deleteSla(id);
        return ResponseEntity.noContent().build();
    }

}
