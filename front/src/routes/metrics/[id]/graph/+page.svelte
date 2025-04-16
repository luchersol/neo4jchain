<script>
	import { onMount } from 'svelte';
	import GraphView from '../../../../components/GraphView.svelte';
	import { BackendAPI } from '../../../../stores/stores';
	let graphData = null;

	onMount(async () => {
		try {
			const res = await fetch(`${BackendAPI}/api/metrics/graph_status/chainstate/2`);
			if (!res.ok) {
				throw new Error('Error al cargar el grafo');
			}
			graphData = await res.json();
			console.log('Grafo cargado:', graphData);
		} catch (error) {
			console.error('Error al obtener el grafo:', error);
		}
	});
</script>

{#if graphData}
	<GraphView {graphData} />
{:else}
	<p>Cargando grafo...</p>
{/if}
