package com.cbd.neo4jchain.seeder;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;

@Component
public class DataSeeder {

    private final Neo4jClient neo4jClient;

    @Value("${neo4jchain.populate-database:false}")
    private boolean populateDatabase;

    @Value("${neo4jchain.generate-cypher:false}")
    private boolean generateCypher;

    @Value("${neo4jchain.delete-data:false}")
    private boolean deleteData;

    @Value("${neo4jchain.cypher-path}")
    private String cypherPath;

    @Value("${neo4jchain.relation-path:#{null}}")
    private String relationPath;

    @Autowired
    private Environment env;

    public DataSeeder(Neo4jClient neo4jClient, Environment env) {
        this.neo4jClient = neo4jClient;
        this.env = env;
    }

    @PostConstruct
    public void generateData() throws Exception {
        if (populateDatabase) {
            int maxRetries = 10;
            int retryDelayMs = 3000;
            int attempt = 0;
            
            while (attempt < maxRetries) {
                try {
                    attempt++;
    
                    System.out.println("Trying to populate database (attempt " + attempt + ")...");
    
                    var inputStream = getClass().getClassLoader().getResourceAsStream(this.cypherPath);
                    String[] activeProfiles = env.getActiveProfiles();

                    if(Arrays.asList(activeProfiles).contains("local")){
                      inputStream = new FileInputStream("src/main/resources/" + this.cypherPath);
                    }
                    
                    if (inputStream == null) {
                        throw new IllegalArgumentException("File not found: " + this.cypherPath);
                    }
    
                    String cypherFileContent = new BufferedReader(new InputStreamReader(inputStream))
                            .lines()
                            .filter(line -> !line.isBlank() && !line.startsWith("//"))
                            .collect(Collectors.joining("\n"));
    
                    String[] queries = cypherFileContent.split(";");
    
                    for (String query : queries) {
                        String trimmedQuery = query.trim();
                        if (!trimmedQuery.isEmpty()) {
                            neo4jClient.query(trimmedQuery).run();
                        }
                    }
    
                    System.out.println("Database populated successfully");
                    break;
    
                } catch (Exception e) {
                    System.out.println("Error while populating database: " + e.getMessage());
    
                    if (attempt >= maxRetries) {
                        throw new RuntimeException("Max attempts exceeded:", e);
                    }
    
                    System.out.println("Waiting " + retryDelayMs + "ms before another try...");
                    Thread.sleep(retryDelayMs);
                }
            }
        }
    }

}
