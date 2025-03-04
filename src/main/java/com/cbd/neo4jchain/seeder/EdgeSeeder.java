package com.cbd.neo4jchain.seeder;

import java.util.Map;

import org.springframework.data.neo4j.core.Neo4jClient;

public class EdgeSeeder {

    Neo4jClient neo4jClient;
    NodeSeeder nodeSeeder;

    public EdgeSeeder(Neo4jClient neo4jClient, NodeSeeder nodeSeeder) {
        this.nodeSeeder = nodeSeeder;
    }

    public EdgeSeeder buildEdges() {
        return this;
    }

    public <S, T> String edgeBetween(S source, String relation, T target) {
        String sourceLabel = source.getClass().getSimpleName(),
                targetLabel = target.getClass().getSimpleName();

        Long sourceId = getId(source),
                targetId = getId(target);

        if (sourceId == null || targetId == null)
            throw new IllegalArgumentException("Ambos nodos deben tener un ID válido.");

        String query = String.format(
                "MATCH (a:%s {id: $sourceId}), (b:%s {id: $targetId}) " +
                        "MERGE (a)-[r:%s]->(b) " +
                        "RETURN type(r) AS relation",
                sourceLabel, targetLabel, relation);

        return neo4jClient.query(query)
                .bindAll(Map.of("sourceId", sourceId, "targetId", targetId))
                .fetchAs(String.class)
                .one()
                .orElse("Relación no creada");
    }

    private Long getId(Object node) {
        try {
            return (Long) node.getClass().getMethod("getId").invoke(node);
        } catch (Exception e) {
            return null;
        }
    }

}
