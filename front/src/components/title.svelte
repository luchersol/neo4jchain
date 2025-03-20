<script>
    export let subtitle = '';
    export let target = '';
  </script>
  
  <div class="row w-100">
    <div class="col col-2 text-center align-items-center mt-2">
      <a type="button" href="javascript:window.history.back();">
        <i class="fa fa-arrow-left fa-lg" style="color: #c2c2c2; font-size: 250%;"></i>
      </a>
    </div>
    <div class="col col-10 text-center">
      <div style="margin-right: 20%;">
        <div class="text-center">
          <h1 style="font-family: Arial, sans-serif; font-size: 3rem; color: #333;">
            <a href="/" style="text-decoration: none !important;">Neo4jChain</a>
          </h1>
        </div>
        <hr style="border: 1px solid #333; width: 100%;">
        <p style="font-family: Arial, sans-serif; font-size: 1.2rem; color: #555;">
          {#if subtitle}
            {subtitle} {target}.
          {/if}
        </p>
      </div>
    </div>
  </div>
  