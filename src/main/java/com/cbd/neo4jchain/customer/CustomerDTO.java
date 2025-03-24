package com.cbd.neo4jchain.customer;

import lombok.Getter;

@Getter
public class CustomerDTO {

    Long organization;

    Long sla;

    public Customer parse(){
        return new Customer(null);
    }

}
