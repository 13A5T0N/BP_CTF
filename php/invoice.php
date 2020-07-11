<?php
include_once("conn.php");


if (isset($_POST['name'])) {
    $key = $_POST['name'];
    // $sql = mysqli_query($conn, "select * from client
    // where 
    // client_name  Like '%$key'
    // or 
    // client_contact Like '%$key'
    // or 
    // client_email Like '%$key'
    // order by client_id desc
    // limit 8");
} else {
    $sql = mysqli_query($conn, "SELECT * FROM invoice
order by invoice_id desc
limit 9");
}


$result = mysqli_fetch_all($sql, MYSQLI_ASSOC);


exit(json_encode($result));
$conn->close();
