package com.cbd.neo4jchain.issue;

import java.util.List;

import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.metrics.MetricResponse;
import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface IssueRepository extends AbstractRepository<Issue> {

    @Query("""
                MATCH (chain:Chain)<-[:BELONGS_TO]-(org:Organization)-[:SERVICE]->(serviceOrg:ServiceOrg)<-[:SERVICE]-(issue:Issue)
                WHERE id(chain) = $chainId
                OPTIONAL MATCH (issue)-[:STATUS]->(status:Status)
                RETURN issue, SIZE([(status)-[:STATUSES*]->(nextStatus) | nextStatus]) AS numberOfNextStatuses
            """)
    List<IssueWithNumNextStatuses> findIssuesByChainId(Long chainId);

    @Query("""
                MATCH (issue:Issue)-[:SERVICE]->(serviceOrg:ServiceOrg)-[:CUSTOMER]->(customer:Customer)
                MATCH (issue)-[:CREATED_BY]->(owner:Person)
                MATCH (issue)-[:REQUEST_TYPE]->(issueRequestType:RequestType)
                MATCH (customer)-[:ORGANIZATION]->(organization:Organization)-[:TEAM]->(team:Team)-[:MEMBER]->(person:Person)
                MATCH (customer)-[:SLA]->(sla:Sla)-[:GUARANTEE]->(scope:Scope)-[:OBJECTIVE]->(objective:Objective)
                MATCH (scope)-[:REQUEST_TYPE]->(scopeRequestType:RequestType)
                WHERE id(issue) IN $issueIds
                  AND person = owner
                  AND scopeRequestType = issueRequestType
                RETURN COUNT(CASE
                    WHEN $checkMetric = 'CHECK_NOT_SLA' AND NOT (objective.metric = 'TTO' AND objective.value * 60 >= issue.TTO AND objective.metric = 'TTR' AND objective.value * 60 >= issue.TTR) THEN issue
                    WHEN $checkMetric = 'CHECK_SLA' AND (objective.metric = 'TTO' AND objective.value * 60 >= issue.TTO AND objective.metric = 'TTR' AND objective.value * 60 >= issue.TTR) THEN issue
                    WHEN $checkMetric = 'CHECK_TTO' AND (objective.metric = 'TTO' AND objective.value * 60 >= issue.TTO) THEN issue
                    WHEN $checkMetric = 'CHECK_TTR' AND (objective.metric = 'TTR' AND objective.value * 60 >= issue.TTR) THEN issue
                    ELSE NULL
                END) AS count, COUNT(issue) AS total
            """)
    MetricResponse processIssues(List<Long> issueIds, String checkMetric);

    List<Issue> findByServiceOrg_Id(Long serviceOrgId);

}
