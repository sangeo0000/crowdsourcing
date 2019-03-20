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
<script type="text/javascript">
     function initGeolocation()
     {
    	
        if( navigator.geolocation )
        {
           // Call getCurrentPosition with success and failure callbacks
           navigator.geolocation.getCurrentPosition( success, fail );
           alert(position.coords.longitude);
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
<body onLoad="initGeolocation()">
<!-- <body> -->
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
<%-- <%@include file="FollowSearchForm.jsp" %> --%>
	<div class="container">
		

  <form action="uploadServlet" method="post" enctype="multipart/form-data">
          <h3>Post :- (Text,Documents)</h3>
          <table cellpadding="5" cellspacing="5" style="width:100%">
          <tr>
          	<td><textarea style="width:100%; height:100px" name="postContent" id="alltext"></textarea>
          	<input type="hidden" name="postPrivacy" value="0">
          	</td>
          </tr>
          <tr>
          	<td>
				 Select file:  <input type="file" name="file" id="file" >
         Select Category: <select name="category" id="category">
         <option value="">---Select---</option>
         
         <option value="document">Document</option>
         
         </select>
			</td>
          </tr>
          <tr>
          <td>Occur Date: <input type="date" name="date" required/></td>
          </tr>
          <tr>
          <td><span style="color: red;">*</span>
           Add #Tag: <input type="text" name="searchtag" id="tag" style="width: 50%; height: 50px" title="Please Enter Status/Image/Video Related Information" required></td>
          </tr>
          <tr >
          <td><input type="text" name="lat" id="lat" readonly="readonly">
		<input type="text" name="lon" id="lon" readonly="readonly"></td>
          </tr>
          <tr>
          	<td><input type="submit" value="Post"></td>
          </tr>
         </table>
           </form>
           
           
           
           <h2>Timeline</h2>
           <%
           /* String studyingfield=  GF.getstydyingField(userid); */
           Connection con=DbConnection.getConnection();
           DateDifferentExample DT = new DateDifferentExample();
           Statement st = con.createStatement();
           String sql = "select * from status where privacy='0' ORDER BY id DESC";
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
        	   int postID = rs.getInt("id");
           String FullName = GF.getFullName(rs.getInt("userid"));
           /* String UsstyF=  GF.getstydyingField(rs.getInt("userid")); */
           String ProfilePic = GF.getProfilePhotoName(rs.getInt("userid"));
           String category = rs.getString("category");
           
           boolean isFollow = GF.isFollow(userids, rs.getInt("userid"));
          /*  boolean isStydiedField = GF.VerifyStudyingfield(userid, rs.getInt("userid")); */
           if(isFollow==false){
        	   int PostLikeCount = GF.getPostLikeCount(postID);
        	   
        	   String dbDate = rs.getString("postDate");
        	   String postedDate = DT.getDateDifference(dbDate);
           %>
           <div style="width:100%;">
	           <div style="width:70%; float:left; height:auto; border:1px solid #F7F5F5;  margin-bottom: 20px">
	           <div  class="postHead" style="width:100%;float:left; height: 80px;">
		           <div  style="width:10%;  float:left; padding:10px">
		           		<img  style="margin-bottom:0px" src="profilepicture/<%= ProfilePic %>" width="50" height="50">
		           	</div>
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;">
		           		<%= FullName %> <br>
		           		<%-- <span style="font-size: 12px"><%= UsstyF %></span><br> --%>
		           		<span style="font-size: 8px"><%= postedDate %></span>
		           	</div>
	           	</div>
	           	
	           	<div  class="postContent" style="width:100%; float:left; height: auto;">
		           <div  style="width:10%;  float:left; padding:10px">
		           		&nbsp;
		           	</div>
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;">
		           		<div style="width:100%; margin-bottom: 10px;">
		           		
		           		<%
		           		
		           		String postC = rs.getString("postContent");
		           		if(postC==null){
		           			out.println(" ");
		           		}else{
		           			%>
		           			<%= postC %>
		           			
		           			<%
		           		}
		           		
		           		%>
		           		</div>
		           		<%
		           		
		           		if(category.equalsIgnoreCase("status"))
		            	{
		           			out.println("Status : "+rs.getString("poststatus"));
		           			
		            	}else if(category.equalsIgnoreCase("image"))
		            	{
		            		%>
		            		<img src="uploadfiles/<%=rs.getString("filename")%>" width="150" height="150" onClick='window.open(src="uploadfiles/<%=rs.getString("filename")%>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("document"))
		            	{
		            		%>
		            		<a href=""><img src="images/TextFile.png" width="50" height="50" onClick='window.open(src="uploadfiles/<%= rs.getString("filename") %>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("video"))
		            	{
		            		%>
		            		<video width="400" controls>
		  					<source src="uploadfiles\<%=rs.getString("filename") %>" type="<%=rs.getString("type")%>"></source>  
							</video> 
							<%
		            	}else{
		            		
		            	}
		           		%>
		           	</div>
	           	</div>
	           	
	           	
	           	
	           	
	           	
	           	
	           </div>
	           
           </div>
           <%
           }
           }
           %>
           
         
       
          
           
		
		
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>
