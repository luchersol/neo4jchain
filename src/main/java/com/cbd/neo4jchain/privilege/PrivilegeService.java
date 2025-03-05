package com.cbd.neo4jchain.privilege;

import org.springframework.stereotype.Service;

@Service
public class PrivilegeService {

    PrivilegeRepository privilegeRepository;

    public PrivilegeService(PrivilegeRepository privilegeRepository) {
        this.privilegeRepository = privilegeRepository;
    }
}
