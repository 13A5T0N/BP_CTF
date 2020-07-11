<?php
include_once("conn.php");


// if (isset($_POST['name'])) {
//     $key = $_POST['name'];
//     // $sql = mysqli_query($conn, "select * from client
//     // where 
//     // client_name  Like '%$key'
//     // or 
//     // client_contact Like '%$key'
//     // or 
//     // client_email Like '%$key'
//     // order by client_id desc
//     // limit 8");
// } else {
//     $sql = mysqli_query($conn, "SELECT * FROM product
// order by product_id desc
// limit 9");
// }


// $result = mysqli_fetch_all($sql, MYSQLI_ASSOC);


// exit(json_encode($result));

$output = '';
if (isset($_POST["query"])) {
    $search = mysqli_real_escape_string($conn, $_POST["query"]);
    $query = "
    select * from product
        where 
        product_name  Like '".$search."%'
        or 
        product_size Like '".$search."%'
        or 
        product_color Like '".$search."%'
        or 
        product_amount Like '".$search."%'
        or 
        product_material Like '".$search."%'
        or 
        product_price Like '%".$search."'
        order by product_id desc
        limit 7";
} else {
    $query = "
    SELECT * FROM product order by product_id desc limit 7";
}
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_array($result)) {
        $output .= '
    <tr>
        <td>' . $row["product_id"] . '</td>
        <td>' . $row["product_name"] . '</td>
        <td>' . $row["product_size"] . '</td>
        <td>' . $row["product_color"] . '</td>
        <td>' . $row["product_amount"] . '</td>
        <td>' . $row["product_material"] . '</td>
        <td>' . $row["product_price"] . '</td>
    </tr>
        ';
    }
    echo $output;
} else {
    echo 'Data Not Found';
}
$conn->close();
