package com.cbd.neo4jchain.service_org;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;



@RestController
@RequestMapping("/api/v1/services")
public class ServiceOrgController {
    
    private final ServiceOrgService serviceOrgService;

    public ServiceOrgController(ServiceOrgService serviceOrgService) {
        this.serviceOrgService = serviceOrgService;
    }

    @GetMapping
    public ResponseEntity<?> getAllServiceOrgs() {
        return ResponseEntity.ok(serviceOrgService.getAllServices());
    }

    @PostMapping
    public ResponseEntity<?> createServiceOrg(@Valid @RequestBody ServiceOrg serviceOrg) {
        return ResponseEntity.ok(serviceOrgService.createServiceOrg(serviceOrg));
    }
    
    
}
