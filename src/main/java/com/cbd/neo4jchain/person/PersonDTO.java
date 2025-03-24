package com.cbd.neo4jchain.person;

import java.util.List;

import com.cbd.neo4jchain.util.RegexConstants;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PersonDTO {

    private String username;

    @NotBlank
    private String lastName;

    @NotBlank
    private String firstName;

    @Email(regexp = RegexConstants.EMAIL)
    private String email;

    private String phone;

    private String password;

    private List<Long> roles;

}
