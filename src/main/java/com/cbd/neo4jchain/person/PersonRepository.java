package com.cbd.neo4jchain.person;

import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface PersonRepository extends AbstractRepository<Person> {
    
}
