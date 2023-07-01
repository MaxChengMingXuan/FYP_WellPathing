<?php
	error_reporting(0);
	if (!isset($_GET['userid'])) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
	}
	$userid = $_GET['userid'];
	include_once("dbconnect.php");
	$sqlloadresult = "SELECT * FROM tbl_results WHERE user_id = '$userid'";
	$result = $conn->query($sqlloadresult);
	if ($result->num_rows > 0) {
		$resultsarray["results"] = array();
		while ($row = $result->fetch_assoc()) {
			$rlist = array();
			$rlist['result_id'] = $row['result_id'];
			$rlist['user_id'] = $row['user_id'];
			$rlist['sskm_score'] = $row['sskm_score'];
			$rlist['sskm_level'] = $row['sskm_level'];
			$rlist['sskm_sentiasa'] = $row['sskm_sentiasa'];
			$rlist['result_date'] = $row['result_date'];
			array_push($resultsarray["results"],$rlist);
		}
		$response = array('status' => 'success', 'data' => $resultsarray);
    sendJsonResponse($response);
		}else{
		$response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
	}
	
	function sendJsonResponse($sentArray)
	{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
	}