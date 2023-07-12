<?php
include '../Helpers/DatabaseConfig.php';

if (
    isset($_POST['fullname']) &&
    isset($_POST['email']) &&
    isset($_POST['password'])

) {
    global $CON;
    $email = $_POST['email'];

    $sql = "Select * from users where email ='$email'";
    $result = mysqli_query($CON, $sql);
    $num = mysqli_num_rows($result);
    if ($num > 0) {
        echo json_encode(
            array(
                "success" => false,
                "message" => "Email already exists!"
            )
        );
        return;
    } else {
    }
} else {
    echo json_encode(
        array(
            "success" => false,
            "message" => "Please fill all the fields!",
            "required fields" => "fullname, email, password"
        )
    );
}
