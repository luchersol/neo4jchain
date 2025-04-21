<script>
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import GlobalPassedSLAPieChart from '../../../components/globalPassedSLAPieChart.svelte'; // globalPassedSLA
	import SlaPieCharts from '../../../components/slaPieCharts.svelte'
	import TTOandTTRCharts from '../../../components/ttoAndttrCharts.svelte' //tto_passed_percentage and ttr_passed_percentage
	import Throbber from '../../../components/throbber.svelte';
	import Title from '../../../components/title.svelte';
	import { BackendAPI } from '../../../stores/stores';

	let id = $page.params.id;
	let type = $page.url.searchParams.get('type'); // <--- Obtener query param
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

<Title subtitle={'Metrics'} />

{#if isLoading}
	<Throbber message={'Loading...'} />
{:else if Object.keys(data).length === 0}
	<div class="container">
		<p>No data retrieved</p>
	</div>
{:else}
	<div class="container">

		<div>
			<p>Month and Global passed SLA percentages</p>
			<SlaPieCharts globalPassedSLA={data.globalPassedSLA} monthPassedSLA={data.monthlyPassedSLA}></SlaPieCharts>
		</div>

		<TTOandTTRCharts tto_passed_percentage={data.passedTTO} ttr_passed_percentage={data.passedTTR}></TTOandTTRCharts>

		{#if type === 'STATE'}
			<button class="state-button" on:click={() => goto(`/metrics/${id}/graph`)}> Graph </button>
		{/if}
	</div>
{/if}

<style>
	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1rem;
	}

	.state-button {
		padding: 0.75rem 1.5rem;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 6px;
		cursor: pointer;
		font-size: 1rem;
		transition: background-color 0.3s;
	}

	.state-button:hover {
		background-color: #0056b3;
	}
</style>
