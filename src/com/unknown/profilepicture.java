package com.unknown;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import java.io.*;

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

@WebServlet("/profilepicture")
public class profilepicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con=null;
    
    public profilepicture() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	private static final int THRESHOLD_SIZE = 1024*1024*3; // 3MB
	private static final int MAX_FILE_SIZE = 1024*1024*40; // 40MB
	private static final int REQUEST_SIZE = 1024*1024*50; // 50MB
	private List<FileItem> fileItem = null;
	  
	 protected List<FileItem> initRequest(HttpServletRequest req) 
	 {
		 boolean isMultipart = ServletFileUpload.isMultipartContent(req);
	     if(!isMultipart) throw new UnsupportedOperationException();
	     DiskFileItemFactory factory = new DiskFileItemFactory();
	     factory.setSizeThreshold(THRESHOLD_SIZE);
	     factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	     ServletFileUpload upload = new ServletFileUpload(factory);
	     upload.setFileSizeMax(MAX_FILE_SIZE);
	     upload.setSizeMax(REQUEST_SIZE);
	     List<FileItem> formItems = null;
	     try 
	     	{
	    	 formItems = upload.parseRequest(req);
	     	} 
	     catch (Exception e) 
	     	{
	    	 e.printStackTrace();
	     	}
	 return formItems;
	}
		
		public void init()
		{
			
			try
			{
				
				con = DbConnection.getConnection();
			}
			catch(Exception e1)
			{
				e1.printStackTrace();
			}
		}
		
		   protected String getFieldValue(List<FileItem> formItems, String fieldName) 
		   {
		    String value = null;
		    try {
		     for(FileItem fi : formItems )
		     {
		      if (fi.isFormField()) 
		      {
		       if(fi.getFieldName().equals(fieldName))
		       {
		        value = fi.getString();
		       }
		      }
		     }
		    }
		    catch (Exception ex) {
		     ex.printStackTrace();
		    }
		    return value;
		   }
		   protected File uploadFile(List<FileItem> formItems, String destFolder) 
			 {
			  String uploadPath = destFolder;
			  File uploadDir = new File(uploadPath);
			  if (!uploadDir.exists()) 
			  {
			   uploadDir.mkdir();
			  }
			  File uploadedFile = null;
			  try 
			  {
			   for(FileItem fi : formItems )
			   {
			    if (!fi.isFormField()) 
			    {
			     String fileName = new File(fi.getName()).getName();
			     String filePath = uploadPath + File.separator + fileName;
			     uploadedFile = new File(filePath);
			     fi.write(uploadedFile);
			    }
			   }
			  }
			  catch (Exception ex) 
			  {
			   ex.printStackTrace();
			  }
			  return uploadedFile;
			 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			fileItem = initRequest(request);	
			
			
			
			File file = uploadFile(fileItem,"D:\\workspace\\CrowdSourcing\\WebContent\\profilepicture");
			//File file1 = uploadFile(fileItem,"D:\\workspace\\facebookV461New\\WebContent\\profilepicture");
			
			HttpSession session=request.getSession();
			int id=Integer.parseInt((String)session.getAttribute("userid"));
		
			PreparedStatement ps=con.prepareStatement("update user_info set ppicture=? where id=?");
			ps.setString(1, file.getName());
			ps.setInt(2, id);
			ps.executeUpdate();
			
			session.setAttribute("ppicture", file.getName());
			
			
			
			response.sendRedirect("Account.jsp");
			
		} catch (Exception e) {
			
		}
		
	}

}
