package com.cbd.neo4jchain.objective;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.UnitTime;

import lombok.Getter;

@Node
@Getter
public class Objective {

    Metric metric;
    Double value;
    UnitTime unit;
}
