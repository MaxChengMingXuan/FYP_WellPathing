<?php
	error_reporting(0);
	include_once("dbconnect.php");
	$search  = $_GET["search"];
	$results_per_page = 10;
	$pageno = (int)$_GET['pageno'];
	$page_first_result = ($pageno - 1) * $results_per_page;
	
	if ($search =="all"){
			$sqlloadresult = "SELECT * FROM tbl_results ORDER BY result_date DESC";
	}else{
		$sqlloadresult = "SELECT * FROM tbl_results WHERE result_date LIKE '%$search%' ORDER BY result_date DESC";
	}
	
	$result = $conn->query($sqlloadresult);
	$number_of_result = $result->num_rows;
	$number_of_page = ceil($number_of_result / $results_per_page);
	$sqlloadresult = $sqlloadresult . " LIMIT $page_first_result , $results_per_page";
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
		$response = array('status' => 'success', 'numofpage'=>"$number_of_page",'numberofresult'=>"$number_of_result",'data' => $resultsarray);
    sendJsonResponse($response);
		}else{
		$response = array('status' => 'failed','numofpage'=>"$number_of_page", 'numberofresult'=>"$number_of_result",'data' => null);
    sendJsonResponse($response);
	}
	
	function sendJsonResponse($sentArray)
	{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
	}