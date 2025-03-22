<script>
    import { BackendAPI } from '../../stores/stores';
    import { onMount } from 'svelte';
    import { page } from '$app/stores';
    import Throbber from '../../components/throbber.svelte'
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
    <Throbber message={'Loading...'}/>
{:else}
    <div class="container">
        {#each data as element}
            <div class="card">
                <h3>{element.name || element.firstName || element.title || element.metric || "" }</h3>
                <p><strong>ID:</strong> {element.id}</p>
                {#if element.lastName}
                <p><strong>Full name:</strong> {element.firstName} {element.lastName}</p>
                {/if}
                {#if entity === 'Customer'}
                <p><strong>Organization:</strong> {element.organization.name}</p>
                <p><strong>Sla:</strong> {element.sla.name}</p>
                {/if}
                {#if entity === 'Issue'}
                <p><strong>Status:</strong> {element.status.name}</p>
                <p><strong>Owner:</strong> {element.owner.firstName} {element.owner.lastName}</p>
                <p><strong>Assigned to:</strong> { element.assignedPerson ? element.assignedPerson.firstName : 'No person assigned'} {element.assignedPerson.lastName ?? "" }</p>
                <p><strong>Assigned team:</strong> {element.assignedTeam ? element.assignedTeam.name : 'No team assigned'}</p>
                {/if}
                {#if entity === 'Provider'}
                <p><strong>Organization:</strong> {element.organization?.name ?? "No organization assigned" }</p>
                <p><strong>Service:</strong> {element.serviceOrg?.name ?? "No service assigned" }</p>
                <p><strong>Sla:</strong> {element.sla?.name ?? "No Sla assigned" }</p>
                {/if}
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
        padding: 2rem;
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
        color: #555;
        font-size: 1rem;
        margin: 0.25rem 0;
    }
</style>
