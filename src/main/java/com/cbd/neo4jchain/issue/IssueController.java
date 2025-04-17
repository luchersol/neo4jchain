package com.cbd.neo4jchain.issue;

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
@RequestMapping("/api/issue")
public class IssueController {

    IssueService issueService;

    public IssueController(IssueService issueService) {
        this.issueService = issueService;
    }

    @GetMapping
    public ResponseEntity<?> getAllIssues() {
        return ResponseEntity.ok(issueService.getAllIssue());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getIssueById(@PathVariable Long id) {
        return ResponseEntity.ok(this.issueService.getIssueById(id));
    }

    @PostMapping
    public ResponseEntity<?> createIssue(@RequestBody @Valid IssueDTO issue) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.issueService.createIssue(issue));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateIssue(@RequestBody @Valid IssueDTO issue, @PathVariable Long id) {
        this.issueService.updateIssue(id, issue);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteIssue(@PathVariable Long id) {
        this.issueService.deleteIssue(id);
        return ResponseEntity.noContent().build();
    }

}
