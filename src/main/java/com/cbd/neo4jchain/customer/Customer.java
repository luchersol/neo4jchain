package com.cbd.neo4jchain.customer;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;

public class Customer extends AbstractNode {
    
    Organization organization;
    Sla sla;

}
