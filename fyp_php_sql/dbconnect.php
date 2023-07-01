<?php
$servername = "localhost";
$username   = "uumitpro_max";
$password   = "9oNp&yrxoq)!";
$dbname     = "uumitpro_wellpathing";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>