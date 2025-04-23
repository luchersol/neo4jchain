<script>
    export let serviceListData;
</script>

<div id="organizations-container" class="container mt-5 w-75">
    <div class="text-s ms-2 mb-3">
      <h5>Service Metrics</h5>
    </div>

    <div class="row">
        <div class="col">
            <div class="table-responsive">
                <table class="table custom-table mb-0">
                    <thead>
                        <tr>
                            <th>Service Name</th>
                            <th>TTO</th>
                            <th>TTR</th>
                        </tr>
                    </thead>
                    <tbody>
                        {#if serviceListData && serviceListData.length > 0}
                            {#each serviceListData as serviceItem}
                                <tr>
                                    <td>{serviceItem.service.name}</td>
                                    <td>{serviceItem.tto.toFixed(2)}%</td>
                                    <td>{serviceItem.ttr.toFixed(2)}%</td>
                                </tr>
                            {/each}
                        {:else}
                            <tr>
                                <td colspan="3">No services available</td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
