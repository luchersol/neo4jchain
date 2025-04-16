<script>
	import { onMount } from 'svelte';
	import { Network } from 'vis-network';

	export let graphData;

	let container;

	onMount(() => {
		if (container && graphData?.nodes && graphData?.edges) {
			const options = {
				nodes: {
					shape: 'dot',
					size: 16,
					font: { size: 14 }
				},
				edges: {
					arrows: { to: { enabled: true, scaleFactor: 0.5 } },
					font: { align: 'middle' },
					color: '#aaa'
				},
				physics: {
					enabled: true,
					stabilization: false
				}
			};

			new Network(container, graphData, options);
		}
	});
</script>

<div bind:this={container} class="graph-container"></div>

<style>
	.graph-container {
		width: 100%;
		height: 600px;
		border: 1px solid #ccc;
	}
</style>
