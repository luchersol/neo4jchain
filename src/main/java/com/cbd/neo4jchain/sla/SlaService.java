package com.cbd.neo4jchain.sla;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class SlaService {
    
    private final SlaRepository SlaRepository;

    public SlaService(SlaRepository SlaRepository) {
        this.SlaRepository = SlaRepository;
    }

    public List<Sla> getAllServices(){
        return this.SlaRepository.findAll();
    }
}
