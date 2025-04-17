package com.cbd.neo4jchain.person;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/person")
public class PersonController {

    private final PersonService personService;

    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping
    public ResponseEntity<?> getAllPerson() {
        return ResponseEntity.ok(personService.getAllPerson());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getPersonById(@PathVariable Long id) {
        return ResponseEntity.ok(this.personService.getPersonById(id));
    }

    @PostMapping
    public ResponseEntity<?> createPerson(@RequestBody @Valid PersonDTO person) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.personService.createPerson(person));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updatePerson(@RequestBody @Valid PersonDTO person, @PathVariable Long id) {
        this.personService.updatePerson(id, person);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePerson(@PathVariable Long id) {
        this.personService.deletePerson(id);
        return ResponseEntity.noContent().build();
    }

}
