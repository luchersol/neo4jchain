package com.cbd.neo4jchain.metrics;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MetricResponse {

    private Long count;
    private Long total;

    public Double getResult() {
        return count.doubleValue() / total;
    }
}
