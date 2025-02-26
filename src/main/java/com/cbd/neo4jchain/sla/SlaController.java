package com.cbd.neo4jchain.sla;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/slas")
public class SlaController {
    
    private final SlaService SlaService;

    public SlaController(SlaService SlaService) {
        this.SlaService = SlaService;
    }

    @GetMapping
    public ResponseEntity<?> getAllSlas() {
        return ResponseEntity.ok(SlaService.getAllServices());
    }
    
}
