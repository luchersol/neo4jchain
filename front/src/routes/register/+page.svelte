<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import Title from '../../components/title.svelte';
	import { BackendAPI, entityDict, isEntityOrArray, transformObject } from '../../stores/stores';
	const entity = 'Person';
	let fields = {};
	let formData = {};

	const regexList = /List<([A-Za-z]+)>/;

	onMount(() => {
		if (entityDict[entity]) {
			fields = entityDict[entity];
			Object.keys(fields)
				.filter(([key, _]) => key !== 'id' && key !== 'roles')
				.forEach((key) => {
					formData[key] = regexList.test(fields[key]['type']) ? [] : null;
				});
			fields.password = { type: 'String', required: true }
		} else {
			console.error('Unknown entity type');
		}
	});

	async function handleSubmit() {
		try {
			const response = await fetch(`${BackendAPI}/api/person`, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(formData)
			});

			if (response.ok) {
				alert(`Account created successfully! You will be redirected to log in page. Please log in there`);
				goto(`/login`);
			} else {
				alert('There was an error creating the entity.');
			}
		} catch (error) {
			console.error('Error submitting form:', error);
			alert('Error submitting the form');
		}
	}
</script>

<div class="container">
	<Title subtitle={`Create an account`}></Title>

	{#if Object.keys(fields).length > 0}
		<form on:submit|preventDefault={handleSubmit}>
			{#each Object.entries(fields).filter(([key, _]) => key !== 'id' && key !== 'roles') as [key, value]}
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
					{/if}
				</div>
			{/each}

			<button type="submit">Create account</button>
		</form>	
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
