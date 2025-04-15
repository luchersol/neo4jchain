<script>
    import Title from '../../components/title.svelte'
    import { BackendAPI } from '../../stores/stores';
    import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import Throbber from '../../components/throbber.svelte';

	let entity = $page.params.entity;
	let data = [];
	let isLoading = true;

	async function fetchInfo() {
		try {
			const chainfacetedResponse = await fetch(`${BackendAPI}/api/chainfaceted`);
			const chainstateResponse = await fetch(`${BackendAPI}/api/chainstate`);
			const chainfacetedList = await chainfacetedResponse.json();
            const chainstateList = await chainstateResponse.json()
            data.push(...chainfacetedList)
            data.push(...chainstateList)
            console.log(JSON.stringify(data))
			isLoading = false;
		} catch (error) {
			data = 'There was an error retrieving the info: ' + error;
		}
	}

	onMount(async () => {
		await fetchInfo();
	});

</script>

<Title subtitle={'Select a service chain to view its metrics'}></Title>

{#if isLoading}
	<Throbber message={'Loading...'} />
{:else if data.length === 0}
	<div class="container">
		<p>No data retrieved</p>
	</div>
{:else}
	<div class="container">
		{#each data as element}
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<!-- svelte-ignore a11y-no-static-element-interactions -->
			<div
				class="card"
				on:click={() => (window.location.href = `/metrics/${entity}/${element.id}`)}
				style="cursor: pointer;"
			>
				<h3>{element.name}</h3>

			</div>
		{/each}
	</div>
{/if}

<style>
	.container {
		display: flex;
		flex-wrap: wrap;
		gap: 1rem;
		justify-content: center;
	}
	.card {
		background: #ffffff;
		border-radius: 10px;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		padding: 1.5rem;
		width: 300px;
		text-align: center;
		transition: transform 0.3s ease-in-out;
	}

	.card:hover {
		transform: scale(1.05);
	}

	h3 {
		color: #333;
		font-size: 1.2rem;
		margin-bottom: 0.5rem;
	}

	p {
		min-height: 40px;
		color: #555;
		font-size: 1rem;
		margin: 0.25rem 0;
	}

</style>
