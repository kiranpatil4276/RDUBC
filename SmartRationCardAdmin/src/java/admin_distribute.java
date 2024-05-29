
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

import jdbc.Database;

/**
 * Servlet implementation class admin_distribute
 */
public class admin_distribute extends HttpServlet {

    private static final long serialVersionUID = 1L;
    int id = 0;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_distribute() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int k = 0;
        String officer = request.getParameter("officer");
        String disrict = request.getParameter("district");
        String date = request.getParameter("date");
        double q = 0;
        int m = 0;
        String item_name[] = request.getParameterValues("item_name");
        String rate[] = request.getParameterValues("item_prise");
        String quantity[] = request.getParameterValues("quantity");
        String unit[] = request.getParameterValues("unit");

        for (int i = 0; i < quantity.length; i++) {
            try {
                Connection conn = Database.getConnection();
                PreparedStatement p = conn.prepareStatement("select quantity from admin_stock where item_name=?");
                p.setString(1, item_name[i]);
                ResultSet r = p.executeQuery();
                while (r.next()) {
                    double f = r.getDouble("quantity");
                    System.out.println(f);
                    if (Double.parseDouble(quantity[i]) > f) {

                        out.print("<script type=\"text/javascript\">");
                        out.print("alert('Quantity Shortage')");
                        out.print("<script>");
                    } else {
                        PreparedStatement p1 = conn.prepareStatement("update admin_stock set quantity=quantity-? where item_name=?");
                        p1.setString(1, quantity[i]);
                        p1.setString(2, item_name[i]);

                        m = p1.executeUpdate();
                    }

                }
                conn.close();
            } catch (Exception y) {
                System.out.println(y);
            }
        }

        /*try
		{
		Connection conn = Database.getConnection();
		Statement st=conn.createStatement();
		PreparedStatement ps = conn.prepareStatement("select * from user whe");*/
 /*ps.setString(1,officer );
		ps.setString(2, disrict);
		ps.setString(3, date);
		
	     ps.executeUpdate();
	     
		ResultSet rs=st.executeQuery("select * from dis_detail");
		if(rs.last())
		{
			id=rs.getInt(1);
		System.out.println(id);
		}
		conn.close();
		}
		catch(Exception g)
		{
			System.out.println(g);
		}*/
        if (m > 0) {
            System.out.println("insert loop");
            for (int u = 0; u < quantity.length; u++) {
                k = 0;
                try {
                    Connection conn = Database.getConnection();
                    PreparedStatement ps = conn.prepareStatement("select * from item_detail where item_name='" + item_name[u] + "' and distribution_id='" + Integer.parseInt(officer) + "'");
                    ResultSet rss = ps.executeQuery();
                    while (rss.next()) {
                        PreparedStatement pp = conn.prepareStatement("select quantity from item_detail where item_name='" + item_name[u] + "' and distribution_id='" + Integer.parseInt(officer) + "'");
                        ResultSet rj = pp.executeQuery();
                        while (rj.next()) {
                            q = rj.getDouble(1);
                        }
                        PreparedStatement pp1 = conn.prepareStatement("update item_detail set quantity='" + q + "'+? where item_name='" + item_name[u] + "' and distribution_id='" + Integer.parseInt(officer) + "'");
                        pp1.setDouble(1, Double.parseDouble(quantity[u]));
                        k = pp1.executeUpdate();

                    }
                    if (k > 0) {

                    } else {
                        System.out.println("in insert last");
                        Connection con = Database.getConnection();
                        PreparedStatement p = con.prepareStatement("insert into item_detail(distribution_id,item_name,quantity,unit,date) values(?,?,?,?,?)");
                        p.setInt(1, Integer.parseInt(officer));
                        p.setString(2, item_name[u]);
                        p.setDouble(3, Double.parseDouble(quantity[u]));
                       
                        p.setString(4, unit[u]);
                        p.setString(5, date);
                        k = p.executeUpdate();

                    }

                } catch (Exception y) {
                    System.out.println(y);

                }
            }

            /* else
			 {
				 PreparedStatement stm1=con.prepareStatement("select quantity from item_detail where item_name='"+item_name+"'");
				 ResultSet rs=stm1.executeQuery();
				 while(rs.next())
				 {
					 q=rs.getDouble(1);
				 }
				 PreparedStatement stm=con.prepareStatement("update item_detail set quantity='"+(q+quantity[i])+"' where item_name='"+item_name[i]+"'");
			     int l=stm.executeUpdate();
			     if(l>0)
			     {
			    	 response.sendRedirect("home.jsp");
			     }
			     else
			     {
			    	 
			     }
			     
			 }*/
        }

        response.sendRedirect("home.jsp");

    }

}
