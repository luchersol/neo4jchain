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
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/chainstate")
public class ChainStateController {

    ChainStateService chainStateService;

    public ChainStateController(ChainStateService chainStateService) {
        this.chainStateService = chainStateService;
    }

    @GetMapping
    public ResponseEntity<?> getAllChainStates() {
        return ResponseEntity.ok(chainStateService.getAllChainState());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getChainStateById(@PathVariable Long id) {
        return ResponseEntity.ok(this.chainStateService.getChainStateById(id));
    }

    @PostMapping
    public ResponseEntity<?> createChainState(@RequestBody @Valid ChainStateDTO chainState) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.chainStateService.createChainState(chainState));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateChainState(@RequestBody @Valid ChainStateDTO chainState, @PathVariable Long id) {
        this.chainStateService.updateChainState(id, chainState);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteChainState(@PathVariable Long id) {
        this.chainStateService.deleteChainState(id);
        return ResponseEntity.noContent().build();
    }

}
