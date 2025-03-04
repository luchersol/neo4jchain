package com.cbd.neo4jchain.objective;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.UnitTime;
import com.cbd.neo4jchain.model.AbstractNode;

import lombok.Getter;

@Node
@Getter
public class Objective extends AbstractNode {

    Metric metric;
    Double value;
    UnitTime unit;

    public Objective(Metric metric, Double value, UnitTime unit) {
        this.metric = metric;
        this.value = value;
        this.unit = unit;
    }

}
