<?php
$user="root";
$pass="alam";
$database="BusMe";


$conn= mysqli_connect('localhost',$user,$pass,$database);

?>


<!DOCTYPE html>
<html>
<head>
	<title>Route Planner</title>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="map.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
    
  <script src="https://maps.googleapis.com/maps/api/js?libraries=places"></script>
  <script src="../js/mapmanager.js"></script>
  <script src="../js/usermanager.js"></script>
  <script src="../js/dbloc.js"></script>
  
  

	<link rel="stylesheet" href="../StyleSheets/BusRoute.css">
</head>

<body>
	<nav>
		<ul class="menu">
		<li class=" logo1 "><a href="Home.php"><img src="../Images/logo1.jpg" height="85px" width="60%"/></a></li>
		  <li class="menu"><a  href="Home.php">HOME</a></li>
		  <li class="menu" ><a  href="MapRoute.php">MAP ROUTES</a></li>
		  <li class="menu"><a  class="active" href="BusRoute.php">BUS ROUTE</a></li>
		  <li class="menu"><a href="Home.php#services">SERVICES</a></li>
		  <li class="menu"><a href="aboutus.php">ABOUT US</a></li>
		</ul>
	</nav>
	<?php
$query="select * from busme_area order by Name asc";
$result=mysqli_query($conn,$query);

?>
	<div id="BusRoutes_Background">
		<div id="BusRoutes" class="container text-center" >
			
			<div id="MapRoutesTopic"  >
				<h3 class="topic">FIND BUS ROUTES</h5>
			</div>
			<div id="FormDiv" class="col-sm-6">		
				<form  method="post" class="form-horizontal">
    <div class="form-group">
        <label class="col-xs-12 control-label text-center">Starting Point</label>
        <div class="col-xs-12 selectContainer">
            <select name="start" class="form-control" >
          <?php 
                foreach($result as $res){
	            $Area=$res['Name'];
				echo '<option value="'.$Area.'">'.$Area.'</option>';
				}
				?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-xs-12 control-label text-center">Ending Point</label>
        <div class="col-xs-12 selectContainer">
            <select name="end" class="form-control">
           <?php 
				foreach($result as $res){
				$Area=$res['Name'];
				echo '<option value="'.$Area.'">'.$Area.'</option>';
						}
						?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-12 ">
            <button type="submit" name="submit" class="btn btn-default">Let's Go!</button>
        </div>
    </div>
</form>
			</div>
			
		
			
			
<div class="col-sm-12" style="border:2px solid black">

  <?php
$request_count=0;
$StartString="";
$Joint=array();
$Bus=array();
  if(isset($_POST['submit'])){
    $From=$_POST['start'];
	$To=$_POST['end'];
	$queryFind="select * from busme_bus where bus_route like '%$From%' and Bus_route like '%$To%'";
	$result1=$conn->query($queryFind);
$request_count=$result1->num_rows;

if($request_count>0){
	echo '<table style="width:100%" class="table table-striped">
    <tr>
    <td><strong>Bus Name</strong></td>
	<td><strong>Bus Route</strong></td>
<td><strong>Start Time</strong></td>
<td><strong>Expected Delay</strong></td>
<td><strong>Ending Time</strong></td>
<td><strong>View</strong></td>	
    </tr>';
	
foreach($result1 as $ress){
   echo'<tr> <td>'.$ress['Bus_Name'].'</td>
	<td>'.$ress['Bus_Route'].'</td>
	<td>'.$ress['Start_Time'].' AM</td>
	<td>'.$ress['Delay_Time'].' Minutes</td>
	<td>'.$ress['End_Time'].' PM</td>
	<td><a href="Route.php?id='.$ress['Bus_ID'].'" target="_blank">View</a></td></tr>';
  }
  echo '</table>';
  }
  
  
  else{
	  
	$START=$_POST['start'];
	$END=$_POST['end'];

$query1="select * from busme_bus where bus_route like '%$START%' limit 1";
$resultStart=mysqli_query($conn,$query1);

foreach($resultStart as $R1){
	$StartString=$R1['Bus_Route'];
	$IndexStart=$R1['Bus_ID'];
	$StartBusName=$R1['Bus_Name'];
}

$startArray=explode(",",$StartString);
$query2="select * from busme_bus where bus_route like '%$END%'";
$resultEnd=mysqli_query($conn,$query2);

foreach($resultEnd as $R2){
	
	$EndString=$R2['Bus_Route'];
	$IndexEnd=$R2['Bus_ID'];
	$BusName=$R2['Bus_Name'];
	
	for($a=0;$a<sizeof($startArray);$a++){
		$pattern="/".$startArray[$a]."/";
		if(preg_match($pattern,$EndString)){
			
			$Joint[]=$startArray[$a];
		    $Bus[]=$BusName;
		   
			break;
			
		}
		
	}
	
}
for($i=0;$i<sizeof($Joint);$i++){
	$x=$i+1;
echo $x.")From ".$START." take ".$StartBusName." TO ".$Joint[$i]." then take ".$Bus[$i]." to ".$END." <br/>";
}
	
 }
  }
	?>
  

		
		</div>

		</div>
	</div>	
	
	<footer>
		<div class="container" >
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<a href="Home.php"><img src="../Images/logo2.png" height="85px" width="60%"/>
			</div>
			<div class="col-md-2">
				 <h5><a style="color:#85cf17;list-style-type:none;" href="Home.html"><b>Home</b></a><h5>
				<h5><a style="color:#85cf17;list-style-type:none;" href="#MapRoutes"><b>Map Routes</b></a></h5>
				<h5><a style="color:#85cf17;list-style-type:none;" href="#contact"><b>Bus Routes</b></a></h5>
				<h5><a style="color:#85cf17;list-style-type:none;" href="#services"><b>Services</b></a></h5>
			</div>
			<div class="col-md-2">
				 <h5><a style="color:#85cf17;list-style-type:none;" href="Home.html"><b>Group Members</b></a><h5>
					<div class="text-left">
						<h6>Agha Zarwali Jan</h6>
						<h6>Farhan Qasim</h6>
						<h6>Uzair Alam</h6>
					</div>

			</div>
			<div class="col-md-3">&copy proudly created by Dim Light Innovation</div>
			<div class="col-md-2"></div>
		</div>
		
	</footer>
</body>

</html>
<?php
mysqli_close($conn);
?>