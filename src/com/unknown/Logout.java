package com.unknown;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	public void init()
	{
		try
		{
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
			PrintWriter out=res.getWriter();
			HttpSession session=req.getSession();
			System.out.println("2nd session id="+session.getId());
			session.invalidate();
			session=null;
			//req.getRequestDispatcher("index.jsp").forward(req, res);
			

			res.sendRedirect("index.jsp");
			return;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void distroy()
	{
		try
		{
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
