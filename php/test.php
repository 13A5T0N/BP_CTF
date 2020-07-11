<?php
include "conn.php";

// print_r($_REQUEST);

$test  = $_POST['name'];
// echo $test->name;
$sql = "INSERT INTO `users`(`user_name`) 
VALUES ('$test')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
