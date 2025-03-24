package com.cbd.neo4jchain.service_org;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ServiceOrgDTO {

    private String description;

    private String name;

    private Long status;

    private List<Long> requestTypes;

    private List<Long> teams;

    private List<Long> customers;

    public ServiceOrg parse(){
        return new ServiceOrg(null, name, description);
    }

}
