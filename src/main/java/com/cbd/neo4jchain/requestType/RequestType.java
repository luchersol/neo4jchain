package com.cbd.neo4jchain.requestType;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class RequestType extends NamedNode {

    public RequestType(Long id, String name) {
        super(id, name);
    }

}
