<script>
    import { BackendAPI } from '../../stores/stores';
    import { onMount } from 'svelte';
    import { page } from '$app/stores';
    import Throbber from '../../components/throbber.svelte';
    import Title from '../../components/title.svelte';
    import { writable } from 'svelte/store';

    let entity = $page.params.entity;
    let data = [];
    let showModal = writable(false);
    let selectedEntity = writable(null);

    async function fetchInfo() {
        try {
            const response = await fetch(`${BackendAPI}/api/${entity.toLowerCase()}`);
            data = await response.json();
        } catch (error) {
            data = 'There was an error retrieving the info: ' + error;
        }
    }

    async function deleteEntity(id) {
        try {
            const response = await fetch(`${BackendAPI}/api/${entity.toLowerCase()}/${id}`, {
                method: 'DELETE'
            });
            if (response.ok) {
                data = data.filter(item => item.id !== id);
                showModal.set(false);
            } else {
                console.error('Failed to delete entity');
            }
        } catch (error) {
            console.error('Error deleting entity:', error);
        }
    }

    function confirmDelete(entity) {
        selectedEntity.set(entity);
        showModal.set(true);
    }

    onMount(async () => {
        await fetchInfo();
    });
</script>

<Title subtitle={`${entity} list`}></Title>

{#if data.length === 0}
    <Throbber message={'Loading...'}/>
{:else}
    <button on:click={() => window.location.href = `/${entity}/create`} class="button create-button">
        Create {entity}
    </button>
    <div class="container">
        {#each data as element}
            <div class="card">
                <h3>{element.name || element.firstName || element.title || element.metric || "" }</h3>
                <p><strong>ID:</strong> {element.id}</p>
                {#if element.lastName}
                <p><strong>Full name:</strong> {element.firstName} {element.lastName}</p>
                {/if}
                {#if entity === 'Customer'}
                <p><strong>Organization:</strong> {element.organization?.name ?? "No organization assigned" }</p>
                <p><strong>Sla:</strong> {element.sla?.name ?? "No Sla assigned" }</p>
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
                <div>
                    <button on:click={() => window.location.href = `/${entity}/${element.id}/edit`} class="button edit-button">
                        Edit
                    </button>
                    <button on:click={() => confirmDelete(element)} class="button delete-button">
                        Delete
                    </button>
                </div>
            </div>
        {/each}
    </div>
{/if}

{#if $showModal}
    <div class="modal">
        <div class="modal-content">
            <p>Are you sure that you want to delete this entity?</p>
            <button on:click={() => deleteEntity($selectedEntity.id)} class="button delete-button">Delete Forever</button>
            <button on:click={() => showModal.set(false)} class="button cancel-button">Cancel</button>
        </div>
    </div>
{/if}

<style>
    .container {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        justify-content: center;
    }
    .modal-content {
        background: white;
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

    .create-button {
        display: block;
        margin: 1rem auto;
        padding: 0.75rem 1.5rem;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
        transition: background 0.3s ease-in-out;
    }
    .create-button:hover {
        background-color: #0056b3;
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
