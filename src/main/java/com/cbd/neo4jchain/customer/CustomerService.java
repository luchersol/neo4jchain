package com.cbd.neo4jchain.customer;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class CustomerService {

    CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

        public List<Customer> getAllCustomer() {
        return this.customerRepository.findAll();
    }

    public Customer getCustomerById(Long id) {
        return this.customerRepository.findById(id).orElseThrow();
    }

    public Customer createCustomer(Customer customer) {
        return this.customerRepository.save(customer);
    }

    public Customer updateCustomer(Long customerId, Customer customer) {
        Customer customerToUpdate = getCustomerById(customerId);
        BeanUtils.copyProperties(customer, customerToUpdate, "id");
        return this.customerRepository.save(customer);
    }

    public void deleteCustomer(Long customerId) {
        if (!this.customerRepository.existsById(customerId))
            throw new NotFoundResource(Customer.class, "ID", customerId);
        this.customerRepository.deleteById(customerId);
    }

}
