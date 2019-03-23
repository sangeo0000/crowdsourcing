 <%@page import="com.unknown.GlobalFunction"%>
<%
 int userids = Integer.parseInt((String)session.getAttribute("userid"));
 GlobalFunction GF = new GlobalFunction();
 
 int nofiCount = GF.getNotificationCount(userids);
 
 %>
 <ul>
          <li><a href="home.jsp">Home</a></li>
         
          <li><a href="RequestList.jsp">Follower List</a></li>
         
         <li><a href="Notification.jsp">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li>
        <!-- <li><a href="user.jsp">Mining User</a></li> -->
           <li><a href="Account.jsp">Profile</a>
   			
     			 <li><a href="Logout">Logout</a></li>
    		
          </li>
        </ul>