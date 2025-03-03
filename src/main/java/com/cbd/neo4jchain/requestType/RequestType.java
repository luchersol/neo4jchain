package com.cbd.neo4jchain.requestType;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class RequestType extends NamedNode {
    
}
