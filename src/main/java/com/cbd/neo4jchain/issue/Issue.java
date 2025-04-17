package com.cbd.neo4jchain.issue;

import java.time.LocalDateTime;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.request_type.RequestType;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.util.RelationName.IssueRelation;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Node
@Getter
@Setter
public class Issue extends NamedNode {

    private String title;
    private String description;

    public Issue(Long id, String name, String title, String description) {
        super(id, name);
        this.title = title;
        this.description = description;
    }

    @Relationship(type = IssueRelation.SERVICE_ORG)
    private ServiceOrg serviceOrg;

    @Relationship(type = IssueRelation.STATUS)
    private Status status;

    @Relationship(type = IssueRelation.TEAM)
    private Team assignedTeam;

    @Relationship(type = IssueRelation.ASSIGNED_PERSON)
    private Person assignedPerson;

    @Relationship(type = IssueRelation.OWNER_PERSON)
    private Person owner;

    @Relationship(type = IssueRelation.REQUEST_TYPE)
    private RequestType requestType;

    private LocalDateTime createdAt;
    private LocalDateTime lastAssignedAt;
    private LocalDateTime lastStateChangedAt;
    private LocalDateTime closedAt;

    private Double TTO;
    private Double TTR;

    @JsonIgnore
    public Long getStatusId() {
        Status status = getStatus();
        return status == null ? null : status.getId();
    }

    @JsonIgnore
    public Long getAssignedPersonId() {
        Person person = getAssignedPerson();
        return person == null ? null : person.getId();
    }

}
