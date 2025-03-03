package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.scope.Scope;

import lombok.Getter;

@Getter
@Node
public class Sla extends NamedNode {

    @Relationship(type = "GUARANTEE")
    List<Scope> guarantees;
}
