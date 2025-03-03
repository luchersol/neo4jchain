package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.provider.Provider;
import com.cbd.neo4jchain.requestType.RequestType;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.team.Team;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class ServiceOrg extends NamedNode {

    private Status status;
    private String description;

    private List<RequestType> requestTypes;
    private List<Team> teams;

    private List<Provider> providers;
    private List<Customer> customers;

}
