package com.cbd.neo4jchain.person;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface PersonRepository extends AbstractRepository<Person> {

    boolean existsByName(String name);

    Optional<Person> findByName(String name);
}
