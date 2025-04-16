package com.cbd.neo4jchain.metrics;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.cbd.neo4jchain.chain.state.ChainState;
import com.cbd.neo4jchain.status.Status;

@Service
public class GraphBuilderService {

    private static final String INITIAL_COLOR = "#4caf50";
    private static final String INTERMEDIAL_COLOR = "#2196f3";
    private static final String TERMINAL_COLOR = "#f44336";

    public GraphResponse buildStatusGraph(ChainState chainState) {
        Set<GraphResponse.GraphNode> nodes = new HashSet<>();
        Set<GraphResponse.GraphEdge> edges = new HashSet<>();
        Map<Long, GraphResponse.GraphNode> nodesMap = new HashMap<>();

        Set<Long> terminalIds = chainState.getTerminal() != null
                ? chainState.getTerminal().stream().map(Status::getId).collect(Collectors.toSet())
                : Collections.emptySet();

        Set<Long> initialIds = chainState.getInitial() != null
                ? chainState.getInitial().stream().map(Status::getId).collect(Collectors.toSet())
                : Collections.emptySet();

        Set<Long> visited = new HashSet<>();

        if (chainState.getInitial() != null) {
            for (Status initial : chainState.getInitial()) {
                processStatusRecursive(initial, nodes, edges, nodesMap, visited, initialIds, terminalIds);
            }
        }

        if (chainState.getTerminal() != null) {
            for (Status terminal : chainState.getTerminal()) {
                // En caso de que haya terminales no alcanzados desde inicial
                if (!nodesMap.containsKey(terminal.getId())) {
                    GraphResponse.GraphNode node = createNode(terminal, terminalIds, initialIds);
                    nodes.add(node);
                    nodesMap.put(terminal.getId(), node);
                }
            }
        }

        GraphResponse graphResponse = new GraphResponse();
        graphResponse.setNodes(nodes);
        graphResponse.setEdges(edges);
        return graphResponse;
    }

    private void processStatusRecursive(
            Status current,
            Set<GraphResponse.GraphNode> nodes,
            Set<GraphResponse.GraphEdge> edges,
            Map<Long, GraphResponse.GraphNode> nodesMap,
            Set<Long> visited,
            Set<Long> initialIds,
            Set<Long> terminalIds) {
        if (visited.contains(current.getId()))
            return;
        visited.add(current.getId());

        GraphResponse.GraphNode currentNode = createNode(current, terminalIds, initialIds);
        nodes.add(currentNode);
        nodesMap.put(current.getId(), currentNode);

        if (current.getPossibleNextStatuses() != null) {
            for (Status next : current.getPossibleNextStatuses()) {
                GraphResponse.GraphNode nextNode = nodesMap.get(next.getId());
                if (nextNode == null) {
                    nextNode = createNode(next, terminalIds, initialIds);
                    nodes.add(nextNode);
                    nodesMap.put(next.getId(), nextNode);
                }

                edges.add(new GraphResponse.GraphEdge(current.getId(), next.getId(), ""));

                processStatusRecursive(next, nodes, edges, nodesMap, visited, initialIds, terminalIds);
            }
        }
    }

    private GraphResponse.GraphNode createNode(Status status, Set<Long> terminalIds, Set<Long> initialIds) {
        GraphResponse.GraphNode node = new GraphResponse.GraphNode();
        node.setId(status.getId());
        node.setLabel(status.getName());

        if (initialIds.contains(status.getId())) {
            node.setColor(INITIAL_COLOR);
        } else if (terminalIds.contains(status.getId())) {
            node.setColor(TERMINAL_COLOR);
        } else {
            node.setColor(INTERMEDIAL_COLOR);
        }

        return node;
    }
}
