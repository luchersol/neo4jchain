<script>
    export let message = "Loading...";
</script>

<div class="loader-container">
    <div class="loader"></div>
    <div class="loading-text">{message}</div>
</div>

<style>
    .loader-container {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        margin: 20px auto;
    }

    .loader {
        border: 8px solid #f3f3f3;
        border-top: 8px solid #3498db;
        border-radius: 50%;
        width: 100px;
        height: 100px;
        animation: spin 2s linear infinite;
    }

    .loading-text {
        margin-top: 10px;
        font-size: 1.5rem;
        color: #3498db;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>
