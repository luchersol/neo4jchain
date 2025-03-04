package com.cbd.neo4jchain.organization;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/organization")
public class OrganizationController {

    private final OrganizationService organizationService;

    public OrganizationController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @GetMapping
    public ResponseEntity<?> getAllOrganizations() {
        try {
            return ResponseEntity.ok(organizationService.getAllOrganization());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

}
