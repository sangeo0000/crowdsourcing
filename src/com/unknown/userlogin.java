package com.unknown;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

@WebServlet("/userlogin")
public class userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public userlogin() {
        super();
        
    }
    Connection con=null;
    PreparedStatement ps;
    ResultSet rs;

   //String username;
    String password;
    String fname;
    String lname;
    String email;


    public void init()
    {
    	{
    		try
    		{
    			//con=DbConnection.getConnection();
    			
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}
    	}
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out = res.getWriter();
		 try{  
			 con=DbConnection.getConnection();
			 res.setContentType("text/html");  
	          //username = req.getParameter("username");  
			 	email=req.getParameter("email");
			 	
	          password = req.getParameter("password");
	          
	          System.out.println(email+" "+password);
	          
	          ps =con.prepareStatement("select * from user_info where email=? or username=? and password=?");
	          
	          ps.setString(1,email);
	          ps.setString(2,email);
	          ps.setString(3,password);
	          


	          rs = ps.executeQuery();
	          HttpSession session=req.getSession(true);
	          
	          if(rs.next())
	          {  
	        	  //String username=rs.getString("username");
	        	  String fname=rs.getString("fname");
	        	  String lname=rs.getString("lname");
	        	  String email=rs.getString("email");
	        	  String ppicture=rs.getString("ppicture");
	        	  
	        	 /* String studyingfield=rs.getString("studyingfields");*/
	        	  String userid=rs.getString("id");
	        	  
	        	 
	            session.setAttribute("userid",userid);
	            session.setAttribute("fname",fname);
	            session.setAttribute("lname",lname);
	            session.setAttribute("username",email);
	            session.setAttribute("ppicture",ppicture);
	           /* session.setAttribute("studyingfield", studyingfield);*/
	           
	            
	            
	            res.sendRedirect("home.jsp");
	            
	          }  
	          else{  
	        	 
		            res.sendRedirect("index.jsp");
	           }  
	          ps.close();
	        }  
	        catch (Exception e){  
	          e.printStackTrace();  
	        }  
	}



	}


