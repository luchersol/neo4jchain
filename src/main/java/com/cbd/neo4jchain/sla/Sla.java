package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.scope.Scope;
import com.cbd.neo4jchain.util.RelationName.SlaRelation;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Sla extends NamedNode {

    public Sla(Long id, String name) {
        super(id, name);
    }

    @Relationship(type = SlaRelation.SCOPES)
    List<Scope> guarantees;
}
