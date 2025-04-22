<script>
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import SlaPieCharts from '../../../components/slaPieCharts.svelte';
	import Throbber from '../../../components/throbber.svelte';
	import Title from '../../../components/title.svelte';
	import TTOandTTRCharts from '../../../components/ttoAndttrCharts.svelte';
	import { BackendAPI } from '../../../stores/stores';

	let id = $page.params.id;
	let type = $page.url.searchParams.get('type');
	let data = {};
	let isLoading = true;

	async function fetchInfo() {
		try {
			let globalPassedSLA = await fetch(`${BackendAPI}/api/metrics/global_passed_sla/${id}`);
			let problematicOpenIssuesnNumber = await fetch(
				`${BackendAPI}/api/metrics/problematic_open_issues/${id}`
			);
			let passedTTO = await fetch(`${BackendAPI}/api/metrics/passed_tto/${id}`);
			let passedTTR = await fetch(`${BackendAPI}/api/metrics/passed_ttr/${id}`);
			let monthlyPassedSLA = await fetch(`${BackendAPI}/api/metrics/monthly_passed_sla/${id}`);

			data.globalPassedSLA = await globalPassedSLA.json();
			data.problematicOpenIssuesnNumber = await problematicOpenIssuesnNumber.json();
			data.passedTTO = await passedTTO.json();
			data.passedTTR = await passedTTR.json();
			data.monthlyPassedSLA = await monthlyPassedSLA.json();
		} catch (error) {
			alert('There was an error retrieving the info: ' + error);
		} finally {
			isLoading = false;
		}
	}

	onMount(async () => {
		await fetchInfo();
	});
</script>

<Title subtitle="Metrics" />

{#if isLoading}
	<Throbber message="Loading..." />
{:else if Object.keys(data).length === 0}
	<div class="container">
		<p>No data retrieved</p>
	</div>
{:else}
	<div class="container">
		<strong style="align-self: center;">
			You have {data.problematicOpenIssuesnNumber} problematic open issues in your chain
		</strong>
		<div class="chart-grid">
			<section class="section">
				<h2 class="section-title">SLA Performance</h2>
				<SlaPieCharts
					globalPassedSLA={data.globalPassedSLA}
					monthPassedSLA={data.monthlyPassedSLA}
				/>
			</section>
			<div>
				<TTOandTTRCharts
					tto_passed_percentage={data.passedTTO}
					ttr_passed_percentage={data.passedTTR}
				/>
			</div>
		</div>

		{#if type === 'STATE'}
			<div class="button-container">
				<button class="state-button" on:click={() => goto(`/metrics/${id}/graph`)}>
					View State Graph
				</button>
			</div>
		{/if}
	</div>
{/if}

<style>
	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 2rem;
		padding: 2rem;
	}

	.chart-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
		gap: 1rem;
		width: 100%;
		max-width: 1200px;
	}

	.section {
		background-color: #f9f9f9;
		padding: 2rem;
		border-radius: 12px;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		display: flex;
		flex-direction: column;
		align-items: center;
		transition: transform 0.2s;
	}

	.section:hover {
		transform: translateY(-5px);
	}

	.section-title {
		font-size: 1.5rem;
		margin-bottom: 1.5rem;
		color: #333;
		text-align: center;
	}

	.button-container {
		display: flex;
		justify-content: center;
		margin-top: 2rem;
	}

	.state-button {
		padding: 0.75rem 2rem;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 8px;
		font-size: 1rem;
		font-weight: bold;
		cursor: pointer;
		transition:
			background-color 0.3s,
			transform 0.2s;
	}

	.state-button:hover {
		background-color: #0056b3;
		transform: scale(1.05);
	}
</style>
