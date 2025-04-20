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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Node
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Issue extends NamedNode {

    private String title;
    private String description;

    public Issue(Long id, String name, String title, String description) {
        super(id, name);
        this.title = title;
        this.description = description;
    }

    public Issue(Issue issue, Status status) {
        super(issue.getId(), issue.getName());
        this.title = issue.getTitle();
        this.description = issue.getDescription();
        this.serviceOrg = issue.getServiceOrg();
        this.assignedTeam = issue.getAssignedTeam();
        this.assignedPerson = issue.getAssignedPerson();
        this.owner = issue.getOwner();
        this.requestType = issue.getRequestType();
        this.createdAt = issue.getCreatedAt();
        this.lastAssignedAt = issue.getLastAssignedAt();
        this.lastStateChangedAt = issue.getLastStateChangedAt();
        this.closedAt = issue.getClosedAt();
        this.TTO = issue.getTTO();
        this.TTR = issue.getTTR();
        this.status = status; // Asigna el nuevo Status
    }

    @Relationship(type = IssueRelation.SERVICE_ORG)
    private ServiceOrg serviceOrg;

    @Relationship(type = "STATUS", direction = Relationship.Direction.OUTGOING)
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

    // --------------------------------------------------------------------

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
