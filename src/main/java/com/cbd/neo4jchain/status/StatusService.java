package com.cbd.neo4jchain.status;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class StatusService {

    StatusRepository statusRepository;

    public StatusService(StatusRepository statusRepository) {
        this.statusRepository = statusRepository;
    }

    public Status getStatusById(Long id) {
        return this.statusRepository.findById(id).orElseThrow();
    }

    public List<Status> getAllStatus() {
        return this.statusRepository.findAll();
    }

    public Status createStatus(StatusDTO status) {
        Status newStatus = status.parse();
        List<Status> statuses =statusRepository.findAllById(status.getPossibleNextStatuses());
        newStatus.setPossibleNextStatuses(statuses);
        return this.statusRepository.save(newStatus);
    }

    public Status updateStatus(Long statusId, StatusDTO statusDTO) {
        Status statusToUpdate = getStatusById(statusId);
        Status status = statusDTO.parse();
        List<Status> statuses =statusRepository.findAllById(statusDTO.getPossibleNextStatuses());
        status.setPossibleNextStatuses(statuses);
        BeanUtils.copyProperties(status, statusToUpdate, "id");
        return this.statusRepository.save(statusToUpdate);
    }

    public void deleteStatus(Long statusId) {
        if (!this.statusRepository.existsById(statusId))
            throw new NotFoundResource(Status.class, "ID", statusId);
        this.statusRepository.deleteById(statusId);
    }
}
