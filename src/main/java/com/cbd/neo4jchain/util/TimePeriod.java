package com.cbd.neo4jchain.util;

import java.time.Duration;
import java.time.LocalDateTime;

import org.springframework.data.neo4j.core.schema.Node;

import com.cbd.neo4jchain.model.AbstractNode;

import lombok.Getter;

@Getter
@Node
public class TimePeriod extends AbstractNode {
    
    private LocalDateTime startDateTime;
    private LocalDateTime endDateTime;

    public TimePeriod(LocalDateTime startDateTime, LocalDateTime endDateTime) {
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
    }

    public void setStartDateTime(LocalDateTime startDateTime) {
        if(startDateTime != null && this.endDateTime != null && startDateTime.isAfter(this.endDateTime)){
            throw new IllegalArgumentException("Incorrect value");
        }
        this.startDateTime = startDateTime;
    }

    public void setEndDateTime(LocalDateTime endDateTime) {
        if(endDateTime != null && this.startDateTime != null && endDateTime.isBefore(this.startDateTime)){
            throw new IllegalArgumentException("Incorrect value");
        }
        this.endDateTime = endDateTime;
    }

    public Duration getDuration(){
        return Duration.between(startDateTime, endDateTime);
    }
}
