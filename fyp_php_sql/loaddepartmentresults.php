<?php
	error_reporting(0);
	if (!isset($_GET['userdepartment'])) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
	}
	$userdepartment = $_GET['userdepartment'];
	include_once("dbconnect.php");
	$sqlloadresult = "SELECT * FROM tbl_results t1 INNER JOIN tbl_users t2 ON t2.user_id = t1.user_id WHERE t2.user_department = '$userdepartment'";
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
		$response = array('status' => 'failed_sql', 'data' => null);
    sendJsonResponse($response);
	}
	
	function sendJsonResponse($sentArray)
	{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
	}