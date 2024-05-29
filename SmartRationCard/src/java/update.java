

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class update
 */
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
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
		PrintWriter out = response.getWriter();
		// String id=request.getParameter("id");
		 //System.out.println("id is"+id);
		 String status=request.getParameter("status");
		 int status1=Integer.parseInt(status);
		 System.out.println("status is"+status1);
		 String officer=request.getParameter("officer");
		 System.out.println(officer);
		 String card=request.getParameter("card_type");
		 System.out.println(card);
		 HttpSession session=request.getSession();
		// String id=session.getAttribute(zx);
		String idd=request.getParameter("id");
		System.out.println(idd);
		 
		 try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root", "root");
			Statement st1=conn.createStatement();
			String query="update register set status="+status1+", card_type='"+card+"', officer='"+officer+"' where id='"+idd+"'";
			PreparedStatement ps=conn.prepareStatement(query);

			
			//PreparedStatement ps=conn.prepareStatement("update register set status='"+status+"' , card_type='"+card_type+"', officer='"+officer+"' where id='"+name+"'");
			
			 
			/*ps.setString(1, status);
			ps.setString(2,card_type);
			ps.setString(3, officer);
			ps.setString(4, name);
			*/
			
			
			
			
			
			int i=ps.executeUpdate();
		if(i==1){
		
			
			//HttpSession session = request.getSession();
			session.setAttribute("uid", idd);
			//HttpSession session2 = request.getSession();
			session.setAttribute("status", status1);
			response.sendRedirect("Tal_mail");
			
		}else{
			System.out.println("error");
			//response.sendRedirect("Tal_mail.java");
			
		}

     	}catch(Exception e)
     	{
     		System.out.println(e);
     	}
}}
