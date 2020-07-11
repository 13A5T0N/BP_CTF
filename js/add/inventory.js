

function insert() {
    var product = document.getElementById("product_name").value 
    var amount = document.getElementById("product_amount").value 
    var material = document.getElementById("product_material").value 
    var size = document.getElementById("product_size").value 
    var color = document.getElementById("product_color").value 

    $.ajax({
        type: "POST", //type of method
        url: "../../php/add_product.php", //your page
        data: {
            name: product,
            amount: amount,
            material: material,
            size:size,
            color:color
        }, // passing the values
        success: function (res) {
            //do what you want here...
            console.log("succes")
        }
    });

    $('#product_name').val(''); 
    $('#product_amount').val(''); 
    $('#product_material').val(''); 
    $('#product_size').val(''); 
    $('#product_color').val(''); 
    
}