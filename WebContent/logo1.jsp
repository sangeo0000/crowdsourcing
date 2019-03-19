<%@page import="org.apache.commons.io.Annotation"%>
<%@page import="com.unknown.GlobalFunction"%>
<div>
<a href="profilepic.jsp" target="_blank"><img  src="profilepicture/<%=session.getAttribute("ppicture") %>" width="50" height="50" style="border-radius: 50%;"></a>
<%
//GlobalFunction GF = new GlobalFunction();
int userid=Integer.parseInt((String) session.getAttribute("userid"));
String fname = (String)session.getAttribute("fname");
String lname = (String)session.getAttribute("lname");
//String stat = GF.getStatusField(userid,"status");
new Annotation();
%><br>
<h3 style="margin-top:10px"><%= fname+" "+lname %></h3>
</div>
<%-- <h3 style="margin-top:10px"><%= stat %> <a href="ChangeStatus.jsp">Change</a></h3>
 --%>