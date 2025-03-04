package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.chain.Chain;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.util.RelationName.OrganizationRelation;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Organization extends NamedNode {

    private String code;

    public Organization(String name, String code) {
        this.name = name;
        this.code = code;
    }

    @Relationship(type = OrganizationRelation.ORGANIZATION)
    private Organization parent;

    @Relationship(type = OrganizationRelation.TEAMS)
    private List<Team> teams;

    @Relationship(type = OrganizationRelation.SERVICE_ORGS)
    private List<ServiceOrg> services;

    @Relationship(type = OrganizationRelation.CHAIN)
    private Chain chain;

}
