<?php
include_once("conn.php");


// if (isset($_POST['name'])) {
//     $key = $_POST['name'];
//     $sql = mysqli_query($conn, "select * from client
//     where 
//     client_name  Like '%$key'
//     or 
//     client_contact Like '%$key'
//     or 
//     client_email Like '%$key'
//     order by client_id desc
//     limit 7");
// } else {
//     $sql = mysqli_query($conn, "select * from client
// order by client_id desc
// limit 7");
// }


// $result = mysqli_fetch_all($sql, MYSQLI_ASSOC);


// exit(json_encode($result));
$output = '';
if (isset($_POST["query"])) {
    $search = mysqli_real_escape_string($conn, $_POST["query"]);
    $query = "
    select * from client
        where 
        client_name  Like '".$search."%'
        or 
        client_contact Like '".$search."%'
        or 
        client_email Like '".$search."%'
        order by client_id desc
        limit 7";
} else {
    $query = "
    select * from client order by client_id desc limit 7";
}
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {

    while ($row = mysqli_fetch_array($result)) {
        $output .= '
    <tr>
        <td>' . $row["client_id"] . '</td>
        <td>' . $row["client_name"] . '</td>
        <td>' . $row["client_phone"] . '</td>
        <td>' . $row["client_email"] . '</td>
        <td>' . $row["client_address"] . '</td>
    </tr>
        ';
    }
    echo $output;
} else {
    echo 'Data Not Found';
}
$conn->close();
