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
          <li><a href="home.jsp">Home</a></li>
         
   			<li><a href="showdisasters.jsp">Show Disasters</a></li>
   			<li><a href="showdisastersloc.jsp">Show Disasters as per Location</a></li>
     			 <li><a href="Logout">Logout</a></li>
    		

    		
           
        </ul>
		</div>
	</div>
</div>

<div id="footer">

	<div class="container">
		

<h2> Disasters</h2>
         
      <!--  <form action="analysis" method="post">
         <table>
         <tr>
         <td>Start Date</td>
         <td><input type="date" name="start" required/></td>
         </tr>
         <tr>
         <td>End Date</td>
         <td><input type="date" name="end" required/></td>
         </tr>
         <tr>
         <td>Place</td>
         <td><input type="text" name="place" required/></td>
         </tr>
          <tr>
         <td></td>
         <td><input type="submit" value="Submit"/></td>
         </tr>
         </table> 
           
		</form>
		 -->
		<br /><br />
		
		
		
		<form action="disaster.jsp">
		<select name="senti">
		
	<option value="">---Select---</option>	
	<option value="flood">Flood</option>
	<option value="fire">Fire</option>
	<option value="earthquake">Earthquake</option>
	<option value="tsunami">Tsunami</option>
	<option value="storm">Storm</option>
	<option value="wildfire">Wildfire</option>
	</select>
		
		<input type="submit" value="Display Result">
		
		

		</form>
		
		
			</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
