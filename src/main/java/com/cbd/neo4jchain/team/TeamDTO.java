package com.cbd.neo4jchain.team;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamDTO {

    private String specialization;

    private String name;

    private List<Long> members;

    private List<Long> roles;

}
