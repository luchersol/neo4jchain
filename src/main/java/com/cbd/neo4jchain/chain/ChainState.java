package com.cbd.neo4jchain.chain;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.status.Status;

import lombok.Getter;

@Node
@Getter
public class ChainState extends Chain {

    @Relationship(type = "INITIAL")
    private Status initial;

    @Relationship(type = "TERMINAL")
    private Status terminal;

    @Relationship(type = "INITIAL_SLA")
    private Sla initialSla;
}
