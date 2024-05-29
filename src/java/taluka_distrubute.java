

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

import jdbc.Database;

/**
 * Servlet implementation class taluka_distrubute
 */
public class taluka_distrubute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public taluka_distrubute() {
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
		
		String officer=request.getParameter("officer");
		String taluka=request.getParameter("taluka");
		String item=request.getParameter("item_name");
		String quantity=request.getParameter("quantity");
		String rate=request.getParameter("rate");
		String unit=request.getParameter("unit");
		String date=request.getParameter("date");
try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into taluka_distribute values(?,?,?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, officer);
			ps.setString(3, taluka);
			ps.setString(4, item);
			ps.setInt(5, Integer.parseInt(quantity));
			ps.setDouble(6, Double.parseDouble(rate));
			ps.setString(7, unit);
			ps.setString(8, date);
			int result = ps.executeUpdate();
			
			if(result==1){
				
				PreparedStatement pss=conn.prepareStatement("select quantity from taluka_distribute where item =?");
				pss.setString(1,item);
				ResultSet rs1=pss.executeQuery();
				int q=0;
				
				while(rs1.next())
				{
					
					q=rs1.getInt("quantity");
					System.out.println(q);
					
					q=q-Integer.parseInt(quantity);
					System.out.println(q);
					
					PreparedStatement pss1=conn.prepareStatement("update taluka_stock set quantity=? where item =?");
					
					pss1.setInt(1,q);
					pss1.setString(2,item);
					int r=pss1.executeUpdate();
					System.out.println(r);
				
				
				
				RequestDispatcher rd = request.getRequestDispatcher("taluka_distribute.jsp");
				rd.include(request, response);
				
				out.println("<script>");
				out.println("alert('"+item+" distributed successfull');");
				out.println("</script>");
				
			}
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("taluka_distribute.jsp");
				rd.include(request, response);
				out.println("<script>");
				out.println("alert('"+item+" not distributed ');");
				out.println("</script>");
			}
		}catch(Exception ex){
			
			System.out.println(ex);
		}
		
	}

}
