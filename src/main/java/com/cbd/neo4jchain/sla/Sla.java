package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;
import org.springframework.data.neo4j.core.schema.RelationshipId;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.scope.Scope;

import lombok.Getter;

@Getter
@Node
public class Sla extends NamedNode {

    @Relationship(type = "GUARANTEES")
    List<Scope> guarantees;
}
