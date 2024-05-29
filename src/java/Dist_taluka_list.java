

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
 * Servlet implementation class Dist_taluka_list
 */
public class Dist_taluka_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dist_taluka_list() {
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
		
		
		String taluka_distribute_id = request.getParameter("officer");
		String  taluka = request.getParameter("taluka");
		String item_name = request.getParameter("item_name");
		String quantity = request.getParameter("quantity");
		String rate = request.getParameter("rate");
		String unit  = request.getParameter("unit");
		String date = request.getParameter("date");
		
		
		
		try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into taluka_distribute  values(?,?,?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, taluka_distribute_id);
			ps.setString(3, taluka);
			ps.setString(4, item_name);
			ps.setString(5, quantity);
			ps.setString(6, rate);
			ps.setString(7, unit);
			ps.setString(8, date);
			
		
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("view_item_t.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('Distrubuted successfully');");
				out.println("</script>");
				
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("taluka_f.jsp");
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
