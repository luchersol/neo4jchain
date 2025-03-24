<script>
  import { onMount } from 'svelte';
  import { BackendAPI, entityDict } from '../stores/stores';
  import { goto } from '$app/navigation';


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

  <button on:click={() => navigateTo("login")}> Log in</button>

  <div class="button-container mt-4">
      {#each Object.keys(entityDict) as key}
          <button class="btn-square" on:click={() => navigateTo(key)}>
              {key}
          </button>
      {/each}
  </div>
</div>

<style>
  .container {
      max-width: 1200px; 
      margin: 0 auto; 
  }

  .button-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center; 
      gap: 20px; 
      margin-top: 20px;
  }

  .btn-square {
      width: 240px;
      height: 150px;
      background-color: white;
      border: 2px solid rgb(186, 186, 186);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      font-size: 1.2rem;
      cursor: pointer;
  }

  .btn-square:hover {
      box-shadow: 0px 0px 10px 3px rgba(3, 35, 149, 0.2);
      background-color: rgb(222, 247, 255);
  }
</style>
