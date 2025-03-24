package com.cbd.neo4jchain.sla;

import java.util.List;

import lombok.Getter;

@Getter
public class SlaDTO {

    private String name;

    List<Long> guarantees;

    public Sla parse(){
        return new Sla(null, name);
    }

}
