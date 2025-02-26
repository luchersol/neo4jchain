package com.cbd.neo4jchain.service_org;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/services")
public class ServiceOrgController {
    
    private final ServiceOrgService ServiceOrgService;

    public ServiceOrgController(ServiceOrgService ServiceOrgService) {
        this.ServiceOrgService = ServiceOrgService;
    }

    @GetMapping
    public ResponseEntity<?> getAllServiceOrgs() {
        return ResponseEntity.ok(ServiceOrgService.getAllServices());
    }
    
}
