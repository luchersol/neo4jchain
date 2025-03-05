package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class SlaService {

    SlaRepository slaRepository;

    public SlaService(SlaRepository slaRepository) {
        this.slaRepository = slaRepository;
    }

    public Sla getSlaById(Long id) {
        return this.slaRepository.findById(id).orElseThrow();
    }

    public List<Sla> getAllSla() {
        return this.slaRepository.findAll();
    }

    public Sla createSla(Sla sla) {
        return this.slaRepository.save(sla);
    }

    public Sla updateSla(Long slaId, Sla sla) {
        Sla slaToUpdate = getSlaById(slaId);
        BeanUtils.copyProperties(sla, slaToUpdate, "id");
        return this.slaRepository.save(sla);
    }

    public void deleteSla(Long slaId) {
        if (!this.slaRepository.existsById(slaId))
            throw new NotFoundResource(Sla.class, "ID", slaId);
        this.slaRepository.deleteById(slaId);
    }
}
