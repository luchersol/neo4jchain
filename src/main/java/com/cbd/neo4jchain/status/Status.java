package com.cbd.neo4jchain.status;

import com.cbd.neo4jchain.model.NamedNode;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Status extends NamedNode {
    
    List<Status> possibleNextStatuses;

}
