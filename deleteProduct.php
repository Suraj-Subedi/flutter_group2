<?php

include './Helpers/Authenication.php';
include './Helpers/DatabaseConfig.php';

if (

    isset($_POST['token'])

) {
    $token = $_POST['token'];

    $isAdmin = isAdmin($token);


    if (!$isAdmin) {
        echo json_encode(array(
            "success" => false,
            "message" => "You are not authorized!"

        ));
        die();
    }

    if (!isset($_POST['product_id'])) {
        return json_encode(array(
            "success" => false,
            "message" => "Product id is required!"
        ));
    }

    global $CON;

    $product_id = $_POST['product_id'];

    $sql = "update products set is_available = 0 where product_id = $product_id";

    $result = mysqli_query($CON, $sql);

    if ($result) {
        echo json_encode(array(
            "success" => true,
            "message" => "Product deleted successfully!"
        ));
    } else {
        echo json_encode(array(
            "success" => false,
            "message" => "Product deletion failed!"
        ));
    }
} else {
    echo json_encode(array(
        "success" => false,
        "message" => "Token is required!"

    ));
    die();
}
