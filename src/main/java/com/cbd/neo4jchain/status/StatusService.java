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

    public Status createStatus(Status status) {
        return this.statusRepository.save(status);
    }

    public Status updateStatus(Long statusId, Status status) {
        Status statusToUpdate = getStatusById(statusId);
        BeanUtils.copyProperties(status, statusToUpdate, "id");
        return this.statusRepository.save(status);
    }

    public void deleteStatus(Long statusId) {
        if (!this.statusRepository.existsById(statusId))
            throw new NotFoundResource(Status.class, "ID", statusId);
        this.statusRepository.deleteById(statusId);
    }
}
