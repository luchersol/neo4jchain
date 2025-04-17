package com.cbd.neo4jchain.request_type;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/requesttype")
public class RequestTypeController {

    RequestTypeService requestTypeService;

    public RequestTypeController(RequestTypeService requestTypeService) {
        this.requestTypeService = requestTypeService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getRequestTypeById(@PathVariable Long id) {
        return ResponseEntity.ok(this.requestTypeService.getRequestTypeById(id));
    }

    @GetMapping
    public ResponseEntity<?> getAllRequestTypes() {
        return ResponseEntity.ok(this.requestTypeService.getAllRequestType());
    }

    @PostMapping
    public ResponseEntity<?> createRequestType(@RequestBody @Valid RequestTypeDTO requestType) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(this.requestTypeService.createRequestType(requestType));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateRequestType(@RequestBody @Valid RequestTypeDTO requestType, @PathVariable Long id) {
        this.requestTypeService.updateRequestType(id, requestType);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteRequestType(@PathVariable Long id) {
        this.requestTypeService.deleteRequestType(id);
        return ResponseEntity.noContent().build();
    }

}
