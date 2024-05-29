

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
 * Servlet implementation class CustemerDistribute
 */

@WebServlet("/CustemerDistribute")
public class CustemerDistribute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustemerDistribute() {
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
		
		
		String RationCardNumber = request.getParameter("rationcard_no");
		String CustemerName = request.getParameter("Custemer_Name");
		String SelectItem = request.getParameter("select_item");
		String ItemQuantity = request.getParameter("item_quantity");
		String ItemUnit = request.getParameter("item_unit");
		String ItemRate  = request.getParameter("item_rate");
		String AddedDate = request.getParameter("added_date");
		
		
		
		try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into fps_disribute values(?,?,?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, RationCardNumber);
			ps.setString(3, CustemerName);
			ps.setString(4, SelectItem);
			ps.setString(5, ItemQuantity);
			ps.setString(6, ItemUnit);
			ps.setString(7, ItemRate);
			ps.setString(8, AddedDate);
			
		
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("view_stock_fps.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('Distrubuted successfully');");
				out.println("</script>");
				
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("distribute_f.jsp");
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
