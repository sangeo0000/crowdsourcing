package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	 private static Connection con=null;
	
	 public static Connection getConnection() 
		{
			
			
			 try{
		            
			        if(con==null){
			         Class.forName("com.mysql.jdbc.Driver");
			        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdsource","root",""); 
			        return con;
			        }else{
			           return con;  
			        }
			       
			    }   catch(Exception e){
			        e.printStackTrace();
			    }
			        return con;
			
			
		}
	}



