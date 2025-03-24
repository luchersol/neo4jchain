package com.cbd.neo4jchain.organization;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrganizationDTO {

    private String code;

    private String name;

    private Long parent;

    private List<Long> teams;

    private List<Long> services;

    private Long chain;

}
