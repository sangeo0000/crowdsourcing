<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.unknown.DistanceCalculator"%>
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
         <li><a href="showdisasters.jsp">Show Disasters</a></li>
   			<li><a href="showdisastersloc.jsp">Show Disasters as per Location</a></li>
     			 <li><a href="Logout">Logout</a></li>
    		

    		
           
        </ul>
		</div>
	</div>
</div>

<div id="footer">

	<div class="container">
		

<h2> </h2>
   
<table  align="center" width="70%" cellpadding="8px" cellspacing="8px" style="color: white;"  border="3">
			
			<tr align="center"><th>Sr.No.</th>
				<th>User Names</th>
				<th>Post</th>
				<th>Post Date</th>
				<th>Lat , Lon</th>
				<th>Location</th>
				</tr>
 				


<%
String loc = request.getParameter("loc");
System.out.println("loc==="+loc);
String cord[]=loc.split(",");
Double lat=Double.parseDouble(cord[0]);
Double lon=Double.parseDouble(cord[1]);

DistanceCalculator dist=new DistanceCalculator();

int srno=1;
Connection con = DbConnection.getConnection();
PreparedStatement ps = con.prepareStatement("select * from user_info u join status s on u.id=s.userid order by poststatus desc");

ResultSet rs = ps.executeQuery();

while(rs.next())
{
Double lat1=Double.parseDouble(rs.getString("lat"));
Double lon1=Double.parseDouble(rs.getString("lon"));

HttpSession sess=request.getSession(true);

sess.setAttribute("lat1", lat1);
sess.setAttribute("lon1", lon1);

Double distance = dist.distance(lat, lon, lat1, lon1,"k");
System.out.println("distance===="+distance);

if(distance<=2)
{
	
			%>
				<tr align="center" style="color: black;">
				<td><%=srno++%></td>
				<td><%=rs.getString("fname")%> <%=rs.getString("lname") %></td>
				<td><%=rs.getString("poststatus") %></td>
				<td><%=rs.getString("postdate") %></td>
				<td><%=lat1%>,<%=lon1%></td>   
				<td><a href="getlocation2.jsp?lat=<%=lat1%>&lon=<%=lon1%>">location</a></td>	
			<%
}	
}
%>
     
    </tr>
    </table>
     
     
		
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
