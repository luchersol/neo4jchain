package com.cbd.neo4jchain.chain.faceted;

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
@RequestMapping("/chainfaceted")
public class ChainFacetedController {

    ChainFacetedService chainFacetedService;

    public ChainFacetedController(ChainFacetedService chainFacetedService) {
        this.chainFacetedService = chainFacetedService;
    }

    @GetMapping
    public ResponseEntity<?> getAllChainFaceteds() {
        try {
            return ResponseEntity.ok(chainFacetedService.getAllChainFaceted());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getChainFacetedById(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(this.chainFacetedService.getChainFacetedById(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createChainFaceted(@RequestBody @Valid ChainFacetedDTO chainFaceted) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(this.chainFacetedService.createChainFaceted(chainFaceted));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateChainFaceted(@RequestBody @Valid ChainFacetedDTO chainFaceted, @PathVariable Long id) {
        try {
            this.chainFacetedService.updateChainFaceted(id, chainFaceted);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteChainFaceted(@PathVariable Long id) {
        try {
            this.chainFacetedService.deleteChainFaceted(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
