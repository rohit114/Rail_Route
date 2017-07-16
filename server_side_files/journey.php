<?php
include __DIR__ . '/db_config.php'; 

   $conn = new mysqli(DB_SERVER,DB_USERNAME, DB_PASSWORD,DB_DATABASE);
   if($conn->connect_error)
   	die( "connection_error".$conn->connect_error) ;
   $result=array();
   $i=0;
   $j=0;
   $size = 4 ;
    for($i=0;$i<$size;$i++)
    {
    	for($j=0;$j<$size;$j++)
    	{
    		$is = strval($i) ;
    		$js = strval($j) ;
    		$sql = "SELECT MIN(distance) FROM journey WHERE source = '$i' AND destination = '$j' " ;
		$sql1 = "SELECT COUNT(*) FROM journey WHERE source = '$i' AND destination = '$j'" ;
		
		$res1 = $conn->query($sql1);
    	        $res = $conn->query($sql);	
    	        if(!$res)
    	        	echo "error\n" ;	
    		$index = $size*$i + $j ;
    		//$tag=strval($index);
    		$tag = (string) $index;
    		//echo $tag;
    		$row1 = mysqli_fetch_array($res1);
    		if($row1[0] > 0 )
    		{
    			$row = mysqli_fetch_array($res) ;
    			$result[$tag] = $row[0];
    		}	
		else
		{
			$result[$tag] = "0" ;
		}
		
    	}
    }
   
    
    echo json_encode($result);
    
?>
