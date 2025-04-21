<script>
    import Chart from 'chart.js/auto';
    import { onMount, onDestroy } from 'svelte';

    export let tto_passed_percentage = 0;
    export let ttr_passed_percentage = 0;

    let ttoChart = null;
    let ttrChart = null;

    // Asegúrate de que el código se ejecute solo en el navegador
    const isBrowser = typeof window !== 'undefined';

    onMount(() => {
        if (isBrowser) {
            createCharts();
        }
    });

    onDestroy(() => {
        if (isBrowser) {
            destroyCharts();
        }
    });

    // Reacción a los cambios de las variables
    $: isBrowser && createOrUpdateCharts(tto_passed_percentage, ttr_passed_percentage);

    function createDoughnutChart(canvas, passedPercentage) {
        return new Chart(canvas, {
            type: 'doughnut',
            data: {
                labels: ['Passed', 'Failed'],
                datasets: [
                    {
                        data: [passedPercentage.toFixed(2), 100 - passedPercentage.toFixed(2)],
                        backgroundColor: ['green', 'red']
                    }
                ]
            },
            plugins: [
                {
                    id: 'doughnutLabel',
                    beforeDatasetsDraw(chart) {
                        const { ctx, data } = chart;
                        const text = `${data.datasets[0].data[0]}%`;
                        const textWidth = ctx.measureText(text).width;
                        const xcoor = (chart.chartArea.left + chart.chartArea.right) / 2 - textWidth / 2;
                        const ycoor = (chart.chartArea.top + chart.chartArea.bottom) / 2;
                        ctx.font = 'bold 24px Arial';
                        ctx.fillStyle = 'black';
                        ctx.fillText(text, xcoor, ycoor);
                        ctx.save();
                    }
                }
            ]
        });
    }

    function createCharts() {
        const ttoCanvas = document.getElementById('passed-tto');
        const ttrCanvas = document.getElementById('passed-ttr');

        if (ttoCanvas && ttrCanvas) {
            ttoChart = createDoughnutChart(ttoCanvas, tto_passed_percentage);
            ttrChart = createDoughnutChart(ttrCanvas, ttr_passed_percentage);
        }
    }

    function updateCharts() {
        if (ttoChart && ttrChart) {
            ttoChart.data.datasets[0].data = [tto_passed_percentage, 100 - tto_passed_percentage];
            ttrChart.data.datasets[0].data = [ttr_passed_percentage, 100 - ttr_passed_percentage];

            ttoChart.update();
            ttrChart.update();
        }
    }

    function destroyCharts() {
        if (ttoChart) {
            ttoChart.destroy();
            ttoChart = null;
        }

        if (ttrChart) {
            ttrChart.destroy();
            ttrChart = null;
        }
    }

    function createOrUpdateCharts(newTtoPercentage, newTtrPercentage) {
        if (!ttoChart || !ttrChart) {
            createCharts();
        } else {
            updateCharts(newTtoPercentage, newTtrPercentage);
        }
    }
</script>
    
<div class="col col-5">
    <div id="tto" class="container px-4 justify-content-center text-center ml-4 w-100">
        <div class="row gx-5 justify-content-center mb-4">
            <div class="col card p-0 justify-content-center outline bg-white d-flex ms-2">
                <div class="card-header text-start bg-white">Passed TTO %</div>
                <canvas
                    id="passed-tto"
                    class="justify-content-center"
                    data-value={tto_passed_percentage.toFixed(2)}
                ></canvas>
            </div>
        </div>
    </div>
    <div id="ttr" class="container px-4 justify-content-center text-center ml-4 w-100">
        <div class="row gx-5 justify-content-center mb-4">
            <div class="col card p-0 justify-content-center outline bg-white d-flex ms-2">
                <div class="card-header text-start bg-white">Passed TTR %</div>
                <canvas
                    id="passed-ttr"
                    class="justify-content-center"
                    data-value={ttr_passed_percentage.toFixed(2)}
                ></canvas>
            </div>
        </div>
    </div>
</div>
