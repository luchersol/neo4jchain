package com.cbd.neo4jchain.customer;

import lombok.Getter;

@Getter
public class CustomerDTO {

    String name;

    Long organization;

    Long sla;

    public Customer parse() {
        return new Customer(null, name);
    }

}
