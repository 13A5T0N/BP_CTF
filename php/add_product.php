<?php
include "conn.php";

$product =$_POST['name'];
$amount =$_POST['amount'];
$material = $_POST['material'];
$size = $_POST['size'];
$color = $_POST['color'];

$sql = "INSERT INTO `product`(`product_name`, `product_size`, `product_color`, `product_material`, `product_amount`) 
VALUES ('$product','$size','$color','$material',$amount)";

if ($conn->query($sql) === TRUE) {
    // echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
