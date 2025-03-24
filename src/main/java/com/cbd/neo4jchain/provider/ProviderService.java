package com.cbd.neo4jchain.provider;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.organization.OrganizationRepository;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.service_org.ServiceOrgRepository;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.sla.SlaRepository;

@Service
public class ProviderService {

    ProviderRepository providerRepository;

    ServiceOrgRepository serviceOrgRepository;

    OrganizationRepository organizationRepository;

    SlaRepository slaRepository;

    public ProviderService(ProviderRepository providerRepository, ServiceOrgRepository serviceOrgRepository, OrganizationRepository organizationRepository, SlaRepository slaRepository) {
        this.providerRepository = providerRepository;
        this.serviceOrgRepository = serviceOrgRepository;
        this.organizationRepository = organizationRepository;
        this.slaRepository = slaRepository;
    }

    public Provider getProviderById(Long id) {
        return this.providerRepository.findById(id).orElseThrow();
    }

    public List<Provider> getAllProvider() {
        return this.providerRepository.findAll();
    }

    public Provider createProvider(ProviderDTO provider) {
        Provider newProvider = provider.parse();
        Organization organization = organizationRepository.findById(provider.getOrganization()).orElseThrow();
        ServiceOrg serviceOrg = serviceOrgRepository.findById(provider.getServiceOrg()).orElseThrow();
        List<ServiceOrg> servicesProviders = serviceOrgRepository.findAllById(provider.getServicesProviders());
        Sla sla = slaRepository.findById(provider.getSla()).orElseThrow();

        newProvider.setOrganization(organization);
        newProvider.setServiceOrg(serviceOrg);
        newProvider.setServicesProviders(servicesProviders);
        newProvider.setSla(sla);

        return this.providerRepository.save(newProvider);
    }

    public Provider updateProvider(Long providerId, ProviderDTO providerDTO) {
        Provider providerToUpdate = getProviderById(providerId);

        Provider provider = providerDTO.parse();
        Organization organization = organizationRepository.findById(providerDTO.getOrganization()).orElseThrow();
        ServiceOrg serviceOrg = serviceOrgRepository.findById(providerDTO.getServiceOrg()).orElseThrow();
        List<ServiceOrg> servicesProviders = serviceOrgRepository.findAllById(providerDTO.getServicesProviders());
        Sla sla = slaRepository.findById(providerDTO.getSla()).orElseThrow();

        provider.setOrganization(organization);
        provider.setServiceOrg(serviceOrg);
        provider.setServicesProviders(servicesProviders);
        provider.setSla(sla);


        BeanUtils.copyProperties(provider, providerToUpdate, "id");
        return this.providerRepository.save(providerToUpdate);
    }

    public void deleteProvider(Long providerId) {
        if (!this.providerRepository.existsById(providerId))
            throw new NotFoundResource(Provider.class, "ID", providerId);
        this.providerRepository.deleteById(providerId);
    }
}
