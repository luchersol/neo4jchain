package com.cbd.neo4jchain.team;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/team")
public class TeamController {

    private final TeamService teamService;

    public TeamController(TeamService teamService) {
        this.teamService = teamService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getTeamById(@PathVariable Long id) {
        return ResponseEntity.ok(this.teamService.getTeamById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllTeam() {
        return ResponseEntity.ok(this.teamService.getAllTeam());
    }

    @PostMapping
    public ResponseEntity<?> createTeam(@RequestBody @Valid TeamDTO team) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.teamService.createTeam(team));
    }

    @PostMapping("/{teamId}/{userId}")
    public ResponseEntity<?> addUserToTeam(@PathVariable Long teamId, @PathVariable Long userId) {
        Team team = teamService.addUserToTeam(teamId, userId);
        return ResponseEntity.ok(team);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateTeam(@RequestBody @Valid TeamDTO team, @PathVariable Long id) {
        this.teamService.updateTeam(id, team);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTeam(@PathVariable Long id) {
        this.teamService.deleteTeam(id);
        return ResponseEntity.noContent().build();
    }

}
