package com.cbd.neo4jchain.role;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.privilege.Privilege;
import com.cbd.neo4jchain.privilege.PrivilegeRepository;

@Service
public class RoleService {

    RoleRepository roleRepository;

    PrivilegeRepository privilegeRepository;

    public RoleService(RoleRepository roleRepository, PrivilegeRepository privilegeRepository) {
        this.roleRepository = roleRepository;
        this.privilegeRepository = privilegeRepository;
    }

    public Role getRoleById(Long id) {
        return this.roleRepository.findById(id).orElseThrow();
    }

    public List<Role> getAllRole() {
        return this.roleRepository.findAll();
    }

    public Role createRole(RoleDTO role) {
        Role newRole = role.parse();
        List<Privilege> privileges = privilegeRepository.findAllById(role.getPrivileges());
        newRole.setPrivileges(privileges);
        return this.roleRepository.save(newRole);
    }

    public Role updateRole(Long roleId, RoleDTO roleDTO) {
       
        Role roleToUpdate = getRoleById(roleId);
        Role role = roleDTO.parse();
        List<Privilege> privileges = privilegeRepository.findAllById(roleDTO.getPrivileges());
        role.setPrivileges(privileges);

        BeanUtils.copyProperties(role, roleToUpdate, "id");
        return this.roleRepository.save(roleToUpdate);
    }

    public void deleteRole(Long roleId) {
        if (!this.roleRepository.existsById(roleId))
            throw new NotFoundResource(Role.class, "ID", roleId);
        this.roleRepository.deleteById(roleId);
    }
}
