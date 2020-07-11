<?php
session_start();


if ($_SESSION["user"] == 'kate') {
    echo "CONGRATULATIONS";
}
else {
    header("location:../");
}