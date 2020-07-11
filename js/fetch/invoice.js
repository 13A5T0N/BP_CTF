// // FETCH DATA
function clientupdate() {
    fetch('../../php/invoice.php').then((res) => res.json())
        .then(response => {
            // console.log(response);
            let output = '';
            for (let i in response) {
                output += `<tr>
			<td>${response[i].invoice_id}</td>
			<td>${response[i].client}</td>
			<td>${response[i].status}</td>
            <td>${response[i].total}</td>
		</tr>`;
            }
            document.querySelector('.tbody').innerHTML = output;
        }).catch(error => console.log(error));

    // DATA TABLES
    $(document).ready(function () {
        $('.table').DataTable();
    })
}

clientupdate()
setInterval(function () {
    clientupdate()
}, 1000);
