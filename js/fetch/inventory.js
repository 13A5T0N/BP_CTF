// // FETCH DATA

// function clientupdate() {
//     fetch('../../php/inv.php').then((res) => res.json())
//         .then(response => {
//             // console.log(response);
//             let output = '';
            
//             for (let i in response) {
//                 output += `<tr>
// 			<td>${response[i].product_id}</td>
// 			<td>${response[i].product_name}</td>
// 			<td>${response[i].product_amount}</td>
//             <td>${response[i].product_material}</td>
//             <td>${response[i].product_size}</td>
//             <td>${response[i].product_color}</td>
//             <td>$ ${response[i].product_price} </td>
// 		</tr>`;
//             }

//             document.querySelector('.tbody').innerHTML = output;
//         }).catch(error => console.log(error));

//     // DATA TABLES
//     $(document).ready(function () {
//         $('.table').DataTable();
//     })
// }


function load_data(query) {
    $.ajax({
        url: "../../php/inv.php",
        method: "POST",
        data: {
            query: query
        },
        success: function (data) {
            $('#result').html(data);
        }
    });
}
$('#search_text').keyup(function () {
var search = $(this).val();
if (search != '') {
    load_data(search);
} else {
    load_data();
}
});
load_data();

// setInterval(function () {
//     load_data();
//     }, 1000);
