<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.unknown.DateDifferentExample"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title><%@include file="title.jsp" %></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->


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
			<ul>
          <li><a href="adminhome.jsp">Home</a></li>
         
   			
     			 <li><a href="Logout">Logout</a></li>
    		
           
        </ul>
		</div>
	</div>
</div>

<div id="footer">

	<div class="container">
		

<h2> </h2>
     <%
     String floodpercent = request.getParameter("flood");
     String firepercent = request.getParameter("fire");
     String earthquakepercent = request.getParameter("earthquake");
     %>
     
 <script type="text/javascript">
		window.onload = function () {
			var chart = new CanvasJS.Chart("chartContainer", {
				title: {
					text: "Basic Column Chart"
				},
				data: [{
					type: "column",
					dataPoints: [
						{ y: <%=floodpercent%>, label: "Flood" },
						{ y: <%=firepercent%>, label: "Fire" },
						{ y: <%=earthquakepercent%>, label: "Earthquake" },
					]
				}]
			});
			chart.render();
		}
	</script>
	<script src="canvasjs.min.js"></script>
	
		<div id="chartContainer" style="height: 400px; width: 500px;"></div>
     
     
     
     
		
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
