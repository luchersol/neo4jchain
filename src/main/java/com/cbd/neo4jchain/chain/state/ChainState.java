package com.cbd.neo4jchain.chain.state;

import java.util.List;

import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import com.cbd.neo4jchain.chain.Chain;
import com.cbd.neo4jchain.enums.OwnershipType;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.util.RelationName.ChainStateRelation;

import lombok.Getter;

@Node
@Getter
public class ChainState extends Chain {

    public ChainState(Long id, String name, String version, String description, OwnershipType ownershipType) {
        super(id, name, version, description, ownershipType);
    }

    @Relationship(type = ChainStateRelation.INITIAL_STATUS)
    private List<Status> initial;

    @Relationship(type = ChainStateRelation.TERMINAL_STATUS)
    private List<Status> terminal;

    @Relationship(type = ChainStateRelation.SLA)
    private Sla initialSla;
}
