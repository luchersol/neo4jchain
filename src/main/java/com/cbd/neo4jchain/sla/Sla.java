package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;
import org.springframework.data.neo4j.core.schema.RelationshipId;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.slt.Slt;

import lombok.Getter;

@Getter
@Node
public class Sla extends NamedNode {

    @RelationshipId
    Long id;

    String description;

    @Relationship(type = "SLT")
    List<Slt> slts;
}
