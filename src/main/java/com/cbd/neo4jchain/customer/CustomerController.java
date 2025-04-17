package com.cbd.neo4jchain.customer;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/customer")
public class CustomerController {

    CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public ResponseEntity<?> getAllCustomers() {
        return ResponseEntity.ok(customerService.getAllCustomer());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getCustomerById(@PathVariable Long id) {
        return ResponseEntity.ok(this.customerService.getCustomerById(id));
    }

    @PostMapping
    public ResponseEntity<?> createCustomer(@RequestBody @Valid CustomerDTO customer) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.customerService.createCustomer(customer));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateCustomer(@RequestBody @Valid CustomerDTO customer, @PathVariable Long id) {
        this.customerService.updateCustomer(id, customer);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCustomer(@PathVariable Long id) {
        this.customerService.deleteCustomer(id);
        return ResponseEntity.noContent().build();
    }

}
