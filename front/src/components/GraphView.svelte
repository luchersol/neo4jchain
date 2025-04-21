<script>
	import { onMount } from 'svelte';
	import { Network } from 'vis-network';

	export let graphData;
	export let enabled_physics;

	let container;
	let network;

	function createNetwork() {
		if (container && graphData?.nodes && graphData?.edges) {
			const options = {
				nodes: {
					shape: 'dot',
					size: 16,
					font: { size: 14 },
					color: {
						highlight: {
							border: '#000',
							background: undefined
						}
					}
				},
				edges: {
					arrows: { to: { enabled: true, scaleFactor: 0.5 } },
					font: { align: 'middle' },
					color: '#aaa'
				},
				physics: {
					enabled: enabled_physics,
					stabilization: false
				}
			};

			network = new Network(container, graphData, options);
		}
	}

	onMount(() => {
		createNetwork();
	});

	$: if (network && enabled_physics !== undefined) {
		network.setOptions({
			physics: { enabled: enabled_physics }
		});
	}
</script>

<div bind:this={container} class="graph-container"></div>

<style>
	.graph-container {
		width: 100%;
		height: 70vh;
		border: 1px solid grey;
	}
</style>
