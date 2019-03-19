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
<style type="">
table th {
	 color: black;
}
</style>
</head>
<body>
<%

if(request.getParameter("done")!=null){
	   out.println("<script>alert('Successfully change...'); </script>");
	   out.println("<script>window.close() </script>");
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
<%-- 				        <%@include file="menu.jsp" %> --%>
				
			</ul>
		</div>
	</div>
</div>

<div id="footer">
<%-- <%@include file="FollowSearchForm.jsp" %> --%>
	<div class="container">
		

<h2>Change Profile Picture</h2><br /><br />
         
       
         
<form action="profilepicture" method="post" enctype="multipart/form-data">
<input type="file" name="file" id="file"></input>
<input type="submit" value="Submit"></input>
</form>


		
		
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
