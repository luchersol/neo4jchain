package com.cbd.neo4jchain.privilege;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrivilegeDTO {

    String name;

    public Privilege parse(){
        return new Privilege(null, name);
    }

}
