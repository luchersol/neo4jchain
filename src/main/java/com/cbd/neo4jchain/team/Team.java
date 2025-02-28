package com.cbd.neo4jchain.team;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.person.Person;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class Team extends NamedNode {

    private String specialization;

    @Relationship(type = "MEMBER")
    private List<Person> Person;

    public void add(Person user){
        this.Person.add(user);
    }
    public boolean contains(Person user){
        return Person.contains(user);
    }
}
