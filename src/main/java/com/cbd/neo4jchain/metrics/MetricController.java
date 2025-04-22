package com.cbd.neo4jchain.metrics;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cbd.neo4jchain.chain.state.ChainState;
import com.cbd.neo4jchain.chain.state.ChainStateService;
import com.cbd.neo4jchain.exception.NoIssuesException;

@RestController
@RequestMapping("/api/metrics")
public class MetricController {

    private final MetricService metricService;
    private final ChainStateService chainStateService;
    private final GraphBuilderService graphBuilderService;

    public MetricController(MetricService metricService, ChainStateService chainStateService,
            GraphBuilderService graphBuilderService) {
        this.metricService = metricService;
        this.chainStateService = chainStateService;
        this.graphBuilderService = graphBuilderService;
    }

    // globalPassedSLA: Porcentaje de issues cerradas que cumplen con el TTO y el
    // TTR a la vez
    @GetMapping("/global_passed_sla/{chainId}")
    public ResponseEntity<Double> getGlobalPassedSLA(@PathVariable Long chainId) {
        try {
            Double res = 100 * this.metricService.getGlobalPassedSLA(chainId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0.);
        }

    }

    // problematicOpenIssues: issues que están abiertas y que incumplen el TTO, el
    // TTR o ambos
    @GetMapping("/problematic_open_issues/{chainId}")
    public ResponseEntity<?> getProblematicOpenIssues(@PathVariable Long chainId) {
        try {
            Long res = this.metricService.getProblematicOpenIssues(chainId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0L);
        }
    }

    // passedTTO: porcentaje de issues abiertas y cerradas que cumplen con el TTO
    @GetMapping("/passed_tto/{chainId}")
    public ResponseEntity<?> getPassedTTO(@PathVariable Long chainId) {
        try {
            Double res = 100 * this.metricService.getPassedTTO(chainId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0.);
        }
    }

    // passedTTR: porcentaje de issues abiertas y cerradas que cumplen con el TTR
    @GetMapping("/passed_ttr/{chainId}")
    public ResponseEntity<?> getPassedTTR(@PathVariable Long chainId) {
        try {
            Double res = 100 * this.metricService.getPassedTTR(chainId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0.);
        }
    }

    // monthlyPassedSLA: porcentaje de issues cerradas este mes que cumplen con el
    // TTO y el TTR
    @GetMapping("/monthly_passed_sla/{chainId}")
    public ResponseEntity<?> getMonthlyPassedSLA(@PathVariable Long chainId) {
        try {
            Double res = 100 * this.metricService.getMonthlyPassedSLA(chainId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0.);
        }
    }

    // servicePassedTTO: el passedTTO pero de las issues de un servicio
    @GetMapping("/service_passed_tto/{serviceId}")
    public ResponseEntity<?> getServicePassedTTO(@PathVariable Long serviceId) {
        try {
            Double res = 100 * this.metricService.getServicePassedTTO(serviceId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0.);
        }
    }

    // sercivePassedTTR: el passedTTR pero de las issues de un servicio
    @GetMapping("/service_passed_ttr/{serviceId}")
    public ResponseEntity<?> getServicePassedTTR(@PathVariable Long serviceId) {
        try {
            Double res = 100 * this.metricService.getServicePassedTTR(serviceId);
            return ResponseEntity.ok(res);
        } catch (NoIssuesException e) {
            return ResponseEntity.ok(0.);
        }
    }

    @GetMapping("/graph_status/chainstate/{id}")
    public GraphResponse getGraphStatus(@PathVariable Long id) {
        ChainState chainState = this.chainStateService.getChainStateById(id);
        return graphBuilderService.buildStatusGraph(chainState);
    }

}
