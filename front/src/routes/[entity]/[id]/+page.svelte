<script>
    import { onMount } from 'svelte';
    import { BackendAPI } from '../../stores/stores';
	import { page } from '$app/stores';
	let entity = $page.params.entity;
    let id = $page.params.id;
    let data = {}
    async function fetchInfo() {
        try {
            const response = await fetch(`${BackendAPI}/api/${entity.toLocaleLowerCase()}/${id}`)
            data = await response.json()
        } catch (error) {
            data = 'There was an error retrieving the info: '+ error
        }
    }
    onMount(async () => {
        await fetchInfo()
    });

</script>

<div class="container">
    {#if !Object.keys(data).length}
        <p>Loading...</p>
    {:else}
        {#each Object.entries(data) as [key, value]}
            <div class="section">
                <h3>{key}</h3>
                {#each Object.entries(value) as [field, fieldValue]}
                    <p><strong>{field}:</strong> {fieldValue}</p>
                {/each}
            </div>
        {/each}
    {/if}

</div>

<style>
    .container {
        padding: 20px;
        font-family: Arial, sans-serif;
    }

    .section {
        margin-bottom: 20px;
    }

    .section h3 {
        margin: 0;
        font-size: 1.2em;
        color: #2a2a2a;
    }

    .section p {
        margin: 5px 0;
        font-size: 1em;
        color: #555;
    }
</style>