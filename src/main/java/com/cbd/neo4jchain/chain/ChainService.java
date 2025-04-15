package com.cbd.neo4jchain.chain;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.sla.SlaRepository;
import com.cbd.neo4jchain.status.StatusRepository;

@Service
public class ChainService {

    ChainRepository chainRepository;

    StatusRepository statusRepository;

    SlaRepository slaRepository;

    public ChainService(ChainRepository chainRepository, StatusRepository statusRepository,
            SlaRepository slaRepository) {
        this.chainRepository = chainRepository;
        this.statusRepository = statusRepository;
        this.slaRepository = slaRepository;
    }

    public List<Chain> getAllChain() {
        return this.chainRepository.findAll();
    }

    public Chain getChainById(Long id) {
        return this.chainRepository.findById(id).orElseThrow();
    }

    public void deleteChain(Long chainId) {
        if (!this.chainRepository.existsById(chainId))
            throw new NotFoundResource(Chain.class, "ID", chainId);
        this.chainRepository.deleteById(chainId);
    }

}
