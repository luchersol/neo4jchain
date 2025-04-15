package com.cbd.neo4jchain.issue;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NoUpdateAllowed;
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

    private final IssueRepository issueRepository;
    private final PersonRepository personRepository;
    private final TeamRepository teamRepository;
    private final ServiceOrgRepository serviceOrgRepository;
    private final StatusRepository statusRepository;
    private final RequestTypeRepository requestTypeRepository;

    public IssueService(IssueRepository issueRepository, PersonRepository personRepository,
            TeamRepository teamRepository, ServiceOrgRepository serviceOrgRepository,
            StatusRepository statusRepository, RequestTypeRepository requestTypeRepository) {
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
        newIssue.setCreatedAt(LocalDateTime.now());
        newIssue.setLastAssignedAt(null);
        newIssue.setLastStateChangedAt(null);
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
        if (issueToUpdate.getClosedAt() != null)
            throw new NoUpdateAllowed(Issue.class, "ID", issueId);

        Double issueTTO = issueToUpdate.getTTO();
        Double issueTTR = issueToUpdate.getTTR();

        Issue issue = issueDTO.parse();
        Person assignedPerson = personRepository.findById(issueDTO.getAssignedPerson()).orElse(null);
        Person owner = personRepository.findById(issueDTO.getOwner()).orElseThrow();
        Team team = teamRepository.findById(issueDTO.getAssignedTeam()).orElse(null);
        ServiceOrg serviceOrg = serviceOrgRepository.findById(issueDTO.getServiceOrg()).orElse(null);
        Status status = statusRepository.findById(issueDTO.getStatus()).orElse(null);

        Boolean hasChangedState = issueToUpdate.getStatus().getId() != status.getId();
        Boolean hasChangedAssgined = issueToUpdate.getAssignedPerson().getId() != status.getId();

        if (hasChangedState) {
            issueTTR += ChronoUnit.SECONDS.between(LocalDateTime.now(), issueToUpdate.getLastStateChangedAt());
            issue.setLastStateChangedAt(LocalDateTime.now());
        }

        if (hasChangedAssgined) {
            issueTTO += ChronoUnit.SECONDS.between(LocalDateTime.now(), issueToUpdate.getLastAssignedAt());
            issue.setLastAssignedAt(LocalDateTime.now());
        }

        issue.setAssignedPerson(assignedPerson);
        issue.setAssignedTeam(team);
        issue.setServiceOrg(serviceOrg);
        issue.setOwner(owner);
        issue.setStatus(status);

        if (status.getPossibleNextStatuses().isEmpty()) {
            issue.setClosedAt(LocalDateTime.now());
        }
        issue.setTTO(issueTTO);
        issue.setTTR(issueTTR);
        BeanUtils.copyProperties(issue, issueToUpdate, "id", "requestType");
        return this.issueRepository.save(issueToUpdate);
    }

    public void deleteIssue(Long issueId) {
        if (!this.issueRepository.existsById(issueId))
            throw new NotFoundResource(Issue.class, "ID", issueId);
        this.issueRepository.deleteById(issueId);
    }

}
