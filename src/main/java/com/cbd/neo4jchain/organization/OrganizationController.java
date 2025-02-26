package com.cbd.neo4jchain.organization;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/organizations")
public class OrganizationController {
    
    private final OrganizationService organizationService;

    public OrganizationController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @GetMapping
    public ResponseEntity<?> getAllOrganizations() {
        return ResponseEntity.ok(organizationService.getAllServices());
    }
    
}
