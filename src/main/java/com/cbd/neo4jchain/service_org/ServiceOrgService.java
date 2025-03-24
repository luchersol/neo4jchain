package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.customer.CustomerRepository;
import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.request_type.RequestType;
import com.cbd.neo4jchain.request_type.RequestTypeRepository;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.status.StatusRepository;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.team.TeamRepository;

@Service
public class ServiceOrgService {

    private final ServiceOrgRepository serviceOrgRepository;

    CustomerRepository customerRepository;

    RequestTypeRepository requestTypeRepository;

    StatusRepository statusRepository;

    TeamRepository teamRepository;

    public ServiceOrgService(ServiceOrgRepository serviceOrgRepository, CustomerRepository customerRepository, RequestTypeRepository requestTypeRepository, StatusRepository statusRepository, TeamRepository teamRepository) {
        this.serviceOrgRepository = serviceOrgRepository;
        this.customerRepository = customerRepository;
        this.requestTypeRepository = requestTypeRepository;
        this.statusRepository = statusRepository;
        this.teamRepository = teamRepository;
    }

    public ServiceOrg getServiceOrgById(Long id) {
        return this.serviceOrgRepository.findById(id).orElseThrow();
    }

    public List<ServiceOrg> getAllServiceOrg() {
        List<ServiceOrg> serviceOrgs = this.serviceOrgRepository.findAll();
        return serviceOrgs;
    }

    public ServiceOrg createServiceOrg(ServiceOrgDTO serviceOrg) {
        ServiceOrg newServiceOrg = serviceOrg.parse();
        List<Customer> customers = customerRepository.findAllById(serviceOrg.getCustomers());
        List<RequestType> requestTypes = requestTypeRepository.findAllById(serviceOrg.getRequestTypes());
        List<Team> teams = teamRepository.findAllById(serviceOrg.getTeams());
        Status status = statusRepository.findById(serviceOrg.getStatus()).orElse(null);

        newServiceOrg.setCustomers(customers);
        newServiceOrg.setRequestTypes(requestTypes);
        newServiceOrg.setStatus(status);
        newServiceOrg.setTeams(teams);

        return this.serviceOrgRepository.save(newServiceOrg);
    }

    public ServiceOrg updateServiceOrg(Long serviceOrgId, ServiceOrgDTO serviceOrgDTO) {
        ServiceOrg serviceOrgToUpdate = getServiceOrgById(serviceOrgId);

        ServiceOrg serviceOrg = serviceOrgDTO.parse();
        List<Customer> customers = customerRepository.findAllById(serviceOrgDTO.getCustomers());
        List<RequestType> requestTypes = requestTypeRepository.findAllById(serviceOrgDTO.getRequestTypes());
        List<Team> teams = teamRepository.findAllById(serviceOrgDTO.getTeams());
        Status status = statusRepository.findById(serviceOrgDTO.getStatus()).orElse(null);

        serviceOrg.setCustomers(customers);
        serviceOrg.setRequestTypes(requestTypes);
        serviceOrg.setStatus(status);
        serviceOrg.setTeams(teams);

        BeanUtils.copyProperties(serviceOrg, serviceOrgToUpdate, "id");
        return this.serviceOrgRepository.save(serviceOrgToUpdate);
    }

    public void deleteServiceOrg(Long serviceOrgId) {
        if (!this.serviceOrgRepository.existsById(serviceOrgId))
            throw new NotFoundResource(ServiceOrg.class, "ID", serviceOrgId);
        this.serviceOrgRepository.deleteById(serviceOrgId);
    }
}
