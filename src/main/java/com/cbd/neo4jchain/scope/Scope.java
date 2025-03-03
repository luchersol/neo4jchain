package com.cbd.neo4jchain.scope;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.Priority;

import com.cbd.neo4jchain.enums.UnitTime;
import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.requestType.RequestType;

@Node
public class Scope extends NamedNode {

    Priority priority;
    RequestType requestType;
    List<Objective> objectives;
}
