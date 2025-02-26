package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class OrganizationService {
    
    private final OrganizationRepository organizationRepository;

    public OrganizationService(OrganizationRepository organizationRepository) {
        this.organizationRepository = organizationRepository;
    }

    public List<Organization> getAllServices(){
        return this.organizationRepository.findAll();
    }
}
