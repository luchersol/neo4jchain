package com.cbd.neo4jchain.scope;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.enums.Priority;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.requestType.RequestType;

import lombok.Getter;

@Node
@Getter
public class Scope extends NamedNode {

    Priority priority;

    @Relationship(type = "REQUEST_TYPE")
    RequestType requestType;

    @Relationship(type = "OBJECTIVE")
    List<Objective> objectives;
}
