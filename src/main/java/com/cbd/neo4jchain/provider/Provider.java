package com.cbd.neo4jchain.provider;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.util.RelationName.ProviderRelation;

import lombok.Getter;
import lombok.Setter;

@Node
@Getter
@Setter
public class Provider extends AbstractNode {

    public Provider(Long id) {
        super(id);
    }

    @Relationship(type = ProviderRelation.ORGANIZATION)
    Organization organization;

    @Relationship(type = ProviderRelation.SERVICE_ORG)
    ServiceOrg serviceOrg;

    @Relationship(type = ProviderRelation.SERVICE_ORGS)
    private List<ServiceOrg> servicesProviders;

    @Relationship(type = ProviderRelation.SLA)
    Sla sla;

}
