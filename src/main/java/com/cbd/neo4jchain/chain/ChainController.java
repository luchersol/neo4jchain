package com.cbd.neo4jchain.chain;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/chain")
public class ChainController {

    ChainService chainService;

    public ChainController(ChainService chainService) {
        this.chainService = chainService;
    }

    @GetMapping
    public ResponseEntity<?> getAllChain() {
        return ResponseEntity.ok(chainService.getAllChain());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getChainById(@PathVariable Long id) {
        return ResponseEntity.ok(this.chainService.getChainById(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteChain(@PathVariable Long id) {
        this.chainService.deleteChain(id);
        return ResponseEntity.noContent().build();
    }

}
