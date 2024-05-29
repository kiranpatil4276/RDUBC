
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class UploadData
 */
public class UploadData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       
		File file1;
		File file2;
		File file3;
		String fileName1=null;
		String fileName2=null;
		String fileName3=null;
		String name=null;
		String gender=null;
		String dob=null;
		String age=null;
		int mob=0;
		String dist=null;
		String state=null;
		int zip=0;
		String tal=null;
		int member=0;
		int password=0;
		String adhar=null;
		int income=0;
		String addr=null;
		String cast=null;
		String name1=null;
		int age1=0;
		String gender1=null;
		String relation=null;
	    String dob1=null;
	    String vill=null;
	    String country=null;
		int maxFileSize=5000*1024;
		int maxMemSize=5000*1504;
		int j=0;
		try{
			 
		//PrintWriter out=response.getWriter();	
		
		ServletContext context=getServletContext();
		String filePath=context.getInitParameter("file-upload");
		String con=request.getContentType();
		if((con.indexOf("multipart/form-data")>=0))
		{
		
			DiskFileItemFactory disk= new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(disk);
			List fileitems=upload.parseRequest(request);
			Iterator itr=fileitems.iterator();
			while(itr.hasNext())
			{
				
				FileItem fi=(FileItem)itr.next();
				if(!fi.isFormField())
				{
				
					String fieldName=fi.getFieldName();
					if(fieldName.equals("file1"))
					{
						fileName1 = fi.getName();
	                      if( fileName1.lastIndexOf("\\") >= 0 )
	                        {
	                           file1 = new File( filePath + 
	                           fileName1.substring( fileName1.lastIndexOf("\\"))) ;
	                        }
	                      else
	                       {
	                         file1 = new File( filePath + 
	                         fileName1.substring(fileName1.lastIndexOf("\\")+1)) ;
	                       }
	                      fi.write( file1 ) ;
						
					}
					else if(fieldName.equals("file2"))
					{
						fileName2 = fi.getName();
					
	                      if( fileName2.lastIndexOf("\\") >= 0 )
	                        {
	                           file2 = new File( filePath + 
	                           fileName2.substring( fileName2.lastIndexOf("\\"))) ;
	                        }
	                      else
	                       {
	                         file2 = new File( filePath + 
	                         fileName2.substring(fileName2.lastIndexOf("\\")+1)) ;
	                       }
	                      fi.write( file2 ) ;
						
					}
					else if(fieldName.equals("file3"))
					{
						
						fileName3 = fi.getName();
	                      if( fileName3.lastIndexOf("\\") >= 0 )
	                        {
	                           file3 = new File( filePath + 
	                           fileName3.substring( fileName3.lastIndexOf("\\"))) ;
	                        }
	                      else
	                       {
	                         file3 = new File( filePath + 
	                         fileName3.substring(fileName3.lastIndexOf("\\")+1)) ;
	                        }
	                      fi.write( file3 ) ;
						
					}
				}
				else{

	            	String fieldName=fi.getFieldName();
	            	InputStream fin=fi.getInputStream();
	            	byte[] b=new byte[fin.available()];
	            	fin.read(b);
	            	String value=new String(b);
	            	if(fieldName.equals("name"))
	            	{
	            		
	            		name=value;
	            	}
	            	else if(fieldName.equals("password"))
	            	{
	            		
	            		password=Integer.parseInt(value);
	            	}
	            	else if(fieldName.equals("Gender"))
	            	{
	            		
	            		gender=value;
	            	}
	            	else if(fieldName.equals("mob"))
	            	{
	            		
	            		mob=Integer.parseInt(value);
	            	}
	            	else if(fieldName.equals("state"))
	            	{
	            		
	            		state=value;
	            	}
	            	else if(fieldName.equals("zip"))
	            	{
	            		
	            		zip=Integer.parseInt(value);
	            	}
	            	else if(fieldName.equals("district"))
	            	{
	            		
	            		dist=value;
	            	}
	            	else if(fieldName.equals("Taluka"))
	            	{
	            		
	            		tal=value;
	            	}
	            	else if(fieldName.equals("income"))
	            	{
	            		
	            		income=Integer.parseInt(value);
	            	}
	            	
	            	else if(fieldName.equals("dob"))
	            	{
	            		
	            		dob=value;
	            	}
	            	else if(fieldName.equals("age"))
	            	{
	            		
	            	     age=value;
	            	}
	            	else if(fieldName.equals("addr"))
	            	{
	            		
	            		addr=value;
	            	}
	            	else if(fieldName.equals("adhar"))
	            	{
	            		
	            		adhar=value;
	            	}
	            	else if(fieldName.equals("Cast"))
	            	{
	            		
	            		cast=value;
	            	}
	            	else if(fieldName.equals("member"))
	            	{
	            
	            		member=Integer.parseInt(value);
	            	}
	            	else if(fieldName.equals("name1"))
	            	{
	            		
	            		name1=value;
	            	}
	            	else if(fieldName.equals("age1"))
	            	{
	            		
	            		age1=Integer.parseInt(value);
	            	}
	            	else if(fieldName.equals("dob1"))
	            	{
	            		
	            		dob1=value;
	            	}
	            	else if(fieldName.equals("gender1"))
	            	{
	            		
	            		gender1=value;
	            	}
	            	else if(fieldName.equals("Village"))
	            	{
	            	
	            		vill=value;
	            	}
				
            	else if(fieldName.equals("country"))
            	{
            		
            		country=value;
            	}
            	else if(fieldName.equals("relation"))
            	{
            	
            		relation=value;
            	}
				}
			}
		}	
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
	    PreparedStatement stm=conn.prepareStatement("insert into register(adhar_image,addr_image,addr_images,name,password,gender,mob,cast,zip,state,dist,tal,dob,income,adhar,member,name1,gender1,age1,dob1,relation,age,addr,country,village)values('"+fileName1+"','"+fileName2+"','"+fileName3+"','"+name+"','"+password+"','"+gender+"','"+mob+"','"+cast+"','"+zip+"','"+state+"','"+dist+"','"+tal+"','"+dob+"','"+income+"','"+adhar+"','"+member+"','"+name1+"','"+gender1+"','"+age1+"','"+dob1+"','"+relation+"','"+age+"','"+addr+"','"+country+"','"+vill+"')" );
	    j=stm.executeUpdate();
	    if(j>0)
	    {
	    	response.sendRedirect("Login.jsp");
	    }
	    else
	    {
	    	
	    }
	}
	catch(Exception e1)
	{
		
	}
}	
}
