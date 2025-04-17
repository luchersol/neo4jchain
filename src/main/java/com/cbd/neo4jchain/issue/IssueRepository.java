package com.cbd.neo4jchain.issue;

import java.util.List;

import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface IssueRepository extends AbstractRepository<Issue> {

    @Query("""
            MATCH (i:Issue)-[:SERVICE]-(s:ServiceOrg)
                           -[:SERVICE]-(o:Organization)
                           -[:BELONGS_TO]-(c:Chain) WHERE c.id = $chainId
            MATCH (i)-[:CREATED_BY]->(p:Person)
            MATCH (i)-[:REQUEST_TYPE]->(r:RequestType)
            RETURN i {.*} AS issue,
                   s {.*} AS serviceOrg,
                   p {.*} AS owner,
                   r {.*} AS requestType
                    """)
    public List<Object> getIssuesByChainId(Long chainId);

    List<Issue> findByServiceOrg_Id(Long serviceOrgId);

}
