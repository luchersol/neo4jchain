package com.cbd.neo4jchain.chain.faceted;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class ChainFacetedService {

    ChainFacetedRepository chainFacetedRepository;

    public ChainFacetedService(ChainFacetedRepository chainFacetedRepository) {
        this.chainFacetedRepository = chainFacetedRepository;
    }
    public List<ChainFaceted> getAllChainFaceted() {
        return this.chainFacetedRepository.findAll();
    }

    public ChainFaceted getChainFacetedById(Long id) {
        return this.chainFacetedRepository.findById(id).orElseThrow();
    }

    public ChainFaceted createChainFaceted(ChainFacetedDTO chainFaceted) {
        return this.chainFacetedRepository.save(chainFaceted.parse());
    }

    public ChainFaceted updateChainFaceted(Long chainFacetedId, ChainFacetedDTO chainFaceted) {
        ChainFaceted chainFacetedToUpdate = getChainFacetedById(chainFacetedId);
        BeanUtils.copyProperties(chainFaceted, chainFacetedToUpdate, "id");
        return this.chainFacetedRepository.save(chainFacetedToUpdate);
    }

    public void deleteChainFaceted(Long chainFacetedId) {
        if (!this.chainFacetedRepository.existsById(chainFacetedId))
            throw new NotFoundResource(ChainFaceted.class, "ID", chainFacetedId);
        this.chainFacetedRepository.deleteById(chainFacetedId);
    }

}
