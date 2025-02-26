package com.cbd.neo4jchain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class NamedNode extends AbstractNode {
    protected String name;
}
