package com.cbd.neo4jchain.scope;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class ScopeService {

    ScopeRepository scopeRepository;

    public ScopeService(ScopeRepository scopeRepository) {
        this.scopeRepository = scopeRepository;
    }

    public Scope getScopeById(Long id) {
        return this.scopeRepository.findById(id).orElseThrow();
    }

    public List<Scope> getAllScope() {
        return this.scopeRepository.findAll();
    }

    public Scope createScope(Scope scope) {
        return this.scopeRepository.save(scope);
    }

    public Scope updateScope(Long scopeId, Scope scope) {
        Scope scopeToUpdate = getScopeById(scopeId);
        BeanUtils.copyProperties(scope, scopeToUpdate, "id");
        return this.scopeRepository.save(scope);
    }

    public void deleteScope(Long scopeId) {
        if (!this.scopeRepository.existsById(scopeId))
            throw new NotFoundResource(Scope.class, "ID", scopeId);
        this.scopeRepository.deleteById(scopeId);
    }
}
