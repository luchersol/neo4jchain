<script>
    import { onMount } from "svelte";
    import Chart from 'chart.js/auto';
    export let globalPassedSLA;
    export let monthPassedSLA;

    function createGlobalPassedSLAPieChart() {
        const globalCanvas = document.getElementById("global-passed-sla");

        if (window.globalSlaChart) {
            window.globalSlaChart.destroy();
        }

        const colorGuide = ['rgb(98, 255, 100)', 'rgb(255, 0, 68)'];
        const labels = ["Passed", "Failed"];
        const slaPassedPercentage = globalPassedSLA;

        const globalSlaChart = new Chart(globalCanvas, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Global Passed',
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
                        display: false
                    }
                }
            }
        });

        window.globalSlaChart = globalSlaChart;
    }

    function createMonthlyPassedSLAPieChart() {
        const monthlyCanvas = document.getElementById("monthly-passed-sla");

        if (window.monthlySlaChart) {
            window.monthlySlaChart.destroy();
        }

        const colorGuide = ['rgb(98, 255, 100)', 'rgb(255, 0, 68)'];
        const labels = ["Passed", "Failed"];
        const slaPassedPercentage = monthPassedSLA;
        const actualMonth = new Date().toLocaleString('en-US', { month: 'long' });
        const monthlySlaChart = new Chart(monthlyCanvas, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    label: `${actualMonth} SLA Passed Percentage`,
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

        window.monthlySlaChart = monthlySlaChart;
    }

    onMount(() => {
        createGlobalPassedSLAPieChart();
        createMonthlyPassedSLAPieChart();
    });
</script>

<div class="container d-flex justify-content-center align-items-center position-relative">
    <div class="satellite-chart">
        <canvas id="global-passed-sla" width="140" height="90"></canvas>
    </div>
    <div class="main-chart">
        <canvas id="monthly-passed-sla" width="540" height="590"></canvas>
    </div>
</div>

<style>
  .container {
    position: relative;
    width: 600px;
    height: 600px;
  }

  .main-chart {
    position: relative;
  }

  .satellite-chart {
    position: absolute;
    top: 0;
    left: 0;
  }

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
