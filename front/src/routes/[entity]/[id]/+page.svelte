<script>
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import Throbber from '../../../components/throbber.svelte';
	import Title from '../../../components/title.svelte';
	import { BackendAPI, entityDict, transformObject } from '../../../stores/stores';

	let entity = $page.params.entity;
	let id = $page.params.id;
	let fields = {};
	let data = {};
	let entityToEdit = {};
	let existingItems = transformObject(entityDict);

	async function fetchInfo() {
		try {
			const response = await fetch(`${BackendAPI}/api/${entity.toLocaleLowerCase()}/${id}`);
			data = await response.json();
			entityToEdit = data;
		} catch (error) {
			data = 'There was an error retrieving the info: ' + error;
		}
	}

	const regexList = /List<([A-Za-z]+)>/;

	async function fetchItemsForSelect(type) {
		const match = type.match(regexList);
		const endpoint = '/api/' + (match ? match[1] : type).toLocaleLowerCase();

		try {
			const response = await fetch(`${BackendAPI}${endpoint}`);
			if (response.ok) {
				return await response.json();
			} else {
				console.error('Failed to fetch items for type:', type);
				return [];
			}
		} catch (error) {
			console.error('Error fetching items for type:', type, error);
			return [];
		}
	}

	onMount(async () => {
		await fetchInfo();
		if (entityDict[entity]) {
			fields = entityDict[entity];
			Object.keys(fields).forEach((key) => {
				entityToEdit[key] = entityToEdit[key]; // Keeping data in entityToEdit
			});

			Object.entries(fields).forEach(([key, type]) => {
				if (
					type.startsWith('List<') ||
					type === 'Status' ||
					type === 'Sla' ||
					type === 'Organization' ||
					type === 'Team' ||
					type === 'Person' ||
					type === 'Role' ||
					type === 'RequestType'
				) {
					fetchItemsForSelect(type).then((items) => {
						existingItems[type] = items;
					});
				}
			});
		} else {
			console.error('Unknown entity type');
		}
	});
</script>

<div class="container">
	<Title subtitle={`View details of ${entity}`}></Title>

	{#if Object.keys(fields).length > 0}
		<div class="details">
			{#each Object.entries(fields).filter(([key, _]) => key !== 'id') as [key, type]}
				<div class="field">
					<label for={key}>{key}</label>

					{#if type === 'String'}
						<p>{entityToEdit[key]}</p>
					{:else if type === 'Long' || type === 'Double'}
						<p>{entityToEdit[key]}</p>
					{:else if type === 'Priority' || type === 'OwnershipType' || type === 'Metric' || type === 'UnitTime'}
						<p>{entityToEdit[key]}</p>
					{:else if type.match(regexList)}
						<p>
							{#each existingItems[type] as item}
								{#if item.id === entityToEdit[key]}
									{item.name}
								{/if}
							{/each}
						</p>
					{:else}
						<p>{entityToEdit[key]}</p>
					{/if}
				</div>
			{/each}
		</div>
	{:else}
		<Throbber message={'Loading...'} />
	{/if}
</div>

<style>
	.container {
		padding: 20px;
		font-family: Arial, sans-serif;
	}

	.details {
		padding-top: 20px;
	}

	.field {
		margin-bottom: 20px;
	}

	.field label {
		display: block;
		font-weight: bold;
	}

	.field p {
		padding: 8px;
		border: 1px solid #ddd;
		border-radius: 4px;
		background-color: #f9f9f9;
	}
</style>
