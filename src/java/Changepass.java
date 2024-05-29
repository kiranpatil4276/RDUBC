

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;

/**
 * Servlet implementation class Changepass
 */

public class Changepass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changepass() {
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
		  
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		System.out.println("Hiiii");
		//session.setAttribute("pass", rs.getString(11));
		
			ResultSet rsdoLogin = null;
			   PreparedStatement psdoLogin=null;
			    HttpSession session=request.getSession();
			  // String lg=request.getParameter("hotel_id");
			  String current=request.getParameter("c_pass");
			  System.out.println("hi"+current);
			  String newpass=request.getParameter("change_pass");
			  System.out.println(newpass);
			  String confirm=request.getParameter("comfirm_pass");
			  System.out.println(confirm);
			 // String pasword=(String)session.getAttribute(“uid”);  
			  String oldpass=session.getAttribute("pass").toString(); 
			  System.out.println("hi"+oldpass);
			 // ResultSet rs=stmt.executeQuery("select * from register where id='"+id1+"'");
			 // Message msg=new Message();
			  try {
					Class.forName("com.mysql.jdbc.Driver");
				
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
			Statement st=conn.createStatement();
			//ResultSet rs = st.executeQuery("select * from register where password='"+ oldpass+ "'");
		 
		//	{
			if(current.equals(oldpass))
			{
			if(newpass.equals(confirm))
				{
				
			 
				int i = st.executeUpdate("update register set password='"+ newpass + "' where  password='"+oldpass+"'");
				out.println("<script>");
			    out.println("alert('Password changed successfully..!!!');");
			    RequestDispatcher rd = request.getRequestDispatcher("customer_home.jsp");
				rd.include(request, response);
			    
			    /*out.println("location='Principle_Profile.jsp';");*/
			    out.println("</script>");
				}
			    else  
			    {
			    	out.println("<script>");
				    out.println("alert('old passsword doesnt match.!!!');");
				    /*out.println("location='StudentChange_Password.jsp';");*/
				    out.println("</script>");
			    
				    
				}
			}
			else
			{
				out.println("<script>");
			    out.println("alert('Password doesnt match..!!!');");
			    
			    /*out.println("location='Principle_Profile.jsp';");*/
			    out.println("</script>");
			    st.close();
			    conn.close();
			}
			     
				 
		 
	
	
	
			  }
			
			
			  
			 
						 
				 
						catch (Exception e) 
						{
							out.println(e);
						}
						 
		  	 
	

	}
}

