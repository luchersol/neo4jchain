package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.chain.Chain;
import com.cbd.neo4jchain.chain.ChainRepository;
import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.service_org.ServiceOrgRepository;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.team.TeamRepository;

@Service
public class OrganizationService {

    private final OrganizationRepository organizationRepository;

    ServiceOrgRepository serviceOrgRepository;

    TeamRepository teamRepository;

    ChainRepository chainRepository;

    public OrganizationService(OrganizationRepository organizationRepository, ServiceOrgRepository serviceOrgRepository, TeamRepository teamRepository, ChainRepository chainRepository) {
        this.organizationRepository = organizationRepository;
        this.serviceOrgRepository = serviceOrgRepository;
        this.teamRepository = teamRepository;
        this.chainRepository = chainRepository;
    }

    public List<Organization> getAllOrganization() {
        return this.organizationRepository.findAll();
    }

    public Organization getOrganizationById(Long id) {
        return this.organizationRepository.findById(id).orElseThrow();
    }

    public Organization createOrganization(OrganizationDTO organization) {
        
        Organization newOrganization = organization.parse();

        Organization parent = organizationRepository.findById(organization.getParent()).orElse(null);
        List<ServiceOrg> services = serviceOrgRepository.findAllById(organization.getServices());
        List<Team> teams = teamRepository.findAllById(organization.getTeams());
        Chain chain = chainRepository.findById(organization.getChain()).orElseThrow();

        newOrganization.setParent(parent);
        newOrganization.setChain(chain);
        newOrganization.setServices(services);
        newOrganization.setTeams(teams);

        return this.organizationRepository.save(newOrganization);
    }

    public Organization updateOrganization(Long organizationId, OrganizationDTO organizationDTO) {
        Organization organizationToUpdate = getOrganizationById(organizationId);

        Organization organization = organizationDTO.parse();

        Organization parent = organizationRepository.findById(organizationDTO.getParent()).orElse(null);
        List<ServiceOrg> services = serviceOrgRepository.findAllById(organizationDTO.getServices());
        List<Team> teams = teamRepository.findAllById(organizationDTO.getTeams());

        organization.setParent(parent);
        organization.setServices(services);
        organization.setTeams(teams);

        BeanUtils.copyProperties(organization, organizationToUpdate, "id", "chain");
        return this.organizationRepository.save(organizationToUpdate);
    }

    public void deleteOrganization(Long organizationId) {
        if (!this.organizationRepository.existsById(organizationId))
            throw new NotFoundResource(Organization.class, "ID", organizationId);
        this.organizationRepository.deleteById(organizationId);
    }

}
