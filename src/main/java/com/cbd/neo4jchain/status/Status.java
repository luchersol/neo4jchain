package com.cbd.neo4jchain.status;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.util.RelationName.StatusRelation;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Status extends NamedNode {

    public Status(Long id, String name) {
        super(id, name);
    }

    @Relationship(type = StatusRelation.STATUSES)
    List<Status> possibleNextStatuses;

}
