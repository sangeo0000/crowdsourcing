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
			<%@include file="menuadmin.jsp" %>
		</div>
	</div>
</div>

<div id="footer">

	<div class="container">
		

<h2>All Users Blocked Accounts</h2><br />
         
       <table align="center" border="1">
       <tr>
       <th>SrNo</th>
       <th>Name</th>
        <th>Mobile</th>
         <th>Email</th>
          <th>Date of Birth</th>
           <th>Latitude</th>
            <th>Longitude</th>
            </tr>
            
            <%
            int srno=1;
            Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from block");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
            	%>
            	<tr>
            	<td><%=srno++ %></td>
            	<td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td>
            	<td><%=rs.getString("mobile") %></td>
            	<td><%=rs.getString("email") %></td>
            	<td><%=rs.getString("dob") %></td>
            	<td><%=rs.getString("lat") %></td>
            	<td><%=rs.getString("lon") %></td>
            	
            	<%
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
