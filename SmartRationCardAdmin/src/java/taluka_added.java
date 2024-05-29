import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.Database;

/**
 * Servlet implementation class taluka_added
 */
public class taluka_added extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public taluka_added() {
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
	
		
		String name = request.getParameter("name");
		String dist_name=request.getParameter("dist_name");
try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into add_taluka(taluka, district) values(?,?)");
			ps.setString(1, name);
			ps.setString(2, dist_name);
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("taluka.jsp");
				rd.include(request, response);
				System.out.println("add succesfully");
				
				}
		else
			{
	RequestDispatcher rd = request.getRequestDispatcher("taluka.jsp");
	rd.include(request, response);
	System.out.println("record failed");

				}
	}catch(Exception ex){

		System.out.println(ex);


}


	}

}
