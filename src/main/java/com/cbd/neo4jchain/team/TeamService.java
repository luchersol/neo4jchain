package com.cbd.neo4jchain.team;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.person.PersonRepository;

@Service
public class TeamService {

    private final TeamRepository teamRepository;
    private final PersonRepository userRepository;

    public TeamService(TeamRepository teamRepository, PersonRepository userRepository) {
        this.teamRepository = teamRepository;
        this.userRepository = userRepository;
    }

    public Team getTeamById(Long id) {
        return this.teamRepository.findById(id).orElseThrow();
    }

    public List<Team> getAllTeam() {
        return this.teamRepository.findAll();
    }

    public Team createTeam(Team team) {
        return teamRepository.save(team);
    }

    public Team addUserToTeam(Long teamId, Long userId) {
        Team team = this.teamRepository.findById(teamId).orElseThrow();
        Person user = this.userRepository.findById(userId).orElseThrow();
        if (team.containsMember(user))
            throw new IllegalArgumentException("Team have user yet");

        team.addMember(user);
        return teamRepository.save(team);
    }

    public Team updateTeam(Long teamId, Team team) {
        Team teamToUpdate = getTeamById(teamId);
        BeanUtils.copyProperties(team, teamToUpdate, "id");
        return this.teamRepository.save(team);
    }

    public void deleteTeam(Long teamId) {
        if (!this.teamRepository.existsById(teamId))
            throw new NotFoundResource(Team.class, "ID", teamId);
        this.teamRepository.deleteById(teamId);
    }

}
