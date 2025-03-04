package com.cbd.neo4jchain.team;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.util.RelationName.TeamRelation;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Team extends NamedNode {

    private String specialization;

    public Team(String name, String specialization) {
        this.specialization = specialization;
    }

    @Relationship(type = TeamRelation.PERSONS)
    private List<Person> members;

    @Relationship(type = TeamRelation.ROLES)
    private List<Role> roles;

    public void addMember(Person user) {
        this.members.add(user);
    }

    public boolean containsMember(Person user) {
        return members.contains(user);
    }

    public void addRole(Role role) {
        this.roles.add(role);
    }

    public boolean containsRole(Role role) {
        return roles.contains(role);
    }

}
