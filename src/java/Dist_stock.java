

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
 * Servlet implementation class Dist_stock
 */
public class Dist_stock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dist_stock() {
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
		
		
		String officer = request.getParameter("officer");
		String  disrict = request.getParameter("disrict");
		String item = request.getParameter("item");
		String quantity = request.getParameter("quantity");
		String rate = request.getParameter("rate");
		String unit  = request.getParameter("unit");
		String date = request.getParameter("date");
		

		
		try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into admin_distribute values(?,?,?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, officer);
			ps.setString(3, disrict);
			ps.setString(4, item);
			ps.setString(5, quantity);
			ps.setString(6, rate);
			ps.setString(7, unit);
			ps.setString(8, date);
			
		
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("view_stock_d.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('Distrubuted successfully');");
				out.println("</script>");
				
			}
			else
			{
				
				RequestDispatcher rd = request.getRequestDispatcher("view_stock_d.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('Distrubuted not successfully');");
				out.println("</script>");
			}
		}catch(Exception ex){
			
			System.out.println(ex);
		}
		
	}

}
