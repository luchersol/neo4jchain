<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { entityDict } from '../stores/stores';

	let name = null;
	onMount(() => {
		name = localStorage.getItem('name');
	});

	function navigateTo(entity) {
		goto(`/${entity}`);
	}
</script>

<div class="container d-flex flex-column align-items-center mt-4">
	<div class="text-center">
		<h1 class="title">Neo4jChain</h1>
		<hr class="divider" />
	</div>
	<p class="subtitle">Manage your service chains easily.</p>

	<div class="button-row">
		{#if name !== null}
			<button
				class="btn-logout"
				on:click={() => {
					localStorage.removeItem('name');
					window.location.reload();
				}}
			>
				Log out
			</button>
		{:else}
			<button class="btn-login" on:click={() => navigateTo('login')}> Log in </button>
		{/if}
		<button class="btn-metrics" on:click={() => navigateTo('metrics')}> Metrics </button>
	</div>

	{#if name !== null}
		<div class="button-container mt-4">
			{#each Object.keys(entityDict).filter((i) => i !== 'Chain') as key}
				<button class="btn-square" on:click={() => navigateTo(key)}>
					{key}
				</button>
			{/each}
		</div>
	{/if}
</div>

<style>
	.container {
		max-width: 1200px;
		margin: 0 auto;
	}

	.title {
		font-family: Arial, sans-serif;
		font-size: 3rem;
		color: #333;
	}

	.divider {
		border: 1px solid #333;
		width: 100%;
		max-width: 600px;
	}

	.subtitle {
		font-family: Arial, sans-serif;
		font-size: 1.2rem;
		color: #555;
		text-align: center;
	}

	.button-row {
		display: flex;
		gap: 20px;
		margin-top: 20px;
	}

	.btn-login,
	.btn-logout,
	.btn-metrics {
		background-color: #007bff;
		color: white;
		border: none;
		padding: 10px 20px;
		font-size: 1.2rem;
		border-radius: 8px;
		cursor: pointer;
		transition: background 0.3s;
	}

	.btn-login:hover,
	.btn-metrics:hover {
		background-color: #0056b3;
	}

	.button-container {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 20px;
		margin-top: 20px;
	}

	.btn-square {
		width: 240px;
		height: 150px;
		background-color: white;
		border: 2px solid rgb(186, 186, 186);
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		font-size: 1.2rem;
		cursor: pointer;
		transition: all 0.3s;
	}

	.btn-square:hover {
		box-shadow: 0px 0px 10px 3px rgba(3, 35, 149, 0.2);
		background-color: rgb(222, 247, 255);
	}
</style>
