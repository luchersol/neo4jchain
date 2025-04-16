package com.cbd.neo4jchain.metrics;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GraphResponse {
    private Set<GraphNode> nodes = new HashSet<>();
    private Set<GraphEdge> edges = new HashSet<>();

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class GraphNode {
        private Long id;
        private String label;
        private String color;
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class GraphEdge {
        private Long from;
        private Long to;
        private String label;
    }
}