package com.cbd.neo4jchain.model;

import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface AbstractRepository<T> extends Neo4jRepository<T, Long> {

}
