

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class additem
 */
public class additem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public additem() {
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
		int i=0;
		int j=0;
		String item=request.getParameter("item");
		System.out.println(item);
		String quantity =request.getParameter("quantity");
		String date =request.getParameter("date");
		
		
try{
		    int q=0;
		    String item1=null;
	        Class.forName("com.mysql.jdbc.Driver");
			Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
		    Statement stm=conn.createStatement();
		     ResultSet rs2=stm.executeQuery("select item_name from add_item where id='"+item+"'");
		     while(rs2.next())
		     {
		    	 item1=rs2.getString(1);
		     }
		     ResultSet rs1=stm.executeQuery("select * from admin_stock where item_name='"+item1+"'");
		    if(rs1.next())
		    {
		    	ResultSet rs=stm.executeQuery("select quantity from admin_stock where item_name='"+item1+"'");
			    
			    while(rs.next())
			    {
			    	q=rs.getInt(1);
			    	System.out.println("database quantity"+q);
			    }
			    q=q+Integer.parseInt(quantity);
				PreparedStatement ps = conn.prepareStatement("update admin_stock set quantity='"+q+"',date='"+date+"' where item_name='"+item1+"'");
				
				
							
				int result = ps.executeUpdate();
				
				if(result==1){
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.include(request, response);
					out.println("<script>");
					out.println("alert('item aded successfull');");
					out.println("</script>");
					
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.include(request, response);
					out.println("<script>");
					out.println("alert('item not aded');");
					out.println("</script>");
				}
		    }
		    else
		    {
		    	
		    	ResultSet rss1=stm.executeQuery("select * from add_item where item_name='"+item1+"'");
		    	while(rss1.next())
		    	{
		    	 j=stm.executeUpdate("insert into admin_stock(item_name,quantity,unit,date)values('"+item1+"','"+quantity+"','"+rss1.getString(4)+"','"+date+"')");
		    	 if(j>0)
					{
						 RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
							rd.include(request, response);
							
					}
		    	}
				
		    }
				
		   
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println(ex);
		}
		
	}

}
