package com.cbd.neo4jchain.team;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class TeamService {
    
    private final TeamRepository TeamRepository;

    public TeamService(TeamRepository TeamRepository) {
        this.TeamRepository = TeamRepository;
    }

    public List<Team> getAllServices(){
        return this.TeamRepository.findAll();
    }
}
