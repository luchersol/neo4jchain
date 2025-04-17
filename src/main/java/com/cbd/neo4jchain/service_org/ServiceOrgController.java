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
@RequestMapping("/api/serviceorg")
public class ServiceOrgController {

    private final ServiceOrgService serviceOrgService;

    public ServiceOrgController(ServiceOrgService serviceOrgService) {
        this.serviceOrgService = serviceOrgService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getServiceOrgById(@PathVariable Long id) {
        return ResponseEntity.ok(this.serviceOrgService.getServiceOrgById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllServiceOrgs() {
        return ResponseEntity.ok(this.serviceOrgService.getAllServiceOrg());
    }

    @PostMapping
    public ResponseEntity<?> createServiceOrg(@RequestBody @Valid ServiceOrgDTO serviceOrg) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.serviceOrgService.createServiceOrg(serviceOrg));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateServiceOrg(@RequestBody @Valid ServiceOrgDTO serviceOrg, @PathVariable Long id) {
        this.serviceOrgService.updateServiceOrg(id, serviceOrg);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteServiceOrg(@PathVariable Long id) {
        this.serviceOrgService.deleteServiceOrg(id);
        return ResponseEntity.noContent().build();
    }

}
