<?php
include __DIR__ . '/db_config.php'; 

   $conn = new mysqli(DB_SERVER,DB_USERNAME, DB_PASSWORD,DB_DATABASE);
   if($conn->connect_error)
   	die( "connection_error".$conn->connect_error) ;
   $result=array();
   $result1 = array();
   $sql = "SELECT * FROM train";
   $sql1 = "SELECT * FROM journey";
   $size = 4;
   $res1 = $conn->query($sql1);
   $res = $conn->query($sql);	
    	        if(!$res)
    	        	echo "error\n" ;
    	        if(!$res1){
    	        	echo "error1\n";
    	        }
    	        
   //$train_info = mysqli_fetch_array($res);
   while($row = $res->fetch_assoc()){
   
	   $train_id =  $row["tid"];
   	   $train_name =  $row["tname"];
   	   $result[$train_id] = $train_name ;
   }
  
   while($row1 = $res1->fetch_assoc()){
   	
   	$source =  $row1["source"];
	$destination= $row1["destination"];
	$train_day = $row1["day"] ;
   	$train_arrival = $row1["arrival"] ;
   	$train_departure = $row1["departure"] ;
	$key = strval($source)."+".strval($destination);
	$tid = $row1["tid"];
	$result1[$key] = $result[$tid]."    ";
	$result1[$key] .=$train_day."    " ;
	$result1[$key] .=$train_arrival."    " ;
	$result1[$key] .=$train_departure ;
	//echo $result1[$key] ;     
   }
   
   //}
    		
   
    
    echo json_encode($result1);
    
?>
