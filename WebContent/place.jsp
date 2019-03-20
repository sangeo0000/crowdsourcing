<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.unknown.DateDifferentExample"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%@include file="title.jsp" %></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
if (navigator.geolocation) {
	
    navigator.geolocation.getCurrentPosition(function (p) {
    	
        var LatLng = new google.maps.LatLng(<%=session.getAttribute("lat")%>, <%=session.getAttribute("lon")%>);
        
       
        var mapOptions = {
            center: LatLng,
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        var marker = new google.maps.Marker({
            position: LatLng,
            map: map,
//             title: "Latitude: " + p.coords.latitude + "\n Longitude: " + p.coords.longitude
        });
        google.maps.event.addListener(marker, "click", function (e) {
            var infoWindow = new google.maps.InfoWindow();
            infoWindow.setContent(marker.title);
            infoWindow.open(map, marker);
            
         
            
        });
    });
    
    
} else {
    alert('Geo Location feature is not supported in this browser.');
}
</script>


</head>
<body>
<%

if(request.getParameter("follows")!=null){
	   out.println("<script>alert('Follows Successfully...'); </script>"); 
	}
if(request.getParameter("success")!=null){
	   out.println("<script>alert('Posted successfully...'); </script>"); 
	}
if(request.getParameter("Unfollow")!=null){
	   out.println("<script>alert('Unfollow successfully...'); </script>"); 
	}
%>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo"><br><br><br>
	<img src="images/user.jpg" alt="" height="50px" width="50px"/>
	<h3>Admin</h3>
	<br><br>
		</div>
		<div id="menu">
<%-- 			<%@include file="menuadmin.jsp" %> --%>
		</div>
	</div>
</div>

<div id="footer">

	<div class="container">
		


         
       
             
<div id="dvMap" style="width: 500px; height:400px;border: 3px solid #000;">  
           
		
		 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy0s9WPPnGIRND5l3Ge5boww_SbTOEOxs&libraries=places&signed_in=true&callback=initMap"
        async defer></script> 
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
