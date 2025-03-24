package com.cbd.neo4jchain.auth;

import java.util.Objects;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.person.PersonService;

import jakarta.validation.Valid;

@RequestMapping("/auth")
public class AuthController {

    PersonService personService;

    public AuthController(PersonService personService) {
        this.personService = personService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
        Person person = personService.getPersonByUsername(loginRequest.getUsername());
        if (loginRequest.getPassword() == null || Objects.equals(loginRequest.getPassword(), person.getPassword())) {
            return ResponseEntity.badRequest().body("Credenciales incorrectos");
        }
        return ResponseEntity.ok(person);
    }

    @PostMapping("/signup")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<?> registerCustomer(@Valid @RequestBody RegisterRequest registerRequest) {
        String username = registerRequest.getUsername();
        if (personService.existsPersonByUsername(username)) {
            return ResponseEntity.badRequest().body("Ya existe cuenta con este nombre de usuario.");
        }

        Person person = new Person();
        person.setUsername(username);
        person.setEmail(registerRequest.getEmail());
        person.setFirstName(registerRequest.getFirstName());
        person.setLastName(registerRequest.getLastName());
        person.setPassword(registerRequest.getPassword());
        person.setPhone(registerRequest.getPhone());
        personService.createUser(person);
        return ResponseEntity.ok(person);
    }
}
