package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class OrganizationService {

    private final OrganizationRepository organizationRepository;

    public OrganizationService(OrganizationRepository organizationRepository) {
        this.organizationRepository = organizationRepository;
    }

    public List<Organization> getAllOrganization() {
        return this.organizationRepository.findAll();
    }

    public Organization getOrganizationById(Long id) {
        return this.organizationRepository.findById(id).orElseThrow();
    }

    public Organization createOrganization(Organization organization) {
        return this.organizationRepository.save(organization);
    }

    public Organization updateOrganization(Long organizationId, Organization organization) {
        Organization organizationToUpdate = getOrganizationById(organizationId);
        BeanUtils.copyProperties(organization, organizationToUpdate, "id");
        return this.organizationRepository.save(organization);
    }

    public void deleteOrganization(Long organizationId) {
        if (!this.organizationRepository.existsById(organizationId))
            throw new NotFoundResource(Organization.class, "ID", organizationId);
        this.organizationRepository.deleteById(organizationId);
    }

}
