<!DOCTYPE html>
<html>
<head>
	<title>Routes</title>
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
  
  <script>
       $(function(){
        $("#navbar").load("navbar.html"); 
        $("#signupform").load("signupform.html"); 
        $("#footer").load("footer.html"); 
       });
   </script>    
    
	<script>
		function initialize() {
		var MyMap = new MapManager();
			}// end of initialize

		// Run the initialize function when the window has finished loading.
		google.maps.event.addDomListener(window, 'load', initialize);	
	</script>    

  

	<link rel="stylesheet" href="../StyleSheets/BusRoute.css">
</head>

<body>
	<nav>
		<ul class="menu">
		<li class=" logo1 "><a href="Home.php"><img src="../Images/logo1.jpg" height="85px" width="60%"/></a></li>
		  <li class="menu"><a  href="Home.php">HOME</a></li>
		  <li class="menu" ><a  class="active" href="MapRoute.php">MAP ROUTES</a></li>
		  <li class="menu"><a  href="BusRoute.php">BUS ROUTE</a></li>
		  <li class="menu"><a href="Home.php#services">SERVICES</a></li>
		  <li class="menu"><a href="aboutus.php">ABOUT US</a></li>
		</ul>
	</nav>
	
	<div id="BusRoutes_Background">
		<div id="BusRoutes" class="container text-center" >
			
			<div id="MapRoutesTopic"  >
				<h3 class="topic">SET DESTINATION</h5>
			</div>
			<div id="FormDiv" class="col-sm-6">		
				<form>
					<input type="text" id="routeStart" class="feedback-input" placeholder="Starting Point ..." name="search" >
					<input type="text" id="routeEnd" class="feedback-input" placeholder="Enter Destination ..." >
					<button id="submit" type="button" class="feedback-input" onclick="return false;"> Get Directions</button>
				</form>
			</div>
			
			<div id="APIDiv" class="col-sm-6">
				<div id="myMap" style="width:100%; height:350px; margin:0 auto; border:1.5px solid #ccc"></div>
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