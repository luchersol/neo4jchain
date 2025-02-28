package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ServiceOrgService {
    
    private final ServiceOrgRepository serviceOrgRepository;

    public ServiceOrgService(ServiceOrgRepository serviceOrgRepository) {
        this.serviceOrgRepository = serviceOrgRepository;
    }

    public List<ServiceOrg> getAllServices(){
        return this.serviceOrgRepository.findAll();
    }

    public ServiceOrg createServiceOrg(ServiceOrg serviceOrg){
        return this.serviceOrgRepository.save(serviceOrg);
    }
}
