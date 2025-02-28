package com.cbd.neo4jchain.team;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;


@RestController
@RequestMapping("/api/v1/teams")
public class TeamController {
    
    private final TeamService teamService;

    public TeamController(TeamService teamService) {
        this.teamService = teamService;
    }

    @GetMapping
    public ResponseEntity<?> getAllTeams() {
        return ResponseEntity.ok(teamService.getAllServices());
    }

    @PostMapping
    public ResponseEntity<?> createTeam(@Valid @RequestBody Team team) {
        return ResponseEntity.ok(teamService.createTeam(team));
    }
    
    
    @PostMapping("/{teamId}/{userId}")
    public ResponseEntity<?> addUserToTeam(@PathVariable Long teamId, @PathVariable Long userId) {
        try {
            Team team = teamService.addUserToTeam(teamId, userId);
            return ResponseEntity.ok(team);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
}
