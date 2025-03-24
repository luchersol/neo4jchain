package com.cbd.neo4jchain.role;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoleDTO {

    private String name;

    private List<Long> privileges;

}
