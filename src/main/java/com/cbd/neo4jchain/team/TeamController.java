package com.cbd.neo4jchain.team;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/teams")
public class TeamController {
    
    private final TeamService TeamService;

    public TeamController(TeamService TeamService) {
        this.TeamService = TeamService;
    }

    @GetMapping
    public ResponseEntity<?> getAllTeams() {
        return ResponseEntity.ok(TeamService.getAllServices());
    }
    
}
