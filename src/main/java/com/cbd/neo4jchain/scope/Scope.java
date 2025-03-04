package com.cbd.neo4jchain.scope;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.enums.Priority;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.requestType.RequestType;
import com.cbd.neo4jchain.util.RelationName.ScopeRelation;

import lombok.Getter;

@Node
@Getter
public class Scope extends NamedNode {

    Priority priority;

    public Scope(String name, Priority priority) {
        this.name = name;
        this.priority = priority;
    }

    @Relationship(type = ScopeRelation.REQUEST_TYPE)
    RequestType requestType;

    @Relationship(type = ScopeRelation.OBJECTIVES)
    List<Objective> objectives;
}
