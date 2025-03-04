package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.requestType.RequestType;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.util.RelationName.ServiceOrgRelation;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class ServiceOrg extends NamedNode {

    private String description;

    public ServiceOrg(String name, String description) {
        this.name = name;
        this.description = description;
    }

    @Relationship(type = ServiceOrgRelation.STATUS)
    private Status status;

    @Relationship(type = ServiceOrgRelation.REQUEST_TYPES)
    private List<RequestType> requestTypes;

    @Relationship(type = ServiceOrgRelation.TEAMS)
    private List<Team> teams;

    @Relationship(type = ServiceOrgRelation.CUSTOMERS)
    private List<Customer> customers;

}
