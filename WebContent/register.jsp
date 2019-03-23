<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.0.js"></script>
<script type="text/javascript">
			$('#menu').dropotron();
		</script>
<script type="text/javascript">
  function initAutocomplete() {
    // Create the autocomplete object, restricting the search to geographical
    // location types.
    autocomplete = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('YOUR_INPUT_ELEMENT_ID')),
        {types: ['geocode']});

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete.addListener('place_changed', fillInAddress);
  }

  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

  }
    </script>
<script type="text/javascript">
     function initGeolocation()
     {
        if( navigator.geolocation )
        {
           // Call getCurrentPosition with success and failure callbacks
           navigator.geolocation.getCurrentPosition( success, fail );
        }
        else
        {
           alert("Sorry, your browser does not support geolocation services.");
        }
     }

     function success(position)
     {

         document.getElementById('lon').value = position.coords.longitude;
         document.getElementById('lat').value = position.coords.latitude;
         
         
         
     }

     function fail()
     {
        // Could not obtain location
     }
     
   </script>    
</head>
<body onLoad="initGeolocation();">
<%
if(request.getParameter("exists")!=null)
{
	out.println("<script>alert('Email Or Username Already Exists')</script>");
}
if(request.getParameter("fail")!=null)
{
	out.println("<script>alert('Your Given Location And Your Current Location Didn't Matched.)</script>");
}
%>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<%@include file="logo.jsp" %>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index.jsp" accesskey="1" title="">Home</a></li>
				<li><a href="user.jsp" accesskey="2" title="">User</a></li>
				<li class="active"><a href="register.jsp" accesskey="3" title="">Register</a></li>
				<li><a href="admin.jsp" accesskey="4" title="">Admin</a></li>
				
			</ul>
		</div>
	</div>
</div>

<div id="footer">
	<div class="container">
		
		<h2><span>User Register</span></h2><br>
         
       <form action="userregister" method="post" >
            <table align="center">
            <tr>
            <td><strong>First Name</strong></td><td><input type="text" name="fname"  required></input>&nbsp;&nbsp;&nbsp;</td></tr>
         <tr>  <td><strong>Last Name</strong></td><td><input type="text" name="lname" required></input>&nbsp;&nbsp;&nbsp;</td>
            </tr>
            
            
            <tr>
            <td><strong>Date of Birth</strong></td><td><input type="date" name="dob" id="popupDatepicker" required></input></td></tr>
           
        
            
            <tr>
            <td><strong>Gender</strong></td><td>&nbsp;Male&nbsp;<input type="radio" name="gender" id="gender" value="male"></input> &nbsp;Female&nbsp;<input type="radio" name="gender" id="gender" value="female"></input>&nbsp;Other&nbsp;<input type="radio" name="gender" id="gender" value="other"></input></td></tr>
           
         
           
          
           
            <tr>
            <td><strong>Email Id</strong></td><td><input type="email" name="email" id="email"  required></input>
             </td></tr>
          <tr>  <td><strong>Mobile no</strong></td><td><input type="number" name="mobile"  maxlength="10" pattern="\d{10}" required></input></td>
            </tr>
           
           
            <tr> <td><strong>Address</strong></td><td><input type="text" name="address" required></input></td>
            </tr>
            
             <tr>
<!--               <td><strong>Your Location</strong></td><td><input type="text" name="location" id="YOUR_INPUT_ELEMENT_ID" required></input></td> -->
            <td> <input type="hidden" id="lat" name="lat" value=""></td>
         <td>  <input type="hidden" id="lon" name="lon" value=""></td> 
            </tr>
               
            <tr> <td><strong>Username</strong></td><td><input type="text" name="username" required></input></td>
            </tr>
           <tr> <td><strong>Password</strong></td><td><input type="password" name="password" required></input></td>
            </tr>
                  </table>
            <br/>
            <table align="center">
            <tr>
            <td><input type="submit" class="button" value="Register" name="Register"/></td>
            
            <td> <input type="reset" class="button" value="Reset"></td>
            <!-- <img src="images/reset.png" width="60" height="40" title="Reset"></img> -->
            </tr>
            
            
            
            </table>
					
												
			</form>
          
		
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy0s9WPPnGIRND5l3Ge5boww_SbTOEOxs&libraries=places&callback=initAutocomplete"
         async defer></script>
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
