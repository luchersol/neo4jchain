package com.cbd.neo4jchain.issue;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.util.RelationName.IssueRelation;

import lombok.Getter;

@Node
@Getter
public class Issue extends AbstractNode {

    private String title;
    private String description;

    public Issue(Long id, String title, String description) {
        super(id);
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
}
