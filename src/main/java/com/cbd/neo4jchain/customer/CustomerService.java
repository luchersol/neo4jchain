package com.cbd.neo4jchain.customer;

import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }
}
