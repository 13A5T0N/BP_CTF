

function insert() {
    var name = document.getElementById("client_name").value 
    var phone = document.getElementById("client_phone").value 
    var email = document.getElementById("client_email").value 
    var address = document.getElementById("client_addres").value 
    var contact = document.getElementById("client_contact").value 

    $.ajax({
        type: "POST", //type of method
        url: "../../php/add_client.php", //your page
        data: {
            name: name,
            phone: phone,
            email: email,
            address:address,
            contact:contact
        }, // passing the values
        success: function (res) {
            //do what you want here...
        }
    });

    $('#client_name').val(''); 
    $('#client_phone').val(''); 
    $('#product_material').val(''); 
    $('#product_size').val(''); 
    $('#client_contact').val(''); 
    
}