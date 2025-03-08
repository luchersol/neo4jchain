package com.cbd.neo4jchain.person;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class PersonService {

    private final PersonRepository userRepository;

    public PersonService(PersonRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<Person> getAllPerson() {
        return this.userRepository.findAll();
    }

    
    public Person getPersonById(Long id) {
        return this.userRepository.findById(id).orElseThrow();
    }

    public Person createPerson(Person person) {
        return this.userRepository.save(person);
    }

    public Person updatePerson(Long personId, Person person) {
        Person personToUpdate = getPersonById(personId);
        BeanUtils.copyProperties(person, personToUpdate, "id");
        return this.userRepository.save(person);
    }

    public void deletePerson(Long personId) {
        if (!this.userRepository.existsById(personId))
            throw new NotFoundResource(Person.class, "ID", personId);
        this.userRepository.deleteById(personId);
    }
}
