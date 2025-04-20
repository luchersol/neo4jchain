<script>
	import { goto } from '$app/navigation';
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import { writable } from 'svelte/store';
	import Throbber from '../../../components/throbber.svelte';
	import Title from '../../../components/title.svelte';
	import { BackendAPI, entityDict, transformObject } from '../../../stores/stores';
	let entity = $page.params.entity;
	let id = $page.params.id;
	let fields = {};
	let data = {};
	let entityToEdit = {};
	let showModal = writable(false);
	let selectedEntity = writable(null);
	let existingItems = transformObject();

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
			Object.entries(fields).forEach(([_, value]) => {
				if (Object.keys(existingItems).includes(value['type'])) {
					fetchItemsForSelect(value['type']).then((items) => {
						existingItems[value['type']] = items;
					});
				}
			});
		} else {
			console.error('Unknown entity type');
		}
	});

	function confirmDelete() {
		showModal.set(true);
	}

	async function deleteEntity() {
		try {
			const response = await fetch(`${BackendAPI}/api/${entity.toLowerCase()}/${id}`, {
				method: 'DELETE'
			});
			if (response.ok) {
				showModal.set(false);
				goto(`/${entity}`);
			} else {
				console.error('Failed to delete entity');
			}
		} catch (error) {
			console.error('Error deleting entity:', error);
		}
	}
</script>

<div class="container">
	<Title subtitle={`View details of ${entity}`}></Title>

	{#if Object.keys(fields).length > 0}
		<div class="details">
			{#each Object.entries(fields).filter(([key, _]) => key !== 'id') as [key, value]}
				<div class="field">
					<label for={key}>{key}</label>

					{#if value['type'] === 'String'}
						<p>{entityToEdit[key]}</p>
					{:else if value['type'] === 'Long' || value['type'] === 'Double'}
						<p>{entityToEdit[key]}</p>
					{:else if value['type'] === 'Priority' || value['type'] === 'OwnershipType' || value['type'] === 'Metric' || value['type'] === 'UnitTime'}
						<p>{entityToEdit[key]}</p>
					{:else if value['type'].match(regexList)}
						{#if entityToEdit[key].length > 0}
							<ul>
								{#each entityToEdit[key] as item}
									<li>{item.name ?? '---'}</li>
								{/each}
							</ul>
						{:else}
							<p>No data available</p>
						{/if}
					{:else}
						<p>{entityToEdit[key]?.name ?? '---'}</p>
					{/if}
				</div>
			{/each}
		</div>
		<button on:click={() => goto(`/${entity}/${entityToEdit.id}/edit`)} class="button edit-button">
			Edit
		</button>
		<button
			on:click={() => {
				confirmDelete();
			}}
			class="button delete-button"
		>
			Delete
		</button>
	{:else}
		<Throbber message={'Loading...'} />
	{/if}
</div>

{#if $showModal}
	<div class="modal">
		<div class="modal-content">
			<p>Are you sure that you want to delete this entity?</p>
			<div style="display: flex; justify-content: center;">
				<div class="buttons-cancel">
					<button on:click={() => deleteEntity()} class="button delete-button">
						Delete Forever
					</button>
					<button on:click={() => showModal.set(false)} class="button cancel-button">Cancel</button>
				</div>
			</div>
		</div>
	</div>
{/if}

<style>
	.buttons-cancel {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		width: 20%;
	}

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
		min-height: 40px;
		padding: 8px;
		border: 1px solid #ddd;
		border-radius: 4px;
		background-color: #dddddd6a;
	}

	.field ul {
		min-height: 40px;
		padding: 8px;
		border: 1px solid #ddd;
		border-radius: 4px;
		background-color: #f9f9f9;
	}

	.field li {
		margin-left: 20px;
	}

	.modal-content {
		background: white;
		padding: 2rem;
	}

	.button {
		display: inline-block;
		padding: 0.75rem 1.5rem;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 1rem;
		transition: background 0.3s ease-in-out;
		text-align: center;
		align-self: center;
	}
	.edit-button {
		background-color: #28a745;
	}
	.edit-button:hover {
		background-color: #1e7e34;
	}

	.delete-button {
		background-color: #dc3545;
	}
	.delete-button:hover {
		background-color: #a71d2a;
	}
	.modal {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.modal-content {
		background: white;
		padding: 2rem;
		border-radius: 10px;
		text-align: center;
	}
	.cancel-button {
		background-color: #6c757d;
	}
	.cancel-button:hover {
		background-color: #5a6268;
	}
</style>
