package com.cbd.neo4jchain.chain.state;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class ChainStateService {

    ChainStateRepository chainStateRepository;

    public ChainStateService(ChainStateRepository chainStateRepository) {
        this.chainStateRepository = chainStateRepository;
    }

    public List<ChainState> getAllChainState() {
        return this.chainStateRepository.findAll();
    }

    public ChainState getChainStateById(Long id) {
        return this.chainStateRepository.findById(id).orElseThrow();
    }

    public ChainState createChainState(ChainState chainState) {
        return this.chainStateRepository.save(chainState);
    }

    public ChainState updateChainState(Long chainStateId, ChainState chainState) {
        ChainState chainStateToUpdate = getChainStateById(chainStateId);
        BeanUtils.copyProperties(chainState, chainStateToUpdate, "id");
        return this.chainStateRepository.save(chainState);
    }

    public void deleteChainState(Long chainStateId) {
        if (!this.chainStateRepository.existsById(chainStateId))
            throw new NotFoundResource(ChainState.class, "ID", chainStateId);
        this.chainStateRepository.deleteById(chainStateId);
    }



}
