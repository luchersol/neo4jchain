package com.cbd.neo4jchain.person;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.role.RoleRepository;

@Service
public class PersonService {

    private final PersonRepository personRepository;

    RoleRepository roleRepository;

    public PersonService(PersonRepository personRepository, RoleRepository roleRepository) {
        this.personRepository = personRepository;
        this.roleRepository = roleRepository;
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

    public Person createPerson(PersonDTO person) {
        Person newPerson = person.parse();
        List<Role> roles = roleRepository.findAllById(person.getRoles());
        newPerson.setRoles(roles);
        
        return this.personRepository.save(newPerson);
    }

    public Person createUser(Person person){
        return this.personRepository.save(person);
    }

    public Person updatePerson(Long personId, PersonDTO personDTO) {
        Person personToUpdate = getPersonById(personId);
        Person person = personDTO.parse();
        List<Role> roles = roleRepository.findAllById(personDTO.getRoles());
        person.setRoles(roles);
        BeanUtils.copyProperties(person, personToUpdate, "id");
        return this.personRepository.save(personToUpdate);
    }

    public void deletePerson(Long personId) {
        if (!this.personRepository.existsById(personId))
            throw new NotFoundResource(Person.class, "ID", personId);
        this.personRepository.deleteById(personId);
    }
}
