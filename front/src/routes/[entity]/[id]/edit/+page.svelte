<script>
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import Throbber from '../../../../components/throbber.svelte';
	import Title from '../../../../components/title.svelte';
	import {
		BackendAPI,
		entityDict,
		isEntityOrArray,
		transformObject
	} from '../../../../stores/stores';

	let entity = $page.params.entity;
	let id = $page.params.id;
	let fields = {};
	let data = {};
	let formData = {};
	let entityToEdit = {};
	let existingItems = transformObject();

	async function fetchInfo() {
		try {
			// console.log(`${BackendAPI}/api/${entity.toLocaleLowerCase()}/${id}`)
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
			Object.keys(fields)
				.filter(([key, _]) => key !== 'id')
				.forEach((key) => {
					const fieldType = fields[key]['type'];
					if (isEntityOrArray(fieldType)) {
						if (fieldType.startsWith('List<')) {
							formData[key] = entityToEdit[key]?.map((field) => field.id);
						} else {
							formData[key] = entityToEdit[key]?.id;
						}
					} else {
						formData[key] = entityToEdit[key];
					}
				});

			console.log(fields);
			Object.entries(fields)
				.map(([_, value]) => value['type'])
				.forEach((type) => {
					if (isEntityOrArray(type)) {
						fetchItemsForSelect(type).then((items) => {
							existingItems[type] = items;
						});
					}
				});
		} else {
			console.error('Unknown entity type');
		}
	});

	async function handleSubmit() {
		try {
			const response = await fetch(`${BackendAPI}/api/${entity.toLocaleLowerCase()}/${id}`, {
				method: 'PUT',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(formData)
			});

			if (response.ok) {
				alert(`${entity} edited successfully!`);
				window.location.href = `/${entity}`;
			} else {
				alert('There was an error editing the entity.');
			}
		} catch (error) {
			console.error('Error submitting form:', error);
			alert('Error submitting the form');
		}
	}
</script>

<div class="container">
	<Title subtitle={`Edit ${entity}`}></Title>

	{#if Object.keys(fields).length > 0}
		<form on:submit|preventDefault={handleSubmit}>
			{#each Object.entries(fields).filter(([key, _]) => key !== 'id') as [key, value]}
				<div class="field">
					<label for={key}>{key}</label>

					{#if value['type'] === 'String'}
						<input type="text" id={key} bind:value={formData[key]} required={value['required']} />
					{:else if value['type'] === 'Long'}
						<input type="number" id={key} bind:value={formData[key]} required={value['required']} />
					{:else if value['type'] === 'Double'}
						<input
							type="number"
							step="any"
							id={key}
							bind:value={formData[key]}
							required={value['required']}
						/>
					{:else if value['type'] === 'Priority'}
						<select id={key} bind:value={formData[key]} required={value['required']}>
							<option value="LOW">Low</option>
							<option value="MEDIUM">Medium</option>
							<option value="HARD">Hard</option>
							<option value="HIGH">High</option>
							<option value="CRITICAL">Critial</option>
							<option value="ALL">All</option>
						</select>
					{:else if value['type'] === 'OwnershipType'}
						<select id={key} bind:value={formData[key]} required={value['required']}>
							<option value="STATE">State</option>
							<option value="STATE_TEAM">State+team</option>
						</select>
					{:else if value['type'] === 'Metric'}
						<select id={key} bind:value={formData[key]} required={value['required']}>
							<option value="TTO">TTO</option>
							<option value="TTR">TTR</option>
						</select>
					{:else if value['type'] === 'UnitTime'}
						<select id={key} bind:value={formData[key]} required={value['required']}>
							<option value="MINUTES">Minutes</option>
							<option value="HOURS">Hours</option>
						</select>
					{:else if value['type'].match(regexList)}
						{#each existingItems[value['type']] as item}
							<div class="checkbox-container">
								<input type="checkbox" value={item.id} bind:group={formData[key]} />
								<span>{item.name}</span>
							</div>
						{/each}
					{:else if !value['type'].match(regexList)}
						<select id={key} bind:value={formData[key]} required={value['required']}>
							<option value="">Select an existing {key}</option>
							{#each existingItems[value['type']] as item}
								<option value={item.id}>{item.name}</option>
							{/each}
						</select>
					{/if}
				</div>
			{/each}

			<button type="submit">Edit {entity}</button>
		</form>
	{:else}
		<Throbber message={'Loading...'} />
	{/if}
</div>

<style>
	.container {
		padding: 20px;
		font-family: Arial, sans-serif;
	}

	.field {
		margin-bottom: 20px;
	}

	.field label {
		display: block;
		font-weight: bold;
	}

	.field input,
	.field select,
	.field textarea {
		width: 100%;
		padding: 8px;
		margin-top: 5px;
	}

	button {
		padding: 10px 15px;
		background-color: #4caf50;
		color: white;
		border: none;
		cursor: pointer;
	}

	button:hover {
		background-color: #45a049;
	}

	.checkbox-container {
		margin-block: 10px;
		display: flex;
		flex-direction: row; /* Esto asegura que los elementos estén uno al lado del otro */
		align-items: center;
	}

	.checkbox-container input {
		width: 20px;
		margin-right: 10px; /* Espacio entre el checkbox y el texto */
	}

	.checkbox-container span {
		flex: 1; /* Esto hace que el texto ocupe el espacio restante */
	}
</style>
