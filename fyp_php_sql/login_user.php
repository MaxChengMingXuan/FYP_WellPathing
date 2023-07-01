<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$email = $_POST['email'];
$password = sha1($_POST['password']);
$sqllogin = "SELECT * FROM tbl_users WHERE user_email = '$email' AND user_password = '$password'";
$result = $conn->query($sqllogin);

if ($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()) {
		$userlist = array();
		$userlist['id'] = $row['user_id'];
		$userlist['email'] = $row['user_email'];
		$userlist['name'] = $row['user_name'];
		$userlist['role'] = $row['user_role'];
		$userlist['matric'] = $row['user_matric'];
		$userlist['staffid'] = $row['user_staffid'];
		$userlist['school'] = $row['user_school'];
		$userlist['programme'] = $row['user_programme'];
		$userlist['department'] = $row['user_department'];
		$userlist['regdate'] = $row['user_datereg'];
    $response = array('status' => 'success', 'data' => $userlist);
    sendJsonResponse($response);
	}
}else{
	$response = array('status' => 'failed', 'data' => null);
  sendJsonResponse($response);
}
	
function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}


?>