

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.Database;

/**
 * Servlet implementation class status
 */
public class status extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public status() {
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
		
		HttpSession s=request.getSession();
		
		String email=(String) s.getAttribute("x");
		System.out.println("mail"+email);
		
		String status = request.getParameter("status");
		System.out.println("hi status"+status);
		String name = request.getParameter("name");
		System.out.println("hi name "+name);
		String card_type=request.getParameter("card_type");
		System.out.println("hi card"+card_type);
		
		String officer=request.getParameter("officer");
		System.out.println("hill office"+officer);
		
try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps=conn.prepareStatement("update register set status='"+status+"' , card_type='"+card_type+"', officer='"+officer+"' where id='"+name+"'");
			
			 
			/*ps.setString(1, status);
			ps.setString(2,card_type);
			ps.setString(3, officer);
			ps.setString(4, name);
			*/
			
			
			
			int i= ps.executeUpdate();
			
			System.out.println(i);
			if(i>0){
				String content="hi";
				Mailer.sendEmail(content, email);
				RequestDispatcher rd = request.getRequestDispatcher("taluka_home.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('status updated');");
				out.println("</script>");
				
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("customer_verify1.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('status not updated');");
				out.println("</script>");
			}
		}catch(Exception ex){
			
			System.out.println(ex);
		}
		
	}

}
