<?php
include "conn.php";

$name =$_POST['name'];
$phone =$_POST['phone'];
$email = $_POST['email'];
$address = $_POST['address'];
$contact = $_POST['contact'];

$sql = "INSERT INTO `client`(`client_name`, `client_contact`, `client_phone`, `client_email`, `client_address`)
VALUES ('$name','$contact','$phone','$email','$address')";

if ($conn->query($sql) === TRUE) {
    // echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
