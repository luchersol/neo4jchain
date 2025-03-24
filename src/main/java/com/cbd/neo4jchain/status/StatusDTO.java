package com.cbd.neo4jchain.status;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StatusDTO {

    String name;

    List<Long> possibleNextStatuses;

}
