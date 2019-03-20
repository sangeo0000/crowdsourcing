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
			<%@include file="menuadmin.jsp" %>
		</div>
	</div>
</div>

<div id="footer">

	<div class="container">
		<h2>User Language Based Filter Tweets</h2>	<br />

<form action="language.jsp" align="left">
Select Name: 
<select name="name" required style="width: 20%">
<option value="">---Select---</option>
<%
Connection con = DbConnection.getConnection();
PreparedStatement ps = con.prepareStatement("select * from user_info");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
	%>
	<option value="<%=rs.getString("language") %>"><%=rs.getString("language") %></option>
	<%
}
%>
</select> 
<input type="submit" value="Submit">
</form>


<form action="language.jsp" align="right">
Enter Name:<input type="text" name="name" required>
<input type="submit" value="Submit">
</form>

<%
if(request.getParameter("name")!=null)
{

%>

         <br />
       <table align="center" border="1" width="100%">
       <tr>
       <th>SrNo</th>
       <th>Name</th>
        <th>Tweet</th>
         <th>GeoLacation</th>
          
          
            
            </tr>
            
            <%
            int srno=1;
            //Connection con = DbConnection.getConnection();
            String name = request.getParameter("name");
            System.out.println(name);
            PreparedStatement ps1 = con.prepareStatement("select s.poststatus,s.lat,s.lon from user_info u,status s where u.language='"+name+"' and u.id=s.userid");
           
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
            	%>
            	<tr>
            	<td><%=srno++ %></td>
            	<td><%=name%></td>
            	<td><%=rs1.getString("poststatus") %></td>
            	<td><a href="admin?lat=<%=rs1.getString("lat") %>&lon=<%=rs1.getString("lon") %>" target="_blank">Search City</a></td>
            	
            	
            	
            	<%
            }
            %>
            </tr>
       </table>
          
           
		
		
<%} %>		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
