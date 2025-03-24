package com.cbd.neo4jchain.team;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.person.PersonRepository;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.role.RoleRepository;

@Service
public class TeamService {

    private final TeamRepository teamRepository;
    private final PersonRepository userRepository;
    RoleRepository roleRepository;

    public TeamService(TeamRepository teamRepository, PersonRepository userRepository, RoleRepository roleRepository) {
        this.teamRepository = teamRepository;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public Team getTeamById(Long id) {
        return this.teamRepository.findById(id).orElseThrow();
    }

    public List<Team> getAllTeam() {
        List<Team> teams = this.teamRepository.findAll();
        return teams;
    }

    public Team createTeam(TeamDTO team) {
        Team newTeam = team.parse();
        List<Person> memberList = userRepository.findAllById(team.getMembers());
        List<Role> roles = roleRepository.findAllById(team.getRoles());
        newTeam.setMembers(memberList);
        newTeam.setRoles(roles);
        return teamRepository.save(newTeam);
    }

    public Team addUserToTeam(Long teamId, Long userId) {
        Team team = this.teamRepository.findById(teamId).orElseThrow();
        Person user = this.userRepository.findById(userId).orElseThrow();
        if (team.containsMember(user))
            throw new IllegalArgumentException("Team have user yet");

        team.addMember(user);
        return teamRepository.save(team);
    }

    public Team updateTeam(Long teamId, TeamDTO teamDTO) {
        Team teamToUpdate = getTeamById(teamId);
        Team team = teamDTO.parse();
        List<Person> memberList = userRepository.findAllById(teamDTO.getMembers());
        List<Role> roles = roleRepository.findAllById(teamDTO.getRoles());
        team.setMembers(memberList);
        team.setRoles(roles);
        BeanUtils.copyProperties(team, teamToUpdate, "id");
        return this.teamRepository.save(teamToUpdate);
    }

    public void deleteTeam(Long teamId) {
        if (!this.teamRepository.existsById(teamId))
            throw new NotFoundResource(Team.class, "ID", teamId);
        this.teamRepository.deleteById(teamId);
    }

}
