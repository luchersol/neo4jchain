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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/privilege")
public class PrivilegeController {

    PrivilegeService privilegeService;

    public PrivilegeController(PrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getPrivilegeById(@RequestParam Long id) {
        try {
            return ResponseEntity.ok(this.privilegeService.getPrivilegeById(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllPrivileges() {
        try {
            return ResponseEntity.ok(this.privilegeService.getAllPrivilege());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createPrivilege(@RequestBody @Valid Privilege privilege) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(this.privilegeService.createPrivilege(privilege));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updatePrivilege(@RequestBody @Valid Privilege privilege, @PathVariable Long id) {
        try {
            this.privilegeService.updatePrivilege(id, privilege);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deletePrivilege(@PathVariable Long id) {
        try {
            this.privilegeService.deletePrivilege(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


}
