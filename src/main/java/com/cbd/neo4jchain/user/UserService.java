package com.cbd.neo4jchain.user;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class UserService {
    
    private final UserRepository UserRepository;

    public UserService(UserRepository UserRepository) {
        this.UserRepository = UserRepository;
    }

    public List<User> getAllServices(){
        return this.UserRepository.findAll();
    }
}
