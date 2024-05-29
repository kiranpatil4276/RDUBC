

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.Database;

/**
 * Servlet implementation class addServices
 */
public class addServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addServices() {
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
		
		String heading=request.getParameter("heading");
		String desc=request.getParameter("desc");
		String criteria=request.getParameter("criteria");
		String add_date=request.getParameter("add_date");
		String valid_date=request.getParameter("valid_date");
		
try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into services values(?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, heading);
			ps.setString(3, desc);
			ps.setString(4, criteria);
			ps.setString(5, add_date);
			ps.setString(6, valid_date);
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("services.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('services added successfull');");
				out.println("</script>");
				
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("services.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('services not aded');");
				out.println("</script>");
			}
		}catch(Exception ex){
			
			System.out.println(ex);
		}
		
	}

}
