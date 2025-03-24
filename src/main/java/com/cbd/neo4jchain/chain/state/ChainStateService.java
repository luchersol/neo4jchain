package com.cbd.neo4jchain.chain.state;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.sla.SlaRepository;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.status.StatusRepository;

@Service
public class ChainStateService {

    ChainStateRepository chainStateRepository;

    StatusRepository statusRepository;

    SlaRepository slaRepository;

    public ChainStateService(ChainStateRepository chainStateRepository, StatusRepository statusRepository, SlaRepository slaRepository) {
        this.chainStateRepository = chainStateRepository;
        this.statusRepository = statusRepository;
        this.slaRepository = slaRepository;
    }

    public List<ChainState> getAllChainState() {
        return this.chainStateRepository.findAll();
    }

    public ChainState getChainStateById(Long id) {
        return this.chainStateRepository.findById(id).orElseThrow();
    }

    public ChainState createChainState(ChainStateDTO chainState) {
        ChainState newChainState = chainState.parse();
        List<Status> initialStatuses = statusRepository.findAllById(chainState.getInitial());
        List<Status> terminalStatuses = statusRepository.findAllById(chainState.getTerminal());
        Sla initialSla = slaRepository.findById(chainState.getInitialSla()).get();

        newChainState.setInitial(initialStatuses);
        newChainState.setTerminal(terminalStatuses);
        newChainState.setInitialSla(initialSla);

        return this.chainStateRepository.save(newChainState);
    }

    public ChainState updateChainState(Long chainStateId, ChainStateDTO chainStateDTO) {
        ChainState chainState = chainStateDTO.parse(); 
        ChainState chainStateToUpdate = getChainStateById(chainStateId);
        List<Status> initialStatuses = statusRepository.findAllById(chainStateDTO.getInitial());
        List<Status> terminalStatuses = statusRepository.findAllById(chainStateDTO.getTerminal());
        Sla initialSla = slaRepository.findById(chainStateDTO.getInitialSla()).get();

        chainState.setInitial(initialStatuses);
        chainState.setTerminal(terminalStatuses);
        chainState.setInitialSla(initialSla);
        BeanUtils.copyProperties(chainState, chainStateToUpdate, "id");
        return this.chainStateRepository.save(chainState);
    }

    public void deleteChainState(Long chainStateId) {
        if (!this.chainStateRepository.existsById(chainStateId))
            throw new NotFoundResource(ChainState.class, "ID", chainStateId);
        this.chainStateRepository.deleteById(chainStateId);
    }



}
