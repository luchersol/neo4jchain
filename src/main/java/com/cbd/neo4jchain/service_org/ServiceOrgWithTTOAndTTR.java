package com.cbd.neo4jchain.service_org;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ServiceOrgWithTTOAndTTR {
    private ServiceOrg service;
    private Double TTO;
    private Double TTR;
}
