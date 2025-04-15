package com.cbd.neo4jchain.issue;

import java.util.List;

import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface IssueRepository extends AbstractRepository<Issue> {

    @Query("MATCH (i:Issue)-[:SERVICE]-(s:ServiceOrg)-[:SERVICE]-(o:Organization)-[:BELONGS_TO]-(c:Chain) WHERE c.id = $chainId RETURN i")
    public List<Issue> getIssuesByOrganizationId(Long chainId);

}
