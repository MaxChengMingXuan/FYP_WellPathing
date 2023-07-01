<?php
	if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
	}
	include_once("dbconnect.php");
	$userid = $_POST['userid'];
  $score= $_POST['score'];
	$level= $_POST['level'];
	$sentiasa= $_POST['sentiasa'];

	
	$sqlinsert = "INSERT INTO `tbl_results`(`user_id`, `sskm_score`, `sskm_level`, `sskm_sentiasa`) VALUES ('$userid','$score','$level','$sentiasa')";
	
    try {
		if ($conn->query($sqlinsert) === TRUE) {
			
			$response = array('status' => 'success', 'data' => null);
			sendJsonResponse($response);
		}
		else{
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
    header('Content-Type= application/json');
    echo json_encode($sentArray);
	}
?>

