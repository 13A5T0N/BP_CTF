var ctx = document.getElementById('product').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',
    data: {
        datasets: [{
            label: 'income',
            borderColor: 'transparent',
            backgroundColor:['red','green','teal','white','yellow'], 
            data: [10, 20,1,5,15]
        }],
        labels: ['item1', 'item2','item3','item4','item5']
    },
    // Configuration options go here
    options: {
        
    }
});