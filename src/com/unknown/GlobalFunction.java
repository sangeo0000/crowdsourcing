/*******************************************************************************
 * Copyright (c) 2016  Swapnil Kumawat.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms.
 * Contributors:
 *     Webminds Technology
 *******************************************************************************/
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.unknown;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

//import org.apache.commons.codec.binary.Hex;




import com.util.DbConnection;

/**
 *
 * @author Swapnil
 */
public class GlobalFunction {
    
    Connection con = DbConnection.getConnection();
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();            
    String Addeddate=dateFormat.format(date);
    
    Statement st = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    private boolean flag;
    
    public String getRole(int id) throws SQLException{
    
        String data = "";
        
        st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from role where id="+id);
        while(rs.next()){
            
            data = rs.getString("roleName");
        
        }
        return data;
    
    }
    
    public static void copyFile(File sourceFile, File destFile) throws IOException {
    	if (!sourceFile.exists()) {
    		return;
    	}
    	if (!destFile.exists()) {
    		destFile.createNewFile();
    	}
    	FileChannel source = null;
    	FileChannel destination = null;
    	source = new FileInputStream(sourceFile).getChannel();
    	destination = new FileOutputStream(destFile).getChannel();
    	if (destination != null && source != null) {
    		destination.transferFrom(source, 0, source.size());
    	}
    	if (source != null) {
    		source.close();
    	}
    	if (destination != null) {
    		destination.close();
    	}
    }
    
    
   public String getFullName(int userid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
       if(rs.next()){
       data = rs.getString("fname")+" "+rs.getString("lname");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
 
   
  public int getLatestFileID() throws SQLException{
   
       int data=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select id from userfile ORDER BY id DESC LIMIT 1");
       if(rs.next()){
       data = rs.getInt("id");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
  

  
  public String getLatestUserID() throws SQLException{
	   
      String data="";
      try{
      st = con.createStatement();
      ResultSet rs = st.executeQuery("select id from user ORDER BY id DESC LIMIT 1");
      if(rs.next()){
      data = rs.getString("id");
      }
  }catch (SQLException e) {
           System.out.println("Error:" + e);
       } finally {
           if (st != null) {
               st.close();
           }
           if (rs != null) {
               rs.close();
           }
       }
       return data;
      
  }
  public static void CreateDirectory(String FolderName)
  {	
	File file = new File("C:\\upload\\"+FolderName);
	if (!file.exists()) {
		if (file.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
  }
   
      public String getUserEmail(int Userid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select email from user where id='"+Userid+"'");
       if(rs.next()){
       data = rs.getString("email");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
   
   public String getRoleName(int RoleID) throws SQLException{
   System.out.println("---------RoleID------"+RoleID);
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select roleName from role where id="+RoleID);
       if(rs.next()){
       data = rs.getString("roleName");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
      
   public String getUserRole(int Userid) throws SQLException{
   
       String data="";
       int UserRoleID=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select UserRole from user where id="+Userid);
       if(rs.next()){
       UserRoleID = rs.getInt("UserRole");
       
       
       data = getRoleName(UserRoleID);
       }
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
   
    public int getUserRoleID(int Userid) throws SQLException{
   
       int data=0;
       int UserRoleID=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select UserRole from user where id="+Userid);
       if(rs.next()){
       data = rs.getInt("UserRole");
       
       
       //data = getRoleName(UserRoleID);
       }
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
      
  
   public String getFileName(int Fileid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select fileName from userfile where id="+Fileid);
       if(rs.next()){
       data = rs.getString("fileName");
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;
       
   }
      
   public String getFileExtention(File file){
   
       String name = file.getName();
       try{
       return name.substring(name.lastIndexOf(".") + 1);
       } catch(Exception e){
       return "";
       }
       
       
   }
   
   public boolean checkAdminLogin(String username,String password) throws SQLException{
   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from admin where name='"+username+"' and password='"+password+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public int checkAuthorised(int fileID,int UserRol) throws SQLException{
       int data=0;
       try{
       st = con.createStatement();
       String strss1 = Integer.valueOf(UserRol).toString();
       ResultSet rs = st.executeQuery("select * from userfile where id="+fileID);
       if(rs.next()){
           String[] Authorised = rs.getString("Authorised").split(",");
          for(int i=0;i<Authorised.length;i++){
            
              
              String strss = Authorised[i];
              if(strss.equalsIgnoreCase(strss1)){
              
                  data = Integer.parseInt(strss);
                  
               return data;
              }
              
             
              //if(data==UserRol){                  
                  
              
             // } 
              
          }         
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }


   public boolean VerifySecretCode(int id,String SecretCode) throws SQLException{
   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from user where id="+id+" and SecretKey='"+SecretCode+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public boolean VerifyFileSecretCode(int Fileid,String SecretCode) throws SQLException{
   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from userfile where id="+Fileid+" and SecretKey='"+SecretCode+"'");
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   
   public void setEncryptionTime(int fid,float ExcutionTime) throws SQLException{
   
       try{
       st = con.createStatement();
       String sqlss = "INSERT INTO encryption(fileId,ExcutionTime) VALUE("+fid+","+ExcutionTime+")";
       System.out.println("enr========="+sqlss);
       st.executeUpdate(sqlss);
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        }
        
   }
   
   public void setDecryptionTime(int fid,float ExcutionTime) throws SQLException{
   
       try{
       st = con.createStatement();
       String sqlss = "INSERT INTO decryption(fileId,ExcutionTime) VALUE("+fid+","+ExcutionTime+")";
       System.out.println("enr========="+sqlss);
       st.executeUpdate(sqlss);
       
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        }
        
   }
   
   
   public String getSecretCode(int id) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select SecretKey from user where id="+id);
       if(rs.next()){
           data = rs.getString("SecretKey");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   
   public int getFromUser(int Requestid) throws SQLException{
   
       int data=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select fromUser from filerequest where id="+Requestid);
       if(rs.next()){
           data = rs.getInt("fromUser");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   public int getRequestStatus(int Requestid) throws SQLException{
   
       int data=0;
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select status from filerequest where id="+Requestid);
       if(rs.next()){
           data = rs.getInt("status");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   public String getRequestDate(int Requestid) throws SQLException{
   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select req_date from filerequest where id="+Requestid);
       if(rs.next()){
           data = rs.getString("req_date");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   }
   
   public boolean checkClientWeatherID(String WatherID,int clientProvider) throws SQLException{
	   
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from client_weather_record where WeatherID='"+WatherID+"' and client_provider="+clientProvider);
       if(rs.next()){
       return true;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return false;       
   }
   
   public String getTrustedClientAthentication(int pro_id) throws SQLException{
	   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from clienttrustcertificate where id="+pro_id);
       if(rs.next()){
           data = rs.getString("trust");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   } 
   
public String getTrustedServerAthentication(int pro_id) throws SQLException{
	   
       String data="";
       try{
       st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from trustcertificate where id="+pro_id);
       if(rs.next()){
           data = rs.getString("trust");
       return data;
       }
   }catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return data;       
   } 





   
public void updatenotification(int notiFrom,int notiTo,String Subject,String Status) throws SQLException{
	   
    try{
    st = con.createStatement();
    String sqlss = "INSERT INTO notification(notiFrom,notiTo,Subject,Status,notiDate) VALUE("+notiFrom+","+notiTo+",'"+Subject+"','"+Status+"','"+Addeddate+"')";
    //System.out.println("enr========="+sqlss);
    st.executeUpdate(sqlss);
    
}catch (SQLException e) {
         System.out.println("Error:" + e);
     }
     
}

public int getNotificationCount(int userid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select count(id) from notification where notiTo="+userid+" and Status='Active'");
    if(rs.next()){
        data = rs.getInt("count(id)");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 

public void updateNotificationStatus(int notiTo) throws SQLException{
	   
    try{
    st = con.createStatement();
    String sqlss = "update  notification set Status='Deactive' where notiTo="+notiTo;
    
    st.executeUpdate(sqlss);
    
}catch (SQLException e) {
         System.out.println("Error:" + e);
     }
     
}

public String getUserFirstname(int userid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
    if(rs.next()){
        data = rs.getString("fname");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 


public boolean VerifyStudyingfield(int loggedInID,int Userid) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+loggedInID+" and studyingfields=(select studyingfields from user_info where id="+Userid+")");
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}
public int getPostLikeCount(int postid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from postliketbl where post_id="+postid+"");
    if(rs.next()){
        data = rs.getInt("plike");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 
public boolean checkStatusExists(int userid) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from status where userid="+userid);
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}

public String getStatusField(int userid,String category) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from status where userid="+userid+" and category='"+category+"'");
    if(rs.next()){
        data = rs.getString("poststatus");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}

public String getstydyingField(int userid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
    if(rs.next()){
        data = rs.getString("studyingfields");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}

public String getProfilePhotoName(int userid) throws SQLException{
	   
    String data="";
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from user_info where id="+userid);
    if(rs.next()){
        data = rs.getString("ppicture");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
}


public boolean isFollow(int LoggedID,int FollowId) throws SQLException{
	   
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from follow_list where follower_id="+LoggedID+" and follow_of="+FollowId);
    if(rs.next()){
    return true;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return false;       
}






public int getPostOwnerId(int postid) throws SQLException{
	   
    int data=0;
    try{
    st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from status where id="+postid+"");
    if(rs.next()){
        data = rs.getInt("userid");
    return data;
    }
}catch (SQLException e) {
         System.out.println("Error:" + e);
     } finally {
         if (st != null) {
             st.close();
         }
         if (rs != null) {
             rs.close();
         }
     }
     return data;       
} 

















}