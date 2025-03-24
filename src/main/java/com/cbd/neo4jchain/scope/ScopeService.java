package com.cbd.neo4jchain.scope;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.objective.ObjectiveRepository;
import com.cbd.neo4jchain.request_type.RequestType;
import com.cbd.neo4jchain.request_type.RequestTypeRepository;

@Service
public class ScopeService {

    ScopeRepository scopeRepository;

    ObjectiveRepository objectiveRepository;

    RequestTypeRepository requestTypeRepository;

    public ScopeService(ScopeRepository scopeRepository, ObjectiveRepository objectiveRepository, RequestTypeRepository requestTypeRepository) {
        this.scopeRepository = scopeRepository;
        this.objectiveRepository = objectiveRepository;
        this.requestTypeRepository = requestTypeRepository;
    }

    public Scope getScopeById(Long id) {
        return this.scopeRepository.findById(id).orElseThrow();
    }

    public List<Scope> getAllScope() {
        return this.scopeRepository.findAll();
    }

    public Scope createScope(ScopeDTO scope) {
        Scope newScope = scope.parse();
        List<Objective> objectives = objectiveRepository.findAllById(scope.getObjectives());
        RequestType requestType = requestTypeRepository.findById(scope.getRequestType()).orElse(null);
        newScope.setObjectives(objectives);
        newScope.setRequestType(requestType);

        return this.scopeRepository.save(newScope);
    }

    public Scope updateScope(Long scopeId, ScopeDTO scopeDTO) {
        Scope scopeToUpdate = getScopeById(scopeId);

        Scope scope = scopeDTO.parse();
        List<Objective> objectives = objectiveRepository.findAllById(scopeDTO.getObjectives());
        RequestType requestType = requestTypeRepository.findById(scopeDTO.getRequestType()).orElse(null);
        scope.setObjectives(objectives);
        scope.setRequestType(requestType);

        BeanUtils.copyProperties(scope, scopeToUpdate, "id");
        return this.scopeRepository.save(scopeToUpdate);
    }

    public void deleteScope(Long scopeId) {
        if (!this.scopeRepository.existsById(scopeId))
            throw new NotFoundResource(Scope.class, "ID", scopeId);
        this.scopeRepository.deleteById(scopeId);
    }
}
