package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.scope.Scope;
import com.cbd.neo4jchain.scope.ScopeRepository;

@Service
public class SlaService {

    SlaRepository slaRepository;

    ScopeRepository scopeRepository;

    public SlaService(SlaRepository slaRepository, ScopeRepository scopeRepository) {
        this.slaRepository = slaRepository;
        this.scopeRepository = scopeRepository;
    }

    public Sla getSlaById(Long id) {
        return this.slaRepository.findById(id).orElseThrow();
    }

    public List<Sla> getAllSla() {
        return this.slaRepository.findAll();
    }

    public Sla createSla(SlaDTO sla) {
        Sla newSla = sla.parse();
        List<Scope> scopes = scopeRepository.findAllById(sla.getGuarantees());
        newSla.setGuarantees(scopes);

        return this.slaRepository.save(newSla);
    }

    public Sla updateSla(Long slaId, SlaDTO slaDTO) {
        Sla slaToUpdate = getSlaById(slaId);

        Sla sla = slaDTO.parse();
        List<Scope> scopes = scopeRepository.findAllById(slaDTO.getGuarantees());
        sla.setGuarantees(scopes);

        BeanUtils.copyProperties(sla, slaToUpdate, "id");
        return this.slaRepository.save(slaToUpdate);
    }

    public void deleteSla(Long slaId) {
        if (!this.slaRepository.existsById(slaId))
            throw new NotFoundResource(Sla.class, "ID", slaId);
        this.slaRepository.deleteById(slaId);
    }
}
