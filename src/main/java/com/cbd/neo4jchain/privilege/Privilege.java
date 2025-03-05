package com.cbd.neo4jchain.privilege;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Privilege extends NamedNode {
    public Privilege(Long id, String name) {
        super(id, name);
    }
}
