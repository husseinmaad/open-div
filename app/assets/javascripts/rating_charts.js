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
              label: "Overall Company Ratings",
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  'rgba(255,99,132,1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1,
              data: [diversity_rating, culture_rating, inclusion_rating]
          }
      ]
  };

  // Create chart
  var myBarChart = new Chart(ctx, {
      type: 'horizontalBar',
      data: data,
      responsive: true,
      barValueSpacing: 1
      // options: options
  });
});
