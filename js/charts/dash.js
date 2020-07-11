var ctx = document.getElementById('Revenue').getContext('2d');
var chart = new Chart(ctx, {
  // The type of chart we want to create
  type: 'line',
  data: {
    datasets: [{
      label: 'income',
      borderColor: 'green',
      backgroundColor: 'transparent',
      data: [10, 20, 30, 40,0,10,50]
    }, {
      label: 'spending',
      borderColor: 'red',
      backgroundColor: 'transparent',
      data: [45, 10, 50, 20,0,20,70],


    }],
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug','Sept','Oct','Nov','Dec']
  },
  // Configuration options go here
  options: {
    legend: {
      display: true,
      labels: {
        fontColor: 'white'
      }
    },
    showLines: {

    }
  }
});