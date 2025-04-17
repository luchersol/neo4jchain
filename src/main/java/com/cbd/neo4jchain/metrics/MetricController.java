package com.cbd.neo4jchain.metrics;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cbd.neo4jchain.chain.state.ChainState;
import com.cbd.neo4jchain.chain.state.ChainStateService;
import com.cbd.neo4jchain.enums.OwnershipType;
import com.cbd.neo4jchain.status.Status;

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
        Double res = 100 * this.metricService.getGlobalPassedSLA(chainId);
        return ResponseEntity.ok(res);
    }

    // problematicOpenIssues: issues que están abiertas y que incumplen el TTO, el
    // TTR o ambos
    @GetMapping("/problematic_open_issues/{chainId}")
    public ResponseEntity<?> getProblematicOpenIssues(@PathVariable Long chainId) {
        Double res = 100 * this.metricService.getProblematicOpenIssues(chainId);
        return ResponseEntity.ok(res);
    }

    // passedTTO: porcentaje de issues abiertas y cerradas que cumplen con el TTO
    @GetMapping("/passed_tto/{chainId}")
    public ResponseEntity<?> getPassedTTO(@PathVariable Long chainId) {
        Double res = 100 * this.metricService.getPassedTTO(chainId);
        return ResponseEntity.ok(res);
    }

    // passedTTR: porcentaje de issues abiertas y cerradas que cumplen con el TTR
    @GetMapping("/passed_ttr/{chainId}")
    public ResponseEntity<?> getPassedTTR(@PathVariable Long chainId) {
        Double res = 100 * this.metricService.getPassedTTR(chainId);
        return ResponseEntity.ok(res);
    }

    // monthlyPassedSLA: porcentaje de issues cerradas este mes que cumplen con el
    // TTO y el TTR
    @GetMapping("/monthly_passed_sla/{chainId}")
    public ResponseEntity<?> getMonthlyPassedSLA(@PathVariable Long chainId) {
        Double res = 100 * this.metricService.getMonthlyPassedSLA(chainId);
        return ResponseEntity.ok(res);
    }

    // servicePassedTTO: el passedTTO pero de las issues de un servicio
    @GetMapping("/service_passed_tto/{serviceId}")
    public ResponseEntity<?> getServicePassedTTO(@PathVariable Long serviceId) {
        Double res = 100 * this.metricService.getServicePassedTTO(serviceId);
        return ResponseEntity.ok(res);
    }

    // sercivePassedTTR: el passedTTR pero de las issues de un servicio
    @GetMapping("/service_passed_ttr/{serviceId}")
    public ResponseEntity<?> getServicePassedTTR(@PathVariable Long serviceId) {
        Double res = 100 * this.metricService.getServicePassedTTR(serviceId);
        return ResponseEntity.ok(res);
    }

    @GetMapping("/graph_status/chainstate/{id}")
    public GraphResponse getGraphStatus(@PathVariable Long id) {
        // ChainState chainState = this.chainStateService.getChainStateById(id);
        // Crear estados
        Status statusA = new Status(1L, "Status A");
        Status statusB = new Status(2L, "Status B");
        Status statusC = new Status(3L, "Status C");
        Status statusD = new Status(4L, "Status D");

        // Relación de Status -> posibles siguientes estados
        statusA.setPossibleNextStatuses(List.of(statusB, statusD));
        statusB.setPossibleNextStatuses(List.of(statusC));
        statusC.setPossibleNextStatuses(List.of(statusD));
        statusD.setPossibleNextStatuses(List.of());

        // Crear ChainState con relaciones
        ChainState chainState = new ChainState(
                null,
                "ChainState Ejemplo",
                "v1.0",
                "Cadena de estados de prueba",
                OwnershipType.STATE);
        chainState.setInitial(List.of(statusA));
        chainState.setTerminal(List.of(statusD));

        return graphBuilderService.buildStatusGraph(chainState);
    }

}
