package constants;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.http.Part;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class UploadData
 */
public class upload_image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_image() {
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

		String projectPath="D:\\";
		String name=request.getParameter("name");
		String mob=request.getParameter("mob");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		String AdharCardno=request.getParameter("adhar");
		String income=request.getParameter("income");
		String dob=request.getParameter("dob");
		String age=request.getParameter("age");

		String address=request.getParameter("address");

		String tal=request.getParameter("tal");
		String dist=request.getParameter("dist");
		String state=request.getParameter("state");
		String gender=request.getParameter("gender");
		String cast=request.getParameter("cast");
		String pincode=request.getParameter("zip1");

		String familymem=request.getParameter("member");
		String name1=request.getParameter("name1");
		String dob1=request.getParameter("dob1");
		String age1=request.getParameter("age1");
		String gender1=request.getParameter("gender1");
		String relation=request.getParameter("relation");
		SimpleDateFormat now = new SimpleDateFormat("dd-mm-yyyy-hh-mm-ss");
		Date d1 = new Date();
		
		String doc1 = now.format(d1)+new Random().nextInt(50);
		String doc2 = now.format(d1)+new Random(100).nextInt(150);
		String doc3 = now.format(d1)+new Random(100).nextInt(250);
		
		ServletConfig config = getServletConfig();
		String savePath = config.getServletContext().getRealPath("/")+"Document";
		
		File dir = new File(savePath);
		if(!dir.exists()){
			dir.mkdir();
		}
		System.out.println("data get 1");
		Collection<Part> allPart = request.getParts();
		Iterator<Part> part = allPart.iterator();
		
		for(int i=0;i<11;i++){
			part.next();
		}
		
		Part document1 = part.next();
		document1.write(savePath + File.separator + doc1);
		document1.write(projectPath+ File.separator + doc1);
		String path1 = "Document/"+doc1;
		
		Part document2 = part.next();
		document2.write(savePath + File.separator + doc2);
		document2.write(projectPath+ File.separator + doc2);
		String path2 = "Document/"+doc2;
		
		Part document3 = part.next();
		document3.write(savePath + File.separator + doc3);
		document3.write(projectPath+ File.separator + doc3);
		String path3 = "Document/"+doc3;
		
		
			 
		//PrintWriter out=response.getWriter();	
		
		/*ServletContext context=getServletContext();
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
	            	else if(fieldName.equals("gender"))
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
	            	else if(fieldName.equals("zip1"))
	            	{
	            		
	            		zip=Integer.parseInt(value);
	            	}
	            	else if(fieldName.equals("dist"))
	            	{
	            		
	            		dist=value;
	            	}
	            	else if(fieldName.equals("tal"))
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
	            	else if(fieldName.equals("address"))
	            	{
	            		
	            		addr=value;
	            	}
	            	else if(fieldName.equals("adhar"))
	            	{
	            		
	            		adhar=value;
	            	}
	            	else if(fieldName.equals("cast"))
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
*/	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
	    PreparedStatement ps=conn.prepareStatement("insert into register values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	    		
	    ps.setString(1, null);
	    ps.setString(2,name);
	    ps.setString(3,mob);
	    ps.setString(4,password);
	    ps.setString(5,AdharCardno);
	    ps.setString(6,income);
	    ps.setString(7,dob);
	    ps.setString(8,age);
	    ps.setString(9,address);
	    ps.setString(10,tal);
	    ps.setString(11,dist);
	    ps.setString(12, state);
	    ps.setString(13,gender);
	    ps.setString(14,cast);
	    ps.setString(15,pincode);
	    ps.setString(16,familymem);
	    ps.setString(17,name1);
	    ps.setString(18,dob1);
	    ps.setString(19,age1);
	    ps.setString(20,gender1);
	    ps.setString(21,relation);
	    ps.setString(22,path1);
	    ps.setString(23,path2);
	    ps.setString(24,path3);
	    
	    int i=ps.executeUpdate();
	    
	    
}
	catch(Exception e1)
	{
		System.out.println(e1);
	}
}	
}
