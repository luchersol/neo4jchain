package com.cbd.neo4jchain.objective;

import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.UnitTime;

import lombok.Getter;

@Getter
public class ObjectiveDTO {

    Metric metric;
    Double value;
    UnitTime unit;

}
