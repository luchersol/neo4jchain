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
        try {
            return ResponseEntity.ok(this.requestTypeService.getRequestTypeById(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllRequestTypes() {
        try {
            return ResponseEntity.ok(this.requestTypeService.getAllRequestType());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> createRequestType(@RequestBody @Valid RequestTypeDTO requestType) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(this.requestTypeService.createRequestType(requestType));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateRequestType(@RequestBody @Valid RequestTypeDTO requestType, @PathVariable Long id) {
        try {
            this.requestTypeService.updateRequestType(id, requestType);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteRequestType(@PathVariable Long id) {
        try {
            this.requestTypeService.deleteRequestType(id);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
