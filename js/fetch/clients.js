// // FETCH DATA
// function clientupdate() {
//     fetch('../../php/clients.php').then((res) => res.json())
//         .then(response => {
//             // console.log(response);
//             let output = '';
//             for (let i in response) {
//                 output += `<tr>
// 			<td>${response[i].client_id}</td>
// 			<td>${response[i].client_name}</td>
//             <td>${response[i].client_phone}</td>
//             <td>${response[i].client_email}</td>
//             <td>${response[i].client_contact}</td>
// 		</tr>`;
//             }

//             document.querySelector('.tbody').innerHTML = output;
//         }).catch(error => console.log(error));

//     // DATA TABLES
//     $(document).ready(function () {
//         $('.table').DataTable();
//     })
// }
// function search() {
//     var key = document.getElementById("clientsearch").value
//     console.log(key)
//     $.ajax({
//         type: "POST", //type of method
//         url: "../../php/clients.php", //your page
//         data: {
//             name: key
//         }, // passing the values
//         success: function (res) {
//             //do what you want here...
//             console.log("succes")
//         }
//     });
// }

// clientupdate()
// setInterval(function () {
//     clientupdate()
// }, 1000);
// });



function load_data(query) {
    $.ajax({
        url: "../../php/clients.php",
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

setInterval(function () {
    load_data();
    }, 1000);