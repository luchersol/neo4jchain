<script>
    import { onMount } from 'svelte';
    import { BackendAPI } from '../stores/stores';

  
    onMount(() => {
    });
  
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
  
</div>

<style>
  .container {
    max-width: 1200px; 
    margin: 0 auto; 
  }

  .button-container {
    display: flex;
    justify-content: center; 
    gap: 20px; 
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
  }

  .btn-square:hover {
    box-shadow: 0px 0px 10px 3px rgba(3, 35, 149, 0.2);
    background-color: rgb(222, 247, 255);
  }

  .btn-img {
    height: 80px;
    margin-bottom: 10px;
  }

  .green-dot {
    display: inline-block;
    width: 8px;
    height: 8px;
    margin-right: 4px;
    margin-bottom: 1px;
    background-color: #4CAF50;
    border-radius: 50%;
  }

  .red-dot {
    display: inline-block;
    width: 8px;
    height: 8px;
    margin-right: 4px;
    margin-bottom: 1px;
    background-color: #f44336;
    border-radius: 50%;
  }

  .btn-container {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .col-2 {
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
  }
</style>
