package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class ServiceOrgService {

    private final ServiceOrgRepository serviceOrgRepository;

    public ServiceOrgService(ServiceOrgRepository serviceOrgRepository) {
        this.serviceOrgRepository = serviceOrgRepository;
    }

    public ServiceOrg getServiceOrgById(Long id) {
        return this.serviceOrgRepository.findById(id).orElseThrow();
    }

    public List<ServiceOrg> getAllServiceOrg() {
        return this.serviceOrgRepository.findAll();
    }

    public ServiceOrg createServiceOrg(ServiceOrg serviceOrg) {
        return this.serviceOrgRepository.save(serviceOrg);
    }

    public ServiceOrg updateServiceOrg(Long serviceOrgId, ServiceOrg serviceOrg) {
        ServiceOrg serviceOrgToUpdate = getServiceOrgById(serviceOrgId);
        BeanUtils.copyProperties(serviceOrg, serviceOrgToUpdate, "id");
        return this.serviceOrgRepository.save(serviceOrg);
    }

    public void deleteServiceOrg(Long serviceOrgId) {
        if (!this.serviceOrgRepository.existsById(serviceOrgId))
            throw new NotFoundResource(ServiceOrg.class, "ID", serviceOrgId);
        this.serviceOrgRepository.deleteById(serviceOrgId);
    }
}
