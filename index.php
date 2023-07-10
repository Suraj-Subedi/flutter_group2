<?php
include 'Helpers/DatabaseConfig.php';


global $CON;

$Sql = 'SELECT * FROM `products`';

$result = mysqli_query($CON, $Sql);
