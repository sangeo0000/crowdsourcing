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
<script type="text/javascript">
function changeLikeDislike(type,id){
      var dataString = 'id='+ id + '&type=' + type;
      $("#post_flash_"+id).show();
      $("#post_flash_"+id).fadeIn(400).html('<img src="images/Loading.gif" style="border:0px;margin-bottom:0px;margin-left: -10px; margin-right: 5px;"/>');
      $.ajax({
      type: "POST",
      url: "sn2LikeDislikeServlet",
      data: dataString,
      cache: false,
      success: function(result){
               //if(result){
                  
                    $("#post_flash_"+id).hide();
              //}
               
      }
      });
}
function comment_button(event){
	
	var postid = event.id;
	//var posC = $("#")
	//var postid = document.getElementById("postid").value;
	var loggedinID = document.getElementById("loggedinID_"+postid).value;
	var postContent = $("#postContent_"+postid).val();
	
	var dataString = 'loggedinID='+ loggedinID + '&postid=' + postid +'&postContent='+postContent;
	
	//alert(dataString);
	if(postContent==''){
		alert("Please some comment.");
	}else{
		 $("#post_flash_"+postid).show();
	     $("#post_flash_"+postid).fadeIn(400).html('<img src="images/Loading.gif" style="border:0px;margin-bottom:0px;margin-left: -10px; margin-right: 5px;"/>');
		
	      $.ajax({
	    	  type: "POST",
	    	  url: "sn2CommentPost",
	    	  data: dataString,
	    	  cache: false,
	    	  success: function(html){
	    	  $("#display").after(html);
	    	  document.getElementById('postContent_'+postid).value='';
	    	  document.getElementById('postContent_'+postid).focus();
	    	  $("#post_flash_"+postid).hide();
	    	  }
	    	  });
	    	  } return false;
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
		<div id="logo">
			<%@include file="logo.jsp" %><%-- <%@include file="FollowSearchForm.jsp" %> --%>
			<%@include file="logo1.jsp" %>
		</div>
		<div id="menu">
			<ul>
				        <%@include file="menu.jsp" %>
				
			</ul>
		</div>
	</div>
</div>

<div id="footer">
<%@include file="FollowSearchForm.jsp" %>
	<div class="container">
		

<h2>Search Follower List</h2>
         
       
          
         <%
					Thread.sleep(5000);
					String SearchkeyWord = request.getParameter("followNameSearch");
					//int userid = Integer.parseInt((String)session.getAttribute("userid"));
					Connection con =DbConnection.getConnection();
					Statement st = con.createStatement();
					
					String sql = "select * from user_info where id!="+userid+" and (fname LIKE '%"+SearchkeyWord+"%' or lname LIKE '%"+SearchkeyWord+"%' or concat(fname,' ',lname) LIKE '%"+SearchkeyWord+"%')";
					ResultSet rs = st.executeQuery(sql);
					while(rs.next()){
					
					%>
					<form action="SendFollowRequest" method="post">
					<div class="friendList" style="border-bottom: 1px solid #ccc; width: 100%; margin-top:30px;float:left">
						<div style="width: 10%; height: 100px; border: 0px solid #ccc; float: left">
							<img src="profilepicture/<%= rs.getString("ppicture") %>" style="width: 100%; height: 100%">
						</div>
						<div style="width: 80%; height: 50px; border: 0px solid #ccc; float: left">
							<p style="margin-left: 30px">
							<input type="hidden" name="RequestToid" value="<%= rs.getString("id") %>">
								<span style="color:red; font-weight: bold"><%= rs.getString("fname")+" "+rs.getString("lname") %></span> <br><span style=" font-weight: bold"> <%= rs.getString("address") %></span>
							</p>
							<%
							boolean isFollow = GF.isFollow(userid, rs.getInt("id"));
							//boolean isFollowStatus = GF.isFollowStatus(userid, rs.getInt("id"));
							System.out.println(isFollow);
							//boolean isRequestSend=GF.isRequestSend(userid, rs.getInt("id"));
							if(isFollow==true){
							%>
							<span  style="margin-left:30px" class="button">Already Follow</span>
							
							<a href="SendFollowRequest?followid=<%= rs.getString("id") %>" class="buttonReject" style="width: 80px; text-align: center;">Unfollow</a>
							<%}else if(isFollow==false){
								%>
								<!-- <span  style="margin-left:30px" >Already Send Follow Request</span> -->
								<%-- <a href="SendFollowRequest?followid=<%= rs.getString("id") %>" class="buttonReject" style="width: 80px; text-align: center;">Follow</a> --%>
								<input type="submit" value="Follow">
								<%}
							
								 %>
						</div>

					</div>
					
					</form>
					
					<%
					}
					%>
				
				
			 <%
				PreparedStatement ps1=con.prepareStatement("select * from status where searchtag like '%"+SearchkeyWord+"%'");
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					String category=rs1.getString("category");
					
					%>
				
					<div style="width: 80%; height: auto; border: 0px solid #ccc; float: left;border-bottom: 1px solid #ccc;margin-top:40px;">
					
					<%
	           		
	           		if(category.equalsIgnoreCase("status"))
	            	{
	           		
	           			out.println("Status : "+rs1.getString("poststatus"));
	           			
	           			
	            	}else if(category.equalsIgnoreCase("image"))
	            	{
	            		%>
	            		<a href=""><img src="uploadfiles/<%=rs1.getString("filename")%>" width="150" height="150" onClick='window.open(src="uploadfiles/<%=rs1.getString("filename")%>")' title="Click to Open"> </a>
	     	<%String s1=rs1.getString("filename"); %>
	            		
	            		<% System.out.println(s1);
	            		out.println(s1);
	            		%>

	            		<%
	            		
	            	}else if(category.equalsIgnoreCase("document"))
	            	{
	            		%>
	            		<a href=""><img src="images/TextFile.png" width="50" height="50" onClick='window.open(src="uploadfiles/<%= rs1.getString("filename") %>")' title="Click to Open"> </a>
	            	<%String s1=rs1.getString("filename"); %>
	            		
	            		<% System.out.println(s1);
	            		out.println(s1);
	            		%>
<%
	            		
	            	}else if(category.equalsIgnoreCase("video"))
	            	{
	            		%>
		            		<video width="400" controls>
		  					<source src="uploadfiles\<%=rs1.getString("filename") %>" type="<%=rs1.getString("type")%>"></source>  
	<%String s1=rs1.getString("filename"); %>
	            		
	            		<% System.out.println(s1);
	            		out.println(s1);
	            		%>
							</video> 
							<%
	            	}else{
	            		
	            	}
	           		%>

</div>
					
				<% 	
				}
				
				%>    
		
		
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
