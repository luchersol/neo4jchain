package com.cbd.neo4jchain.scope;

import java.util.List;

import com.cbd.neo4jchain.enums.Priority;
import lombok.Getter;

@Getter
public class ScopeDTO {

    Priority priority;

    String name;

    Long requestType;

    List<Long> objectives;
}
