package com.cbd.neo4jchain.metrics;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/metrics")
public class MetricController {

    private final MetricService metricService;

    public MetricController(MetricService metricService) {
        this.metricService = metricService;
    }

    // globalPassedSLA: Porcentaje de issues cerradas que cumplen con el TTO y el
    // TTR a la vez
    @GetMapping("/global_passed_sla/{chainId}")
    public ResponseEntity<?> getGlobalPassedSLA(@PathVariable Long chainId) {
        Double res = this.metricService.getGlobalPassedSLA(chainId);
        return null;
    }

    // problematicOpenIssues: issues que están abiertas y que incumplen el TTO, el
    // TTR o ambos
    @GetMapping("/problematic_open_issues")
    public ResponseEntity<?> getProblematicOpenIssues() {
        return null;
    }

    // passedTTO: porcentaje de issues abiertas y cerradas que cumplen con el TTO
    @GetMapping("/passed_tto")
    public ResponseEntity<?> getPassedTTO() {
        return null;
    }

    // passedTTR: porcentaje de issues abiertas y cerradas que cumplen con el TTR
    @GetMapping("/passed_ttr")
    public ResponseEntity<?> getPassedTTR() {
        return null;
    }

    // monthlyPassedSLA: porcentaje de issues cerradas este mes que cumplen con el
    // TTO y el TTR
    @GetMapping("/monthly_passed_sla")
    public ResponseEntity<?> getMonthlyPassedSLA() {
        return null;
    }

    // servicePassedTTO: el passedTTO pero de las issues de un servicio
    @GetMapping("/service_passed_tto")
    public ResponseEntity<?> getServicePassedTTO() {
        return null;
    }

    // sercivePassedTTR: el passedTTR pero de las issues de un servicio
    @GetMapping("/service_passed_ttr")
    public ResponseEntity<?> getServicePassedTTR() {
        return null;
    }
}
