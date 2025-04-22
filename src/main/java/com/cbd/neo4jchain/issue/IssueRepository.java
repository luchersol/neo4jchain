package com.cbd.neo4jchain.issue;

import java.util.List;

import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface IssueRepository extends AbstractRepository<Issue> {

  @Query("""
          MATCH (chain:Chain)<-[:BELONGS_TO]-(org:Organization)-[:SERVICE]->(serviceOrg:ServiceOrg)<-[:SERVICE]-(issue:Issue)
          WHERE id(chain) = $chainId
          OPTIONAL MATCH (issue)-[:STATUS]->(status:Status)
          RETURN issue, SIZE([(status)-[:NEXT_STATUS*]->(nextStatus) | nextStatus]) AS numberOfNextStatuses
      """)
  List<IssueWithNumNextStatuses> findIssuesByChainId(Long chainId);

  @Query("""
              MATCH (issue:Issue)-[:SERVICE]->(:ServiceOrg)-[:CUSTOMER]->(customer:Customer)
              MATCH (issue)-[:CREATED_BY]->(owner:Person)
              MATCH (issue)-[:REQUEST_TYPE]->(issueRequestType:RequestType)
              MATCH (customer)-[:ORGANIZATION]->(:Organization)-[:TEAM]->(:Team)-[:MEMBER]->(person:Person)
              MATCH (customer)-[:SLA]->(:Sla)-[:GUARANTEE]->(scope:Scope)-[:OBJECTIVE]->(objective:Objective)
              MATCH (scope)-[:REQUEST_TYPE]->(scopeRequestType:RequestType)
              WHERE id(issue) IN $issueIds
                AND person = owner
                AND scopeRequestType = issueRequestType
              RETURN issue AS issue, COLLECT(DISTINCT objective) AS objectives
      """)
  List<IssueWithObjectives> processIssues(List<Long> issueIds);

  List<Issue> findByServiceOrg_Id(Long serviceOrgId);

}
