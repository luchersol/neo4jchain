package com.cbd.neo4jchain.person;


import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.enums.Status;
import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.util.RegexConstants;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
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

    @NotNull
    private Status status;

    @Pattern(regexp = RegexConstants.EMAIL)
    private String email;

    private String phone;

    private List<Role> roles;

}
