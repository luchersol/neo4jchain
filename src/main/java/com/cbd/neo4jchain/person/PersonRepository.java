package com.cbd.neo4jchain.person;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.cbd.neo4jchain.model.AbstractRepository;

@Repository
public interface PersonRepository extends AbstractRepository<Person> {

    boolean existsByUsername(String username);

    Optional<Person> findByUsername(String username);
}
