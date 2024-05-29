package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.Database;

/**
 * Servlet implementation class enquir_register
 */
/*@WebServlet("/enquir_register")*/
public class enquir_register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public enquir_register() {
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
		
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		
		try
		{
			
			       Connection conn = Database.getConnection();
					PreparedStatement ps = conn.prepareStatement("insert into enquiry values(?,?,?,?,?,?)");
					ps.setString(1, null);
					ps.setString(2, name);
					ps.setString(3, contact);
					ps.setString(4, email);
					ps.setString(5, subject);
					ps.setString(6, message);
					
					
					int result = ps.executeUpdate();
					
					if(result==1){
						RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
						rd.include(request, response);
						out.println("<script>");
						out.println("alert('content aded successfull');");
						out.println("</script>");
						
					}
					else
					{
						RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
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
