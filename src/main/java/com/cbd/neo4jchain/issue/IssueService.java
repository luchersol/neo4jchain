package com.cbd.neo4jchain.issue;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class IssueService {

    IssueRepository issueRepository;

    public IssueService(IssueRepository issueRepository) {
        this.issueRepository = issueRepository;
    }

    public List<Issue> getAllIssue() {
        return this.issueRepository.findAll();
    }

    public Issue getIssueById(Long id) {
        return this.issueRepository.findById(id).orElseThrow();
    }

    public Issue createIssue(Issue issue) {
        return this.issueRepository.save(issue);
    }

    public Issue updateIssue(Long issueId, Issue issue) {
        Issue issueToUpdate = getIssueById(issueId);
        BeanUtils.copyProperties(issue, issueToUpdate, "id");
        return this.issueRepository.save(issue);
    }

    public void deleteIssue(Long issueId) {
        if (!this.issueRepository.existsById(issueId))
            throw new NotFoundResource(Issue.class, "ID", issueId);
        this.issueRepository.deleteById(issueId);
    }

}
