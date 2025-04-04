package com.cbd.neo4jchain.scope;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.enums.Priority;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.request_type.RequestType;
import com.cbd.neo4jchain.util.RelationName.ScopeRelation;

import lombok.Getter;
import lombok.Setter;

@Node
@Getter
@Setter
public class Scope extends NamedNode {

    Priority priority;

    public Scope(Long id, String name, Priority priority) {
        super(id, name);
        this.priority = priority;
    }

    @Relationship(type = ScopeRelation.REQUEST_TYPE)
    RequestType requestType;

    @Relationship(type = ScopeRelation.OBJECTIVES)
    List<Objective> objectives;
}
