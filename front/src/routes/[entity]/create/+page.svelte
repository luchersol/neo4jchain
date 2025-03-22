<script>
    import { onMount } from 'svelte';
    import { page } from '$app/stores';
    import { BackendAPI, entityDict } from '../../../stores/stores';
    import Throbber from '../../../components/throbber.svelte';

    let entity = $page.params.entity;
    let fields = {};
    let formData = {};
    let existingItems = {
        'List<Team>': [],
        'List<ServiceOrg>': [],
        'List<Customer>': [],
        'List<Privilege>': [],
        'List<Role>': [],
        'Status': [],
        'Sla': [],
        'Organization': [],
        'Team': [],
        'Person': [],
        'Role': [],
        'RequestType': [],
    };

    async function fetchItemsForSelect(type) {
        let endpoint;
        switch (type) {
            case 'List<Team>':
                endpoint = '/api/team';
                break;
            case 'List<ServiceOrg>':
                endpoint = '/api/serviceOrg';
                break;
            case 'List<Customer>':
                endpoint = '/api/customer';
                break;
            case 'List<Privilege>':
                endpoint = '/api/privilege';
                break;
            case 'List<Role>':
                endpoint = '/api/role';
                break;
            case 'List<Scope>':
                endpoint = '/api/scope';
                break;
            default:
                endpoint = `/api/${type.toLocaleLowerCase()}`;
                break
        }

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

    onMount(() => {
        if (entityDict[entity]) {
            fields = entityDict[entity];
            Object.keys(fields).forEach(key => {
                formData[key] = '';
            });

            Object.entries(fields).forEach(([key, type]) => {
                if (type.startsWith('List<') || type === 'Status' || type === 'Sla' || type === 'Organization' || type === 'Team' || type === 'Person' || type === 'Role' || type === 'RequestType' ) {
                    fetchItemsForSelect(type).then(items => {
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
            const response = await fetch(`${BackendAPI}/api/${entity.toLocaleLowerCase()}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData),
            });

            if (response.ok) {
                alert(`${entity} created successfully!`);
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
    <h2>Create a new {entity}</h2>

    {#if Object.keys(fields).length > 0}
        <form on:submit|preventDefault={handleSubmit}>
            {#each Object.entries(fields) as [key, type]}
                <div class="field">
                    <label for={key}>{key}</label>

                    {#if type === 'String'}
                        <input type="text" id={key} bind:value={formData[key]} required />
                    {:else if type === 'Long'}
                        <input type="number" id={key} bind:value={formData[key]} required />
                    {:else if type === 'Double'}
                        <input type="number" step="any" id={key} bind:value={formData[key]} required />
                    {:else if type === 'Priority'}
                        <select id={key} bind:value={formData[key]} required>
                            <option value="LOW">Low</option>
                            <option value="MEDIUM">Medium</option>
                            <option value="HARD">Hard</option>
                            <option value="HIGH">High</option>
                            <option value="CRITICAL">Critial</option>
                            <option value="ALL">All</option>
                        </select>
                    {:else if type === 'UnitTime'}
                        <select id={key} bind:value={formData[key]} required>
                            <option value="MINUTES">Minutes</option>
                            <option value="HOURS">Hours</option>
                        </select>
                    {:else if type === 'List<Team>' || type === 'List<ServiceOrg>' || type === 'List<Customer>'}
                        <select id={key} bind:value={formData[key]} required multiple>
                            <option value="">Select an existing {key}</option>
                            {#each existingItems[type] as item}
                                <option value={item.id}>{item.name}</option>
                            {/each}
                        </select>
                    {:else if type === 'List<Privilege>' || type === 'List<Role>'}
                        <select id={key} bind:value={formData[key]} required multiple>
                            <option value="">Select an existing {key}</option>
                            {#each existingItems[type] as item}
                                <option value={item.id}>{item.name}</option>
                            {/each}
                        </select>
                    {:else if type === 'Status' || type === 'Sla' || type === 'Organization' || type === 'Team' || type === 'Person' || type === 'Role' || type === 'RequestType'}
                        <select id={key} bind:value={formData[key]} required>
                            <option value="">Select an existing {key}</option>
                            {#each existingItems[type] as item}
                                <option value={item.id}>{item.name}</option>
                            {/each}                       
                         </select>
                    {/if}
                </div>
            {/each}

            <button type="submit">Create {entity}</button>
        </form>
    {:else}
        <Throbber message={'Loading...'}/>
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

    .field input, .field select, .field textarea {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
    }

    button {
        padding: 10px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
