package com.cbd.neo4jchain.person;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/person")
public class PersonController {

    private final PersonService personService;

    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping
    public ResponseEntity<?> getAllPerson() {
        try {
            return ResponseEntity.ok(personService.getAllPerson());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

}
