$(document).on('turbolinks:load', function() {
  var ctx = document.getElementById("canvas")

  // Grab ratings from view
  var diversity_rating = parseFloat($('.company-chart-ratings').attr('diversity'));
  var inclusion_rating = parseFloat($('.company-chart-ratings').attr('inclusion'));
  var culture_rating = parseFloat($('.company-chart-ratings').attr('culture'));

  // Apply ratings to data set
  var data = {
      labels: ["Diversity", "Culture", "Inclusion"],
      datasets: [
          {
              label: "Overall Company Rating",
              backgroundColor: [
                  'rgba(255, 99, 132, .7)',
                  'rgba(54, 162, 235, .7)',
                  'rgba(255, 159, 64, .7)',
              ],
              // borderColor: [
              //     'rgba(255,99,132,1)',
              //     'rgba(54, 162, 235, 1)',
              //     'rgba(255, 159, 64, 1)',
              //     'rgba(255, 159, 24, 1)'
              // ],
              borderWidth: 1,
              data: [diversity_rating, culture_rating, inclusion_rating]
          }
      ]
  };
  var options = {
      scales: {
          yAxes: [{
              display: true,
              ticks: {
                  suggestedMin: 1,    // minimum will be 0, unless there is a lower value.
              }
          }]
      }
  };
  // Create chart
  var myBarChart = new Chart(ctx, {
      type: 'bar',
      data: data,
      responsive: true,
      barValueSpacing: 1,
      options: options
  });
});
