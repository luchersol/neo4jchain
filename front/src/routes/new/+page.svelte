<script>
    import { onMount } from 'svelte';
    import { BackendAPI, entityDict } from '../../stores/stores';
    import { goto } from '$app/navigation';
    import Title from '../../components/title.svelte';
  
    onMount(() => {
    });
  
    function navigateTo(entity) {
        goto(`/${entity}`);
    }
</script>
  
<Title subtitle={"Create a new service chain"}></Title>

