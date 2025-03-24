package com.cbd.neo4jchain.provider;

import java.util.List;

import lombok.Getter;

@Getter
public class ProviderDTO {

    Long organization;

    Long serviceOrg;

    List<Long> servicesProviders;

    Long sla;

    public Provider parse(){
        return new Provider(null);
    }

}
