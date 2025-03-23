package com.cbd.neo4jchain.person;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class PersonService {

    private final PersonRepository personRepository;

    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public List<Person> getAllPerson() {
        return this.personRepository.findAll();
    }

    public Person getPersonById(Long id) {
        return this.personRepository.findById(id).orElseThrow();
    }

    public Person getPersonByUsername(String username) {
        return this.personRepository.findByUsername(username).orElseThrow();
    }

    public boolean existsPersonByUsername(String username) {
        return this.personRepository.existsByUsername(username);
    }

    public Person createPerson(Person person) {
        return this.personRepository.save(person);
    }

    public Person updatePerson(Long personId, Person person) {
        Person personToUpdate = getPersonById(personId);
        BeanUtils.copyProperties(person, personToUpdate, "id");
        return this.personRepository.save(person);
    }

    public void deletePerson(Long personId) {
        if (!this.personRepository.existsById(personId))
            throw new NotFoundResource(Person.class, "ID", personId);
        this.personRepository.deleteById(personId);
    }
}
