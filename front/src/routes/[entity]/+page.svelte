<script>
    import { BackendAPI } from '../../stores/stores';
    import { onMount } from 'svelte';
    import { page } from '$app/stores';
	let entity = $page.params.entity;
    let data = []
    async function fetchInfo() {
        try {
            console.log(`${BackendAPI}/api/${entity.toLocaleLowerCase()}`)
            const response = await fetch(`${BackendAPI}/api/${entity.toLocaleLowerCase()}`)
            data = await response.json()
        } catch (error) {
            data = 'There was an error retrieving the info: '+ error
        }
    }

    onMount( async () => {
        await fetchInfo()
    });

</script>

{#if data.length === 0}
<p>Loading...</p>
{:else}
{#each data as element}
<div class="section">
    <h3>{JSON.stringify(element)}</h3>
</div>
{/each}
{/if}

<style>

</style>