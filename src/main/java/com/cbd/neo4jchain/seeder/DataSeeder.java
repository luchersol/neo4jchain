package com.cbd.neo4jchain.seeder;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class DataSeeder {

    Neo4jClient neo4jClient;

    @Value("${neo4jchain.populate-database:false}")
    private boolean populateDatabase;

    @Value("${neo4jchain.generate-cypher:false}")
    private boolean generateCypher;

    @Value("${neo4jchain.delete-data:false}")
    private boolean deleteData;

    @Value("${neo4jchain.cypher-path}")
    private String cypherPath;

    @Value("${neo4jchain.relation-path:#{null}}")
    private String realtionPath;

    public DataSeeder(Neo4jClient neo4jClient) {
        this.neo4jClient = neo4jClient;
    }

    @PostConstruct
    public void generateData() throws Exception {
        if (generateCypher) {
            NodeSeeder nodeSeeder = new NodeSeeder(this.deleteData, this.cypherPath, this.realtionPath);
            nodeSeeder.loadTestData();
            nodeSeeder.generateCypher();
        }

        if (populateDatabase) {
            try {
                List<String> cypherFile = Files.readAllLines(Path.of(this.cypherPath));
                for (String line : cypherFile) {
                    if (line.isBlank() || line.startsWith("//"))
                        continue;
                    neo4jClient.query(line).run();
                }

            } catch (Exception e) {
                throw new IllegalAccessError("No se ha podido acceder al cypher");
            }
        }
    }

}
