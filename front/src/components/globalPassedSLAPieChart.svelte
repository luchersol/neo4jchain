<script>
    import { onMount } from "svelte";
    import Chart from 'chart.js/auto';
    export let globalPassedSLA

    function createGlobalPassedSLAPieChart() {
        const newCanvas = document.getElementById("global-passed-sla");

        if (window.globalSlaChart) {
            window.globalSlaChart.destroy();
        }

        const colorGuide = ['rgb(98, 255, 100)', 'rgb(255, 0, 68)'];
        const labels = [];

        const slaPassedPercentage = globalPassedSLA;

        const globalSlaChart = new Chart(newCanvas, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Global SLA Passed Percentage',
                    data: [slaPassedPercentage, 100 - slaPassedPercentage],
                    backgroundColor: colorGuide,
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                }
            }
        });

        window.globalSlaChart = globalSlaChart;
    }

    onMount(() => {
        createGlobalPassedSLAPieChart();
    });
</script>

<div class="col-6 d-flex justify-content-center align-items-center">
    <canvas id="global-passed-sla" width="400" height="550"></canvas>
</div>

<style>
  
canvas {
    margin: 0 auto;
}

@keyframes expandAnimation {
    from {
    height: 0;
    opacity: 0;
    }

    to {
    height: auto;
    opacity: 1;
    }
}
</style>
