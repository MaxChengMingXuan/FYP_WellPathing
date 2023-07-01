<?php
	if (!isset($_POST['register'])) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
		die();
	}

include_once("dbconnect.php");
$name = $_POST['name'];
$email = $_POST['email'];
$matric = $_POST['matric'];
$role = $_POST['role'];
$school = $_POST['school'];
$programme = $_POST['programme'];
$staffid = $_POST['staffid'];
$department = $_POST['department'];
$password = sha1($_POST['password']);
$otp = rand(10000,99999);


$sqlregister = "INSERT INTO `tbl_users`(`user_email`, `user_name`, `user_role`, `user_matric`, `user_staffid`, `user_school`, `user_programme`, `user_department`, `user_otp`, `user_password`) VALUES ('$email','$name','$role','$matric','$staffid','$school','$programme','$department','$otp','$password')";

try {
	if ($conn->query($sqlregister) === TRUE) {
		$response = array('status' => 'success', 'data' => null);
		sendJsonResponse($response);
	}else{
		$response = array('status' => 'failed', 'data' => null);
		sendJsonResponse($response);
	}
}
catch(Exception $e) {
  $response = array('status' => 'failed', 'data' => null);
  sendJsonResponse($response);
}
$conn->close();

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}

	

?>