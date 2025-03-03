package com.cbd.neo4jchain.objective;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.Priority;
import com.cbd.neo4jchain.enums.UnitTime;


@Node
public class Objective {

    Metric metric;
    Double value;
    UnitTime unit;
}

