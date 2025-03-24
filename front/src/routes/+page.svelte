<script>
    import { onMount } from 'svelte';
    import { BackendAPI, entityDict } from '../stores/stores';
    import { goto } from '$app/navigation';
  
    let dropdownOpen = false;
  
    onMount(() => {
    });
  
    function navigateTo(entity) {
        goto(`/${entity}`);
    }
</script>
  
  <div class="container d-flex flex-column align-items-center mt-4">
    <div class="text-center">
        <h1 style="font-family: Arial, sans-serif; font-size: 3rem; color: #333;">
            Neo4jChain
        </h1>
        <hr style="border: 1px solid #333; width: 100%; max-width: 600px;">
    </div>
    <p style="font-family: Arial, sans-serif; font-size: 1.2rem; color: #555; text-align: center;">
        Manage your service chains easily.
    </p>
  
    <div class="button-group">
        <button on:click={() => navigateTo("login")} class="main-button">Log in</button>

        <div class="dropdown">
            <button class="dropdown-button" on:click={() => dropdownOpen = !dropdownOpen}>
                Entities
            </button>
            {#if dropdownOpen}
                <div class="dropdown-menu">
                    {#each Object.keys(entityDict) as key}
                        <button class="dropdown-item" on:click={() => navigateTo(key)}>
                            {key}
                        </button>
                    {/each}
                </div>
            {/if}
        </div>

        <button class="create-button" on:click={() => navigateTo("metrics")}>
            Metrics
        </button>

    </div>
  </div>
  
  <style>
    .container {
        max-width: 1200px; 
        margin: 0 auto; 
    }
  
    .button-group {
        display: flex;
        gap: 20px;
        justify-content: center;
        margin-top: 20px;
    }
  
    .main-button, .create-button {
        padding: 10px 20px;
        font-size: 1.2rem;
        cursor: pointer;
        border: none;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
    }
  
    .main-button:hover, .create-button:hover {
        background-color: #0056b3;
    }
  
    .dropdown {
        position: relative;
    }
  
    .dropdown-button {
        padding: 10px 20px;
        font-size: 1.2rem;
        cursor: pointer;
        border: 2px solid rgb(186, 186, 186);
        background-color: white;
        border-radius: 5px;
    }
  
    .dropdown-menu {
        position: absolute;
        top: 100%;
        left: 0;
        background: white;
        border: 1px solid rgb(186, 186, 186);
        box-shadow: 0px 0px 10px 3px rgba(3, 35, 149, 0.2);
        display: flex;
        flex-direction: column;
        width: 200px;
    }
  
    .dropdown-item {
        padding: 10px;
        font-size: 1rem;
        cursor: pointer;
        background: none;
        border: none;
        text-align: left;
        width: 100%;
    }
  
    .dropdown-item:hover {
        background-color: rgb(222, 247, 255);
    }
  </style>