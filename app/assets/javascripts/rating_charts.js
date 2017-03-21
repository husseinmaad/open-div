$(document).on('turbolinks:load', function() {
  var ctx = document.getElementById("canvas")
  var myBarChart = new Chart(ctx, {
      type: 'bar',
      data: data,
      responsive: true,
      barValueSpacing: 1
      // options: options
  });
});


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
            data: [4.333, 2.33, 1.33]
        }
    ]
};
