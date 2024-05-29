

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.Database;


public class add_district_ration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public add_district_ration() {
        super();
         }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		String name = request.getParameter("name");
		
try{
			
			Connection conn = Database.getConnection();
			PreparedStatement ps = conn.prepareStatement("insert into add_district(district) values(?)");
			ps.setString(1, name);
			
			int result = ps.executeUpdate();
			
			if(result==1){
				RequestDispatcher rd = request.getRequestDispatcher("district.jsp");
				rd.include(request, response);
				System.out.println("add succesfully");
				
				}
		else
			{
	RequestDispatcher rd = request.getRequestDispatcher("district.jsp");
	rd.include(request, response);
	System.out.println("record failed");

				}
	}catch(Exception ex){

		System.out.println(ex);


}

}

}
