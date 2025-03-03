package com.cbd.neo4jchain.slt;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.Priority;
import com.cbd.neo4jchain.enums.RequestType;
import com.cbd.neo4jchain.enums.UnitSLT;
import com.cbd.neo4jchain.model.NamedNode;

@Node
public class Slt extends NamedNode {

    Priority priority;
    RequestType requestType;
    Metric metric;
    Double value;
    UnitSLT unit;

}
