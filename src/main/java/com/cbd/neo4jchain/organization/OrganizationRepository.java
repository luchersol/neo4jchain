package com.cbd.neo4jchain.organization;

import java.util.List;

import com.cbd.neo4jchain.model.AbstractRepository;

public interface OrganizationRepository extends AbstractRepository<Organization> {

    List<Organization> findByChain_Id(Long id);
}
