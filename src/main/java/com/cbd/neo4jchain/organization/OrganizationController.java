package com.cbd.neo4jchain.organization;

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
@RequestMapping("/api/organization")
public class OrganizationController {

    private final OrganizationService organizationService;

    public OrganizationController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @GetMapping
    public ResponseEntity<?> getAllOrganizations() {
        return ResponseEntity.ok(organizationService.getAllOrganization());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getOrganizationById(@PathVariable Long id) {
        return ResponseEntity.ok(this.organizationService.getOrganizationById(id));
    }

    @PostMapping
    public ResponseEntity<?> createOrganization(@RequestBody @Valid OrganizationDTO organization) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(this.organizationService.createOrganization(organization));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateOrganization(@RequestBody @Valid OrganizationDTO organization,
            @PathVariable Long id) {
        this.organizationService.updateOrganization(id, organization);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteOrganization(@PathVariable Long id) {
        this.organizationService.deleteOrganization(id);
        return ResponseEntity.noContent().build();
    }

}
