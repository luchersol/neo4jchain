package com.cbd.neo4jchain.privilege;

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
@RequestMapping("/api/privilege")
public class PrivilegeController {

    PrivilegeService privilegeService;

    public PrivilegeController(PrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getPrivilegeById(@PathVariable Long id) {
        return ResponseEntity.ok(this.privilegeService.getPrivilegeById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllPrivileges() {
        return ResponseEntity.ok(this.privilegeService.getAllPrivilege());
    }

    @PostMapping
    public ResponseEntity<?> createPrivilege(@RequestBody @Valid PrivilegeDTO privilege) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.privilegeService.createPrivilege(privilege));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updatePrivilege(@RequestBody @Valid PrivilegeDTO privilege, @PathVariable Long id) {
        this.privilegeService.updatePrivilege(id, privilege);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePrivilege(@PathVariable Long id) {
        this.privilegeService.deletePrivilege(id);
        return ResponseEntity.noContent().build();
    }

}
