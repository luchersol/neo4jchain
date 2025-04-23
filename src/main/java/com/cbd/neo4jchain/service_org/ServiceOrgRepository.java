package com.cbd.neo4jchain.service_org;

import java.util.List;

import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface ServiceOrgRepository extends AbstractRepository<ServiceOrg> {

    @Query("""
            MATCH (chain:Chain)<-[:BELONGS_TO]-(org:Organization)-[:SERVICE]->(serviceOrg:ServiceOrg)
            WHERE id(chain) = $chainId
            RETURN serviceOrg
            """)
    List<ServiceOrg> findAllServiceOrgByChainId(Long chainId);
}
