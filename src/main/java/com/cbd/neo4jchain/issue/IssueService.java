package com.cbd.neo4jchain.issue;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.person.PersonRepository;
import com.cbd.neo4jchain.request_type.RequestType;
import com.cbd.neo4jchain.request_type.RequestTypeRepository;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.service_org.ServiceOrgRepository;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.status.StatusRepository;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.team.TeamRepository;

@Service
public class IssueService {

    IssueRepository issueRepository;

    PersonRepository personRepository;

    TeamRepository teamRepository;

    ServiceOrgRepository serviceOrgRepository;

    StatusRepository statusRepository;

    RequestTypeRepository requestTypeRepository;


    public IssueService(IssueRepository issueRepository, PersonRepository personRepository, TeamRepository teamRepository, ServiceOrgRepository serviceOrgRepository, StatusRepository statusRepository, RequestTypeRepository requestTypeRepository) {
        this.issueRepository = issueRepository;
        this.personRepository = personRepository;
        this.teamRepository = teamRepository;
        this.serviceOrgRepository = serviceOrgRepository;
        this.statusRepository = statusRepository;
        this.requestTypeRepository = requestTypeRepository;
    }

    public List<Issue> getAllIssue() {
        return this.issueRepository.findAll();
    }

    public Issue getIssueById(Long id) {
        return this.issueRepository.findById(id).orElseThrow();
    }

    public Issue createIssue(IssueDTO issue) {
        Issue newIssue = issue.parse();
        newIssue.setCreatedAt(LocalDate.now());
        newIssue.setUpdatedAt(LocalDate.now());
        newIssue.setClosedAt(null);
        Person assignedPerson = personRepository.findById(issue.getAssignedPerson()).orElse(null);
        Person owner = personRepository.findById(issue.getOwner()).orElseThrow();
        Team team = teamRepository.findById(issue.getAssignedTeam()).orElse(null);
        ServiceOrg serviceOrg = serviceOrgRepository.findById(issue.getServiceOrg()).orElse(null);
        Status status = statusRepository.findById(issue.getStatus()).orElse(null);
        RequestType requestType = requestTypeRepository.findById(issue.getRequestType()).orElseThrow();

        newIssue.setAssignedPerson(assignedPerson);
        newIssue.setAssignedTeam(team);
        newIssue.setServiceOrg(serviceOrg);
        newIssue.setOwner(owner);
        newIssue.setStatus(status);
        newIssue.setRequestType(requestType);

        return this.issueRepository.save(newIssue);
    }

    public Issue updateIssue(Long issueId, IssueDTO issueDTO) {
        Issue issueToUpdate = getIssueById(issueId);

        Issue issue = issueDTO.parse();
        Person assignedPerson = personRepository.findById(issueDTO.getAssignedPerson()).orElse(null);
        Person owner = personRepository.findById(issueDTO.getOwner()).orElseThrow();
        Team team = teamRepository.findById(issueDTO.getAssignedTeam()).orElse(null);
        ServiceOrg serviceOrg = serviceOrgRepository.findById(issueDTO.getServiceOrg()).orElse(null);
        Status status = statusRepository.findById(issueDTO.getStatus()).orElse(null);

        issue.setAssignedPerson(assignedPerson);
        issue.setAssignedTeam(team);
        issue.setServiceOrg(serviceOrg);
        issue.setOwner(owner);
        issue.setStatus(status);
        issue.setUpdatedAt(LocalDate.now());
        if(status.getPossibleNextStatuses().size() == 0){
            issue.setClosedAt(LocalDate.now());
        }
        BeanUtils.copyProperties(issue, issueToUpdate, "id", "requestType");
        return this.issueRepository.save(issueToUpdate);
    }

    public void deleteIssue(Long issueId) {
        if (!this.issueRepository.existsById(issueId))
            throw new NotFoundResource(Issue.class, "ID", issueId);
        this.issueRepository.deleteById(issueId);
    }

}
