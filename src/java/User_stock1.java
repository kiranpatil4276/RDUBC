

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
 * Servlet implementation class User_stock1
 */
public class User_stock1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_stock1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String Ration_Card_Number = request.getParameter("Ration_Card_Number");
		String  Custemer_Name = request.getParameter("Custemer_Name");
		String Select_Item = request.getParameter("Select_Item");
		String Item_Quantity = request.getParameter("Item_Quantity");
		String Item_Unit = request.getParameter("Item_Unit");
		String Item_Rate  = request.getParameter("Item_Rate");
		String Added_Date = request.getParameter("Added_Date");
		
		
		
		try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into fps_disribute values(?,?,?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, Ration_Card_Number);
			ps.setString(3, Custemer_Name);
			ps.setString(4, Select_Item);
			ps.setString(5, Item_Quantity);
			ps.setString(6, Item_Unit);
			ps.setString(7, Item_Rate);
			ps.setString(8, Added_Date);
			
		
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("user_stock.jsp");
				rd.include(request, response);
				out.println("<script>");
				//out.println("alert('Distrubuted successfully');");
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