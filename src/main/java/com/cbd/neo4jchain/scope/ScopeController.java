package com.cbd.neo4jchain.scope;

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
@RequestMapping("/api/scope")
public class ScopeController {

    ScopeService scopeService;

    public ScopeController(ScopeService scopeService) {
        this.scopeService = scopeService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getScopeById(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(this.scopeService.getScopeById(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllScopes() {
        try {
            return ResponseEntity.ok(this.scopeService.getAllScope());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createScope(@RequestBody @Valid ScopeDTO scope) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(this.scopeService.createScope(scope));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateScope(@RequestBody @Valid ScopeDTO scope, @PathVariable Long id) {
        try {
            this.scopeService.updateScope(id, scope);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteScope(@PathVariable Long id) {
        try {
            this.scopeService.deleteScope(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
