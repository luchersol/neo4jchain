package com.cbd.neo4jchain.person;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class PersonService {

    private final PersonRepository userRepository;

    public PersonService(PersonRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<Person> getAllPerson() {
        return this.userRepository.findAll();
    }
}
