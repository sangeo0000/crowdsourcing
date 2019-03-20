package com.unknown;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

/**
 * Servlet implementation class analysis
 */
@WebServlet("/analysis")
public class analysis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public analysis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String place = request.getParameter("place");
		//System.out.println(start);
		//System.out.println(end);
		
		try{
			Connection con = DbConnection.getConnection();
		String floodcount = count("flood",place, con);
		String fire = count("fire",place, con);
		String earthquake = count("earthquake",place, con);
		//System.out.println(fire);
		String dfloodcount = dateBetweencount("flood",start,end, con,place);
		String dfire = dateBetweencount("fire",start,end, con,place);
		String dearthquake = dateBetweencount("earthquake",start,end, con,place);
		//System.out.println(fire);
		float floodpercent = (float)(Float.parseFloat(dfloodcount)/Float.parseFloat(floodcount))*100;
		float firepercent = (float)(Float.parseFloat(dfire)/Float.parseFloat(fire))*100;
		float earthquakepercent =(float) (Float.parseFloat(dearthquake)/Float.parseFloat(earthquake))*100;
		
		/*System.out.println(floodpercent);
		System.out.println(firepercent);
		System.out.println(earthquakepercent);*/
		
		if(Float.isNaN(floodpercent))
		{
			floodpercent = 0;
		}
		if(Float.isNaN(firepercent))
		{
			firepercent = 0;
		}
		if(Float.isNaN(earthquakepercent))
		{
			earthquakepercent = 0;
		}
		
		response.sendRedirect("graph.jsp?flood="+floodpercent+"&fire="+firepercent+"&earthquake="+earthquakepercent);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String count(String str,String place,Connection con)throws Exception
	{
		float count1 = 0;
		PreparedStatement ps = con.prepareStatement("select count(id) as cnt from sentiment where place=? and senti=?");
		ps.setString(1, place);
		ps.setString(2, str);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			count1 = rs.getFloat("cnt");
			//System.out.println("=== "+count1);
		}
		return Float.toString(count1);
			
	}

	public String dateBetweencount(String str,String start,String end,Connection con,String place)throws Exception
	{
		float count1 = 0;
		PreparedStatement ps = con.prepareStatement("SELECT count(id) as cnt FROM sentiment WHERE place=? and senti=? and date1 BETWEEN CAST('"+start+"' AS DATE) AND CAST('"+end+"' AS DATE)");
		ps.setString(1, place);
		ps.setString(2, str);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			count1 = rs.getFloat("cnt");
			//System.out.println("---------- "+count1);
		}
		return Float.toString(count1);
			
	}
}
