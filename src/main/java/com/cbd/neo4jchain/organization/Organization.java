package com.cbd.neo4jchain.organization;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.team.Team;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class Organization extends NamedNode {

    @Relationship("TEAMS")
    private List<Team> teams;
}
