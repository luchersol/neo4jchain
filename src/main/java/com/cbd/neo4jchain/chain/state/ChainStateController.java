package com.cbd.neo4jchain.chain.state;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/chainstate")
public class ChainStateController {

    ChainStateService chainStateService;

    public ChainStateController(ChainStateService chainStateService) {
        this.chainStateService = chainStateService;
    }
    @GetMapping
    public ResponseEntity<?> getAllChainStates() {
        try {
            return ResponseEntity.ok(chainStateService.getAllChainState());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getChainStateById(@RequestParam Long id) {
        try {
            return ResponseEntity.ok(this.chainStateService.getChainStateById(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createChainState(@RequestBody @Valid ChainState chainState) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(this.chainStateService.createChainState(chainState));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateChainState(@RequestBody @Valid ChainState chainState, @PathVariable Long id) {
        try {
            this.chainStateService.updateChainState(id, chainState);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteChainState(@PathVariable Long id) {
        try {
            this.chainStateService.deleteChainState(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
