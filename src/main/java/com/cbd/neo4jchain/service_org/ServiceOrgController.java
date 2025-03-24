package com.cbd.neo4jchain.service_org;

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
@RequestMapping("/serviceorg")
public class ServiceOrgController {

    private final ServiceOrgService serviceOrgService;

    public ServiceOrgController(ServiceOrgService serviceOrgService) {
        this.serviceOrgService = serviceOrgService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getServiceOrgById(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(this.serviceOrgService.getServiceOrgById(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllServiceOrgs() {
        try {
            return ResponseEntity.ok(this.serviceOrgService.getAllServiceOrg());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createServiceOrg(@RequestBody @Valid ServiceOrgDTO serviceOrg) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(this.serviceOrgService.createServiceOrg(serviceOrg));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateServiceOrg(@RequestBody @Valid ServiceOrgDTO serviceOrg, @PathVariable Long id) {
        try {
            this.serviceOrgService.updateServiceOrg(id, serviceOrg);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteServiceOrg(@PathVariable Long id) {
        try {
            this.serviceOrgService.deleteServiceOrg(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
