<?php
include "php/conn.php";
session_start();
$user = $_POST['user'];
$pwd = $_POST['pwd'];

$sql = "SELECT user_id,user_password FROM users where user_name = '" . $user . "'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $hash = $row["user_password"];
        if ($user == 'kate') {
            if (password_verify($pwd, $hash)) {
                $_SESSION["user"] = $user;
                header("location:frontend/admin/");
            } else {

                header("location:index.html");
            }
        } else {
            if (password_verify($pwd, $hash)) {
                header("location:frontend/admin/");
            } else {
                header("location:index.html");
            }
        }
    }
} else {
    $_SESSION["user"] = $user;
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$a = password_hash('user', PASSWORD_DEFAULT);
// echo $a;