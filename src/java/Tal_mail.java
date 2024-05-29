

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.json.HTTP;

/**
 * Servlet implementation class Tal_mail
 */
public class Tal_mail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;
       
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tal_mail() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		      HttpSession session=request.getSession();
		        System.out.println("Heloooooo");
				PrintWriter out = response.getWriter();
				
				
				 String email="";
				 String status1="";
				 String id1=session.getAttribute("uid").toString();
				 int idd=Integer.parseInt(id1);
				 System.out.println("HI"+idd);
				
				 
					 try{ 
						 Class.forName("com.mysql.jdbc.Driver");  
					 
				      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
					 Statement stmt=con.createStatement(); 
					 ResultSet rss=stmt.executeQuery("select * from register where id='"+idd+"'");
					 
					 
					 while(rss.next())
					 {
						 email=rss.getString("email");
						 status1=rss.getString("status");
						 int status2=Integer.parseInt(status1);
						 System.out.println(email);
					 if(status2==1)
					 {
						 System.out.println("jjjjjjjjj");
						 String subject=" Seller Confirmation";
							//String content=" Your Account is successfully created ";
							String content= "hi Your Account is successfully created.\n your Ration card no is:"+rss.getString(1)+",\n Name="+rss.getString("name")+" \n Your Password ="+rss.getString("password")+",\n Card Type ="+rss.getString("card_type")+",\n FPS Officer="+rss.getString("officer")+"";

							Mailer.sendEmail(content, email);
							//resultMessage = "Confirmation  sent successfully";
					 }
					 
					 else{
						  
							// st.executeUpdate("update register set status="+3+" where email_id='"+email+"'");
								
								
						        
						        String subject=" Seller Confirmation";
								String content=" Your Ration Card Account is not  created ";
								Mailer.sendEmail(content, email);
						
					}
					 }
					 }
					 catch(Exception e)
					 {
						 System.out.println(e);
					 }
					 
					finally {
							
							RequestDispatcher ee = request.getRequestDispatcher("taluka_home.jsp");
							 ee.include(request, response);
					          out.println("<script type=\"text/javascript\">");
					        //  out.println("alert('"+resultMessage+"');");
					          out.println("location='taluka_home.jsp';");
					       
					         out.println("</script>");
					         
					
						}
					 
	}
}
					 
					 
						
					//	rss=st.executeQuery("select * from seller_reg where email='"+ids+"'");

	 
			 
		// Class.forName("com.mysql.jdbc.Driver");  
	     // Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","kavya");
		 //Statement stmt1=con1.createStatement(); 
		 //ResultSet rss=stmt1.executeQuery("select * from register where id='"+idd+"'");
		 
				 		//rss=stmt1.executeQuery("select * from register where email_id='"+idd+"'");
				
				//rss.next();
				//int id=rss.getInt(1);
				//st.executeUpdate("update register set status="+2+" where email_id='"+email+"'");
				 
					 
				 
						
			 
		 
		 
				 

	

