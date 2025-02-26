package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ServiceOrgService {
    
    private final ServiceOrgRepository ServiceOrgRepository;

    public ServiceOrgService(ServiceOrgRepository ServiceOrgRepository) {
        this.ServiceOrgRepository = ServiceOrgRepository;
    }

    public List<ServiceOrg> getAllServices(){
        return this.ServiceOrgRepository.findAll();
    }
}
