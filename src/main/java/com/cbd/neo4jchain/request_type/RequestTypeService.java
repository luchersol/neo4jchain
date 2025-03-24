package com.cbd.neo4jchain.request_type;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.exception.NotFoundResource;

@Service
public class RequestTypeService {

    RequestTypeRepository requestTypeRepository;

    public RequestTypeService(RequestTypeRepository requestTypeRepository) {
        this.requestTypeRepository = requestTypeRepository;
    }

    public RequestType getRequestTypeById(Long id) {
        return this.requestTypeRepository.findById(id).orElseThrow();
    }

    public List<RequestType> getAllRequestType() {
        return this.requestTypeRepository.findAll();
    }

    public RequestType createRequestType(RequestTypeDTO requestType) {
        return this.requestTypeRepository.save(requestType.parse());
    }

    public RequestType updateRequestType(Long requestTypeId, RequestTypeDTO requestType) {
        RequestType requestTypeToUpdate = getRequestTypeById(requestTypeId);
        BeanUtils.copyProperties(requestType.parse(), requestTypeToUpdate, "id");
        return this.requestTypeRepository.save(requestTypeToUpdate);
    }

    public void deleteRequestType(Long requestTypeId) {
        if (!this.requestTypeRepository.existsById(requestTypeId))
            throw new NotFoundResource(RequestType.class, "ID", requestTypeId);
        this.requestTypeRepository.deleteById(requestTypeId);
    }
}
