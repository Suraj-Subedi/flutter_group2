<?php

include './Helpers/Authenication.php';
include './Helpers/DatabaseConfig.php';

if (

    isset($_POST['token'])

) {

    $isAdmin = isAdmin($token);


    if (!$isAdmin) {
        echo json_encode(array(
            "success" => false,
            "message" => "You are not authorized!"

        ));
        die();
    }


    global $CON;


    $sql = 'select sum(total) as total_income from orders where status = "paid"';

    $result = mysqli_query($CON, $sql);







    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $total_income = $row['total_income'];


        // $sql = 'select count(*) as total_users from users';



        echo json_encode(array(
            "success" => true,
            "message" => "Total income fetched successfully!",
            "data" => $total_income

        ));
    } else {

        echo json_encode(array(
            "success" => false,
            "message" => "Fetching total income failed!"

        ));
    }
} else {
    echo json_encode(array(
        "success" => false,
        "message" => "Token is required!"

    ));
}
