package com.cbd.neo4jchain.model;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.util.RegexConstants;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Node
public abstract class NamedNode extends AbstractNode {

    @NotBlank
    @Pattern(regexp = RegexConstants.ALPHANUMERIC)
    protected String name;

    public NamedNode(String name) {
        this.name = name;
    }

    public NamedNode(Long id, String name) {
        this.oid = id;
        this.name = name;
    }

}
