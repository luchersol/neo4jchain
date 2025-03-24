package com.cbd.neo4jchain.customer;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.organization.OrganizationRepository;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.sla.SlaRepository;

@Service
public class CustomerService {

    CustomerRepository customerRepository;

    OrganizationRepository organizationRepository;

    SlaRepository slaRepository;

    public CustomerService(CustomerRepository customerRepository, OrganizationRepository organizationRepository, SlaRepository slaRepository) {
        this.customerRepository = customerRepository;
        this.organizationRepository = organizationRepository;
        this.slaRepository = slaRepository;
    }

        public List<Customer> getAllCustomer() {
        return this.customerRepository.findAll();
    }

    public Customer getCustomerById(Long id) {
        return this.customerRepository.findById(id).orElseThrow();
    }

    public Customer createCustomer(CustomerDTO customer) {
        Customer newCustomer = customer.parse();
        Organization organization = organizationRepository.findById(customer.getOrganization()).orElseThrow();
        Sla sla = slaRepository.findById(customer.getSla()).orElseThrow();
        newCustomer.setOrganization(organization);
        newCustomer.setSla(sla);
        return this.customerRepository.save(newCustomer);
    }

    public Customer updateCustomer(Long customerId, CustomerDTO customerDTO) {
        Customer customerToUpdate = getCustomerById(customerId);
        Customer customer = customerDTO.parse();
        Organization organization = organizationRepository.findById(customerDTO.getOrganization()).orElseThrow();
        Sla sla = slaRepository.findById(customerDTO.getSla()).orElseThrow();
        customer.setOrganization(organization);
        customer.setSla(sla);

        BeanUtils.copyProperties(customer, customerToUpdate, "id");
        return this.customerRepository.save(customerToUpdate);
    }

    public void deleteCustomer(Long customerId) {
        if (!this.customerRepository.existsById(customerId))
            throw new NotFoundResource(Customer.class, "ID", customerId);
        this.customerRepository.deleteById(customerId);
    }

}
