package com.cbd.neo4jchain.objective;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.UnitTime;
import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;

@Node
@Getter
@Setter
public class Objective extends NamedNode {

    Metric metric;
    Double value;
    UnitTime unit;

    public Objective(Long id, String name, Metric metric, Double value, UnitTime unit) {
        super(id, name);
        this.metric = metric;
        this.value = value;
        this.unit = unit;
    }

    public Double toSecond() {
        return switch (this.unit) {
            case HOUR -> this.value * 3600;
            case MINUTES -> this.value * 60;
        };
    }

}
