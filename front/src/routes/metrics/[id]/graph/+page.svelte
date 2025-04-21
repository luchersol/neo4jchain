<script>
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import GraphView from '../../../../components/GraphView.svelte';
	import Throbber from '../../../../components/throbber.svelte';
	import Title from '../../../../components/title.svelte';
	import { BackendAPI } from '../../../../stores/stores';
	let graphData = null;
	let id = $page.params.id;
	let enabled_physics = false;

	onMount(async () => {
		try {
			const res = await fetch(`${BackendAPI}/api/metrics/graph_status/chainstate/${id}`);
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

<Title subtitle={'State graphs'}></Title>

<div class="legend">
	<label>
		<input type="checkbox" bind:checked={enabled_physics} />
		Enable physics
	</label>
	<div class="box">
		<div><span class="dot green"></span> Initial</div>
		<div><span class="dot blue"></span> Intermediate</div>
		<div><span class="dot red"></span> Terminal</div>
	</div>
</div>

{#if graphData}
	<div class="container">
		<GraphView {graphData} {enabled_physics} />
	</div>
{:else}
	<Throbber message={'Loading...'} />
{/if}

<style>
	.legend {
		display: flex;
		justify-content: center;
		gap: 2rem;
		font-size: 14px;
		color: #333;
	}

	.box {
		border: 1px solid grey;
		display: flex;
		justify-content: center;
		gap: 2rem;
		font-size: 14px;
		color: #333;
		padding: 3px;
	}

	.container {
		display: flex;
		flex-wrap: wrap;
		gap: 1rem;
		justify-content: center;
	}

	.dot {
		display: inline-block;
		width: 12px;
		height: 12px;
		border-radius: 50%;
		margin-right: 0.5rem;
	}

	.red {
		background-color: red;
	}

	.green {
		background-color: green;
	}

	.blue {
		background-color: blue;
	}
</style>
