package com.cbd.neo4jchain.provider;

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
@RequestMapping("/api/provider")
public class ProviderController {

    ProviderService providerService;

    public ProviderController(ProviderService providerService) {
        this.providerService = providerService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProviderById(@PathVariable Long id) {
        return ResponseEntity.ok(this.providerService.getProviderById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllProviders() {
        return ResponseEntity.ok(this.providerService.getAllProvider());
    }

    @PostMapping
    public ResponseEntity<?> createProvider(@RequestBody @Valid ProviderDTO provider) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.providerService.createProvider(provider));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProvider(@RequestBody @Valid ProviderDTO provider, @PathVariable Long id) {
        this.providerService.updateProvider(id, provider);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProvider(@PathVariable Long id) {
        this.providerService.deleteProvider(id);
        return ResponseEntity.noContent().build();
    }

}
