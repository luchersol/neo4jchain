package com.cbd.neo4jchain.team;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.user.User;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class Team extends NamedNode {

    @Relationship("MEMBERS")
    private List<User> users;
}
