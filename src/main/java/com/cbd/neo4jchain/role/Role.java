package com.cbd.neo4jchain.role;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.model.NamedNode;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Node
public class Role extends NamedNode {
    
    @Relationship(type = "PRIVILEGES")
    private List<Privilege> privileges;

    public void add(Privilege privilege){
        this.privileges.add(privilege);
    }
    public boolean contains(Privilege privilege){
        return privileges.contains(privilege);
    }

}
