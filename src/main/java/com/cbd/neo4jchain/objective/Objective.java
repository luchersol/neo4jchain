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

    public Objective(Long id, Metric metric, Double value, UnitTime unit) {
        super(id);
        this.metric = metric;
        this.value = value;
        this.unit = unit;
    }

}
