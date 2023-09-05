

$sql = '';

if ($isAdmin) {
    $sql = "SELECT orders.*,email,full_name FROM orders join users on users.user_id = orders.user_id order by order_id desc";
} else {
    $sql = "SELECT * FROM orders WHERE user_id='$userId' order by order_id desc";
}

$result = mysqli_query($CON, $sql);


if ($result) {
    $orders = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $orders[] = $row;
    }
    echo json_encode(
        array(
            "success" => true,
            "message" => "Orders fetched successfully!",
            "data" => $orders
        )
    );
} else {
    echo json_encode(
        array(
            "success" => false,
            "message" => "Fetching orders failed!"
        )
    );
}
