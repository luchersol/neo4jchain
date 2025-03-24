package com.cbd.neo4jchain.person;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.model.NamedNode;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.util.RegexConstants;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Node
@NoArgsConstructor
public class Person extends NamedNode {

    @NotBlank
    private String lastName;

    @NotBlank
    private String firstName;

    @Email(regexp = RegexConstants.EMAIL)
    private String email;

    private String phone;

    private String password;

    public Person(Long id, String name, String lastName, String firstName, String email, String phone,
            String password) {
        super(id, name);
        this.name = name;
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    private List<Role> roles;

}
