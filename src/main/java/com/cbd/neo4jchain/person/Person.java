package com.cbd.neo4jchain.person;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.util.RegexConstants;
import com.cbd.neo4jchain.util.RelationName.PersonRelation;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public class Person extends AbstractNode {

    @NotBlank
    private String lastName;

    @NotBlank
    private String firstName;

    @Email(regexp = RegexConstants.EMAIL)
    private String email;

    private String phone;

    public Person(String lastName, String firstName, String email, String phone) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.email = email;
        this.phone = phone;
    }

    @Relationship(type = PersonRelation.ROLES)
    private List<Role> roles;

}
