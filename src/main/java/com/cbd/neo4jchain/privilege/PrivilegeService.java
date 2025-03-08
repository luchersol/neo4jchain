package com.cbd.neo4jchain.privilege;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class PrivilegeService {

    PrivilegeRepository privilegeRepository;

    public PrivilegeService(PrivilegeRepository privilegeRepository) {
        this.privilegeRepository = privilegeRepository;
    }

    public Privilege getPrivilegeById(Long id) {
        return this.privilegeRepository.findById(id).orElseThrow();
    }

    public List<Privilege> getAllPrivilege() {
        return this.privilegeRepository.findAll();
    }

    public Privilege createPrivilege(Privilege privilege) {
        return this.privilegeRepository.save(privilege);
    }

    public Privilege updatePrivilege(Long privilegeId, Privilege privilege) {
        Privilege privilegeToUpdate = getPrivilegeById(privilegeId);
        BeanUtils.copyProperties(privilege, privilegeToUpdate, "id");
        return this.privilegeRepository.save(privilege);
    }

    public void deletePrivilege(Long privilegeId) {
        if (!this.privilegeRepository.existsById(privilegeId))
            throw new NotFoundResource(Privilege.class, "ID", privilegeId);
        this.privilegeRepository.deleteById(privilegeId);
    }


}
