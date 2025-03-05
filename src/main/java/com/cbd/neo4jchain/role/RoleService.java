package com.cbd.neo4jchain.role;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class RoleService {

    RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role getRoleById(Long id) {
        return this.roleRepository.findById(id).orElseThrow();
    }

    public List<Role> getAllRole() {
        return this.roleRepository.findAll();
    }

    public Role createRole(Role role) {
        return this.roleRepository.save(role);
    }

    public Role updateRole(Long roleId, Role role) {
        Role roleToUpdate = getRoleById(roleId);
        BeanUtils.copyProperties(role, roleToUpdate, "id");
        return this.roleRepository.save(role);
    }

    public void deleteRole(Long roleId) {
        if (!this.roleRepository.existsById(roleId))
            throw new NotFoundResource(Role.class, "ID", roleId);
        this.roleRepository.deleteById(roleId);
    }
}
