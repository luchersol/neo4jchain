package com.cbd.neo4jchain.seeder;

import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;

@Service
public class DataSeeder {

    private final Neo4jClient neo4jClient;
    private final NodeSeeder nodeSeeder;
    private final EdgeSeeder edgeSeeder;

    public DataSeeder(NodeSeeder nodeSeeder, Neo4jClient neo4jClient) {
        this.neo4jClient = neo4jClient;
        this.nodeSeeder = nodeSeeder;
        this.edgeSeeder = new EdgeSeeder(neo4jClient, nodeSeeder);
    }

    @PostConstruct
    public void seedData() {
        deleteAll();
        nodeSeeder.loadNode().saveNode();
        edgeSeeder.buildEdges();
    }

    public void deleteAll() {
        neo4jClient.query("MATCH (n) DETACH DELETE n").run();
    }

}
