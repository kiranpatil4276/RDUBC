

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javax.servlet.http.Part;

import constants.constant;
import jdbc.Database;

/**
 * Servlet implementation class AddAboutUs
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, maxFileSize=1024*1024*10, maxRequestSize=1024*1024*50)

public class AddAboutUs extends HttpServlet implements constant{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAboutUs() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String heading=request.getParameter("heading");
		String desc=request.getParameter("desc");
		
		try{
			Date datee=new Date();
		       SimpleDateFormat dNow = new SimpleDateFormat("dd-MM-yyyy-hh-mm-ss");
		       String pathdate=dNow.format(datee);
		       
		       
		       
		       
		       /*ServletConfig config=getServletConfig();
				String savepath=config.getServletContext().getRealPath("/")+"image";
				String hardPath = projectPath + File.separator + "Backup";
				
				 File fileSaveDir=new File(savepath);
			       if(!fileSaveDir.exists()){
			           fileSaveDir.mkdir();
			       }
			     
			       File fileSaveDir1=new File(hardPath);
			       if(!fileSaveDir1.exists()){
			           fileSaveDir1.mkdir();
			       }*/
			     
			       
			       Part part=request.getPart("file");
			       //String fileName=extractFileName(part);
			      /* part.write(savepath + File.separator + pathdate);
			       part.write(hardPath + File.separator + pathdate);*/
			      
			  
			       InputStream fis=(InputStream) part.getInputStream();
			       
			        String filePath= "image/"+pathdate;
			       
			        Connection conn = Database.getConnection();
					PreparedStatement ps = conn.prepareStatement("insert into aboutus(about_id,heading,description,image) values(?,?,?,?)");
					ps.setString(1, null);
					ps.setString(2, heading);
					ps.setString(3, desc);
					ps.setBlob(4, fis);
				
					
					int result = ps.executeUpdate();
					
					if(result==1){
						RequestDispatcher rd = request.getRequestDispatcher("about_us.jsp");
						rd.include(request, response);
						out.println("<script>");
						out.println("alert('content aded successfull');");
						out.println("</script>");
						
					}
					else
					{
						RequestDispatcher rd = request.getRequestDispatcher("about_us.jsp");
						rd.include(request, response);
						out.println("<script>");
						out.println("alert('content not aded');");
						out.println("</script>");
					}
				}catch(Exception ex){
					
					System.out.println(ex);
				}
	}

}
