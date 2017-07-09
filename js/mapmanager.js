// MapManager.js contains all the functions that load our custom map into our map div, adds the 
// search functionality, directions functionality and edit map functionality
// also stores any changes a user makes to the map into the database


var map;
var MapManager = function() {
    // set up map specs, feed these to map creator function
    var mapOptions = {
        center: new google.maps.LatLng(24.893379,67.0280609),
        maxZoom: 21, 
        minZoom: 13,
        streetViewControl: false,
        zoom: 17,
        mapTypeId: google.maps.MapTypeId.ROADMAP
        };
    
    // create the map
    map = new google.maps.Map(document.getElementById("myMap"), mapOptions);

    // erase base google features layer
    map.set('styles',[{
                    featureType: "poi",
                    elementType: "labels",
                    stylers: [{
                        visibility: "on" // turn on to see places
                             }]
                      },
                      {
                    featureType: "transit",
                    elementType: "labels",
                    stylers: [{
                        visibility: "on" // turn on to see bus stops, railway stations, etc
                             }]
                      }
                     ]);
    
    // setUpMapBounds, stay in karachi
    this.setUpBounds();
    
    // add geolocation
    var centerControlDiv = document.createElement('div');
    this.CenterControl(centerControlDiv);
    centerControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);

    var MarkerControlDiv = document.createElement('div');
    this.MarkerControl(MarkerControlDiv, map);
    MarkerControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(MarkerControlDiv);

    google.maps.event.addListener(map, "dblclick", function(event) {
    addFavMarker(event.latLng); });

    // setUpAutoComplete, find places through database
    this.setUpSearch();
        
    // setUpDirectionService, suggest directions from A to B
    this.setUpDirections();
    
    
};// end ctor


MapManager.prototype.MarkerControl = function(controlDiv, map) {
  
  controlDiv.style.padding = '10px';
  var controlWrapper = document.createElement('div');
  controlWrapper.style.backgroundColor = '#F5F5F5';
  controlWrapper.style.borderStyle = 'solid';
  controlWrapper.style.borderColor = 'gray';
  controlWrapper.style.borderWidth = '1px';
  controlWrapper.style.cursor = 'pointer';
  controlWrapper.style.textAlign = 'center';
  controlWrapper.style.width = '34px'; 
  controlWrapper.style.height = '96px';
  controlWrapper.title= 'Select Marker (Normal/Home/Work)';
  controlDiv.appendChild(controlWrapper);

  var MarkerButton = document.createElement('div');
  MarkerButton.style.width = '32px'; 
  MarkerButton.style.height = '32px';
  MarkerButton.style.backgroundImage = 'url("http://www.business-school.ed.ac.uk/__data/assets/image/0003/59475/map-marker.png")';
  controlWrapper.appendChild(MarkerButton);
    
  var HomeButton = document.createElement('div');
  HomeButton.style.width = '32px'; 
  HomeButton.style.height = '32px';
  HomeButton.style.backgroundImage = 'url("https://upload.wikimedia.org/wikipedia/commons/d/dd/Farm-Fresh_house.png")';
  controlWrapper.appendChild(HomeButton);
    
  var WorkButton = document.createElement('div');
  WorkButton.style.width = '32px'; 
  WorkButton.style.height = '32px';
  WorkButton.style.backgroundImage = 'url("http://wcdn4.dataknet.com/static/resources/icons/set1/cea8e134e4b.png")';
  controlWrapper.appendChild(WorkButton);


  var location;
    
  google.maps.event.addListener(map, "rightclick", function(event) {
        location = event.latLng;
  });

  google.maps.event.addDomListener(MarkerButton, 'click', function() {
        addMarker(location); });
    
  google.maps.event.addDomListener(HomeButton, 'click', function() {
        addHomeMarker(location); });
   
  google.maps.event.addDomListener(WorkButton, 'click', function() {
        addWorkMarker(location);
  });  
    
};


MapManager.prototype.CenterControl = function(controlDiv) {

  var controlUI = document.createElement('div');
    controlUI.style.backgroundColor = '#1abc9c';
    controlUI.style.border = '2px solid #1abc9c';
    controlUI.style.borderRadius = '3px';
    controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
    controlUI.style.cursor = 'pointer';
    controlUI.style.marginBottom = '22px';
    controlUI.style.textAlign = 'center';
    controlUI.title = 'Click to locate';
    controlDiv.appendChild(controlUI);

    var controlText = document.createElement('div');
    controlText.style.color = '#fff';
    controlText.style.fontFamily = 'Montserrat,Arial,sans-serif';
    controlText.style.fontSize = '17px';
    controlText.style.lineHeight = '38px';
    controlText.style.paddingLeft = '5px';
    controlText.style.paddingRight = '5px';
    controlText.innerHTML = 'Locate Me';
    controlUI.appendChild(controlText);

    controlUI.addEventListener('click', function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition( function(position) {
                var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    
                var marker = new google.maps.Marker({
                    position: coords,
                    map: map,
                    title: 'You right now'
                });
    
                var minfowindow = new google.maps.InfoWindow({
                    content: "We Found You!"
                });
    
                marker.addListener('click', function() {
                    minfowindow.open(map, marker);
                });
    
                map.setCenter(coords);
                map.setZoom(17);
            });
        } else {
                alert("You don't support this");
        }
    
    });
    
};// end CreateControlButton

MapManager.prototype.setUpDirections = function() {
    var directionsDisplay = new google.maps.DirectionsRenderer();
    var directionsService = new google.maps.DirectionsService();
    
    // the html object we will use as searchbox
    var input1 = document.getElementById('routeStart');
    var input2 = document.getElementById('routeEnd');
    
    // bias the search to only show results from pakistan
    var options = {
        componentRestrictions: {
            country: "PK"
        }
    };
    
    var SW = new google.maps.LatLng(24.839020, 66.660907);
    var NE = new google.maps.LatLng(25.059409, 67.482135);
    var bounds = new google.maps.LatLngBounds(SW,NE);
    
    var startComplete = new google.maps.places.Autocomplete(input1, options);
    startComplete.setBounds(bounds);
    var endComplete = new google.maps.places.Autocomplete(input2, options);
    endComplete.setBounds(bounds);
   startComplete.addListener('place_changed', function() {
       endComplete.addListener('place_changed', function() {
            var start = startComplete.getPlace();
            var end = endComplete.getPlace();
    
            if (!start.geometry) {
                alert("Your source did not map to a specific place");
                return;
            }
        
            if (!end.geometry) {
                alert("Your destination did not map to a specific place");
                return;
            }    
            
           directionsDisplay.setMap(map);
           directionsDisplay.setPanel(document.getElementById('directionsPanel'));
  
            var request = {
                origin: start.geometry.location,
                destination: end.geometry.location,
                unitSystem: google.maps.UnitSystem.METRIC,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
     
            directionsService.route(request, function(response, status) {
                if (status === google.maps.DirectionsStatus.OK) {
                $('#directionsPanel').empty(); // clear the directions panel before adding new directions
                directionsDisplay.setDirections(response);
                } else {
                // alert an error message when the route could nog be calculated.
                if (status === 'ZERO_RESULTS') {
                alert('No route could be found between the origin and destination.');
            } else if (status === 'UNKNOWN_ERROR') {
                alert('A directions request could not be processed due to a server error. The request may succeed if you try again.');
            } else if (status === 'REQUEST_DENIED') {
                alert('This webpage is not allowed to use the directions service.');
            } else if (status === 'OVER_QUERY_LIMIT') {
                alert('The webpage has gone over the requests limit in too short a period of time.');
            } else if (status === 'NOT_FOUND') {
                alert('At least one of the origin, destination, or waypoints could not be geocoded.');
            } else if (status === 'INVALID_REQUEST') {
                alert('The DirectionsRequest provided was invalid.');         
            } else {
                alert("There was an unknown error in your request. Requeststatus: nn"+status);
            }
        }
  });
       });});
       

};// end DirectionsSuggester


MapManager.prototype.setUpBounds = function() {
    // the limits
    var SW = new google.maps.LatLng(24.839020, 66.660907);
    var NE = new google.maps.LatLng(25.059409, 67.482135);
    var bounds = new google.maps.LatLngBounds(SW,NE);
        // Listen for the dragend event
   
    google.maps.event.addListener(map, 'dragend', function() {
    if(bounds.contains(map.getCenter())) return bounds; // good

     // We're out of bounds - Move the map back within the bounds
     var c = map.getCenter(), x = c.lng(), y = c.lat(),
         maxX = bounds.getNorthEast().lng(), maxY = bounds.getNorthEast().lat(),
         minX = bounds.getSouthWest().lng(), minY = bounds.getSouthWest().lat();

     if (x < minX) x = minX;
     if (x > maxX) x = maxX;
     if (y < minY) y = minY;
     if (y > maxY) y = maxY;

     map.setCenter(new google.maps.LatLng(y, x));
   });
   
    return bounds;
};// end SetUpBounds()



MapManager.prototype.setUpSearch = function() {
    // the html object we will use as searchbox
    var input = document.getElementById('locname');
    // bias the search to only show results form pakistan
    var options = {
        componentRestrictions: {
            country: "PK"
        }
    };
    var SW = new google.maps.LatLng(24.839020, 66.660907);
    var NE = new google.maps.LatLng(25.059409, 67.482135);
    var bounds = new google.maps.LatLngBounds(SW,NE);
    // the autocomplete object 
    var autoComplete = new google.maps.places.Autocomplete(input, options);
    autoComplete.setBounds(bounds);
   
    // Get the full place details when the user selects a place from the
    // list of suggestions.
    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: google.maps.Point(0, -29)
    });
        
        // when user searches for other place close old place info
    autoComplete.addListener('place_changed', function() {
        infowindow.close();
        marker.setVisible(false);
        
        // returns PlaceResult object. that has all the details.
        var place = autoComplete.getPlace();
        
        if (!place.geometry) {
            alert("Search did not return any results");
            return;
        }
        else {
            var myPlaceObject = {
                "properties": {
                    "place_id": place.place_id,
                    "name": place.name,
                    "latitude": place.geometry.location.lat(),
                    "longitude": place.geometry.location.lng(),
                    "rating": place.rating,
                    "formatted_address": place.formatted_address,
                    "formatted_phone_number": place.formatted_phone_number,
                    "icon": place.icon,
                    "website": place.website,
                    "price_level": place.price_level,
                    "vicinity": place.vicinity,
                    "tags": place.types
                }
            };
        
        
        // if loc not in db add to db
        checkPlaceExists(myPlaceObject.properties.place_id, function(exists) {
            if(exists) { return true; } // do nothing
            else addPlaceToDB(myPlaceObject.properties, function(added) {
                if(added) { return true; }
            });
              
        });
        }

        // If the place has a geometry, then present it on a map.
        if(place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        
        marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(64, 64),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
        }));
        
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);
        
        infowindow.setContent('<span style="padding: 0px; text-align:left" align="left"><h5>' + place.name +
                '&nbsp; &nbsp; ' + place.rating + '</h5><p>' + place.formatted_address + 
                '<br>' + place.formatted_phone_number + '<br>' +  
                '<a href=' + place.website + '>' + place.website + '</a></p>');
        
        infowindow.open(map, marker);
    
    });

};// end setupsearch()

function addFavMarker(location) {
    var contentString=$('<div><h5>My Favourite</h5>' +'<button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button></div>');
        var marker = new google.maps.Marker({
        position: location,
        map: map,
        animation: google.maps.Animation.DROP,
        title: "Favourite",
        icon: 'https://upload.wikimedia.org/wikipedia/commons/7/73/Farm-Fresh_star.png'
    });
    var infowindow = new google.maps.InfoWindow();
    infowindow.setContent(contentString[0]);
    marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
    
    var removeBtn = contentString.find('button.remove-marker')[0];
        google.maps.event.addDomListener(removeBtn, 'click', function(event) {
            marker.setMap(null);
        });

};

function addWorkMarker(location) {
        var contentString=$('<div><br>'+
                                '<h5>My Work Location</h5>'+
                                '<button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button></div>');
        var marker = new google.maps.Marker({
        position: location,
        map: map,
        animation: google.maps.Animation.DROP,
        title: "Work",
        icon: 'http://wcdn4.dataknet.com/static/resources/icons/set1/cea8e134e4b.png'
    });
        var infowindow = new google.maps.InfoWindow();
    infowindow.setContent(contentString[0]);
    marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
    
    var removeBtn = contentString.find('button.remove-marker')[0];
        google.maps.event.addDomListener(removeBtn, 'click', function(event) {
            marker.setMap(null);
        });
    
};


function addHomeMarker(location) {
        var contentString=$('<div><h5>My Home Location</h5>'+'<button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button></div>');
        var marker = new google.maps.Marker({
        position: location,
        map: map,
        animation: google.maps.Animation.DROP,
        title: "Home",
        icon: 'https://upload.wikimedia.org/wikipedia/commons/d/dd/Farm-Fresh_house.png'
    });
        
    var infowindow = new google.maps.InfoWindow();
    infowindow.setContent(contentString[0]);
    marker.addListener('click', function() {
        infowindow.open(map, marker);
  });
    
    var removeBtn = contentString.find('button.remove-marker')[0];
        google.maps.event.addDomListener(removeBtn, "click", function(event) {
            marker.setMap(null);
        });
    
};

function addMarker(location) {
        var marker = new google.maps.Marker({
        position: location,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        title: document.getElementById("mtitle"),
        icon: 'http://www.business-school.ed.ac.uk/__data/assets/image/0003/59475/map-marker.png'
    });
    
    getNewMarkerID(function(id) {
         marker.set("marker_id", id);
         marker.set("latitude", marker.position.lat());
         marker.set("longitude", marker.position.lng());
         marker.set("label", marker.getTitle());
         
          // add this marker to the database as well
         addMarkertoDB(marker);
    });
    var contentString=$
        ('<div><input id="mtitle" type="text" placeholder="Title" style="font-style:italic"><br>'+
         '<strong>Coordinates: </strong>' + marker.position.lat() + ', ' + marker.position.lng() + '<br><br>' +       
         '<button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button></div>');
        
        
    var infowindow = new google.maps.InfoWindow();
    marker.addListener('click', function() {
        infowindow.setContent(contentString[0]);
        infowindow.open(map, marker);
  });
  
    marker.addListener('drag', function() {
        infowindow.close();
  });
    
    var removeBtn = contentString.find('button.remove-marker')[0];
        google.maps.event.addDomListener(removeBtn, "click", function(event) {
            removeMarkerfromDB(marker.marker_id);
            marker.setMap(null);
        });
    
};

