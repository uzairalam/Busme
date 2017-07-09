<?php
$user="root";
$pass="alam";
$database="BusMe";


$conn= mysqli_connect('localhost',$user,$pass,$database);

?>


<!DOCTYPE html>
<html>
<head>
	<title>Route Map</title>
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

	<?php
	$theID=$_GET['id'];
$query="select * from busme_Bus where Bus_ID=$theID ";
$result=mysqli_query($conn,$query);
//Query to return busses of the desired route
?>
	<div id="BusRoutes_Background">
		<div id="BusRoutes" class="container text-center" >
			
	
			
			
		
			
			
			<div class="col-sm-12" style="border:2px solid black">

 <?php
 echo '<table style="width:100%" class="table table-striped">
    <tr>
    <td><strong>Bus Name</strong></td>
	<td><strong>Bus Route</strong></td>
<td><strong>Start Time</strong></td>
<td><strong>Expected Delay</strong></td>
<td><strong>Ending Time</strong></td>

    </tr>';
	
foreach($result as $ress){
   echo'<tr> <td>'.$ress['Bus_Name'].'</td>
	<td>'.$ress['Bus_Route'].'</td>
	<td>'.$ress['Start_Time'].' AM</td>
	<td>'.$ress['Delay_Time'].' Minutes</td>
	<td>'.$ress['End_Time'].' PM</td>
	</tr>';
  }
  echo '</table>';
 
 
 ?>
  
<div class="container" id="imageDiv">
<img src="../Route/<?php echo $theID;?>.png" width="100%" height="100%" />
<br/><br/>

</div>
		
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
				 <h5><a style="color:#85cf17;list-style-type:none;" href="Home.php"><b>Group Members</b></a><h5>
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