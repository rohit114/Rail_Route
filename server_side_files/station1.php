<?php
include __DIR__ . '/db_config.php';

   $conn = new mysqli(DB_SERVER,DB_USERNAME, DB_PASSWORD,DB_DATABASE);
   if($conn->connect_error)
   	die( "connection_error".$conn->connect_error) ;
   		
   $result = array();
   $sql = "SELECT * FROM station";
       
   $res = $conn->query($sql);	
       if(!$res)
    		echo "error\n" ;
    		
   while($row = $res->fetch_assoc()){
      
	   $station_id =  $row["sid"];
   	   $station_name = $row["sname"];
   	   $result[$station_id] = $station_name;
   }
     
   echo json_encode($result);
   
?>
