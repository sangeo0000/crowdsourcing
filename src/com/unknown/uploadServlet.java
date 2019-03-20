package com.unknown;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.internet.NewsAddress;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.util.DbConnection;

/**
 * Servlet implementation class uploadServlet
 */
@WebServlet("/uploadServlet")
public class uploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	 private final String UPLOAD_DIRECTORY = "D:\\workspace\\CrowdSorcing1\\WebContent\\uploadfiles";
	 //private final String UPLOAD_DIRECTORY1 = "D:\\data\\dataset\\input.txt"; 
	 public void init()
	    {
	    	{
	    		try
	    		{
	    			con=DbConnection.getConnection();
	    			
	    		}
	    		catch(Exception e)
	    		{
	    			e.printStackTrace();
	    		}
	    	}
	    }	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		
	       //process only if its multipart content
	       if(ServletFileUpload.isMultipartContent(request)){
	           try {
	               List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	               DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	               Date date = new Date();       
	               System.out.println("line1");
	               String Addeddate=dateFormat.format(date);
	               String user_id = (String)session.getAttribute("userid");
	               int userid=Integer.parseInt((String) session.getAttribute("userid"));
	               System.out.println(user_id);
	               Connection con = DbConnection.getConnection(); 
	               
	               
	               String FileName = "";
	               String postContent ="";
	               String name = "";
	               String postPrivacy = "";
	               String lat = "";
	               String lon = "";
	               String date1 = "";
	               
	               String FileExtention = "";
	               long FileSize = 0;
	               
	               String color = "";
	              String category = "";
	              String tag = "";
	              int flag=0; 
	              
	              System.out.println("line1");
	               for(FileItem item : multiparts){
	                   if(!item.isFormField())
	                   {
	                	   
	                	  
	                	   
	                       name = new File(item.getName()).getName();
	                       item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	                       //item.write( new File(UPLOAD_DIRECTORY1 + File.separator));
	                       FileName = item.getName();
	                       FileExtention = item.getContentType();
	                       FileName = item.getName();
	                       FileSize = item.getSize();
	                       
	                      
		                	   
		                	       
	                       
	                   }
	                   else if (item.getFieldName().equals("category")) {
	                	    category  = item.getString();
	                	    
	                	         }
	                   else if(item.getFieldName().equals("postContent")){
	                	   postContent = item.getString();
	                	   
	                	   flag++;
	                   }
	                   else if(item.getFieldName().equals("postPrivacy")){
	                	   postPrivacy = item.getString();
	                	
	                   }
	                   else if(item.getFieldName().equals("searchtag")){
	                	   tag = item.getString();
	                	   
	                	   
	                   }
	                   else if(item.getFieldName().equals("lat")){
	                	   lat = item.getString();
	                	
	                   }
	                   else if(item.getFieldName().equals("lon")){
	                	   lon = item.getString();
	                	   
	                	   
	                   }
	                   else if(item.getFieldName().equals("date")){
	                	   date1 = item.getString();
	                	   
	                	   
	                   }
	                   
	                  
	                  
	               }
	               
	               
	               
	            
	               //String place = AddressFromLatLon.getAddressByGpsCoordinates(lon, lat);
	               
	       		GlobalFunction GF = new GlobalFunction();
	               System.out.println("Connection created");
	               SentimentAnalysis sn = new SentimentAnalysis();
	               String stop = Stopwords.removeStopWords(postContent.trim());
	               String naturaldisaster = sn.naturalDisaster(stop);
	               String place = sn.places(stop);
	            
	   				System.out.println("2");
	   				
	               PreparedStatement st=con.prepareStatement("insert into status(userid,filename,type,filesize,category,postContent,postDate,privacy,searchtag,poststatus,date1,lat,lon) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	               
	             
	           
	               
	                st.setInt(1,userid);
	                
	                st.setString(2, FileName);	               
	                st.setString(3, FileExtention);                 
	                st.setLong(4, FileSize);
	               
					st.setString(5, category);
	                st.setString(6, postContent);
	                st.setString(7, Addeddate);
	                st.setString(8, postPrivacy);
	                st.setString(9, tag);
	                st.setString(10, postContent);
	                st.setString(11, date1);
	                st.setString(12, lat);
	                st.setString(13, lon);
	                /* st.setString(13, place);*/
	            st.executeUpdate();
	            int count = 0;
	            if(!naturaldisaster.equals("") && !place.equals(""))
	            {
	            	count++;
	            PreparedStatement ps = con.prepareStatement("insert into sentiment(senti,place,date1) values(?,?,?)");
	            ps.setString(1, naturaldisaster.trim());
	            ps.setString(2, place.trim());
	            ps.setString(3, date1);
	            ps.executeUpdate();
	            }
	            if(count>0)
	            {
	            	PreparedStatement pp = con.prepareStatement("insert into notification(Subject,Status) values(?,?)");
	            	pp.setString(1, postContent);
	            	pp.setString(2, "Active");
	            	
	            	pp.executeUpdate();
	            }
	                System.out.println("end");
	   			
	            if(postPrivacy.equalsIgnoreCase("0")){
	     	       response.sendRedirect("home.jsp?success");
	            }else{
	            	response.sendRedirect("groupinfo.jsp?id="+postPrivacy+"&success");
	            }
	               		
	               Thread.sleep(5000);
	              //File uploaded successfully
	              request.setAttribute("message", "Image Uploaded Successfully");
	           } catch (Exception ex) {
	              ex.printStackTrace();
	           }          
	        
	       }else{
	           request.setAttribute("message",
	                                "Sorry this Servlet only handles file upload request");
	       }
	   
	}

}
