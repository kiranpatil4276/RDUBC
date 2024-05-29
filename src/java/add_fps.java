
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.Database;
import jdbc.JavaCode;

/**
 * Servlet implementation class add_fps
 */
@WebServlet("/add_fps")
public class add_fps extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        int k = 0;
        String rationcard_no = request.getParameter("rationcard_no");
        String Custemer_Name = request.getParameter("Custemer_Name");
        String date = request.getParameter("added_date");
        //String member = request.getParameter("member");
        String card_type = request.getParameter("card_type");
        String mobile = request.getParameter("mobile");
        String finalmsg = "";
        System.out.println(card_type);

        double q = 0;
        int m = 0;
        String item_name[] = request.getParameterValues("select_item");

        String quantity[] = request.getParameterValues("item_quantity");
        System.out.println(quantity.length);
        String item_unit[] = request.getParameterValues("item_unit");
        String item_rate[] = request.getParameterValues("item_rate");

        System.out.println("name" + Custemer_Name);
        System.out.println("no" + rationcard_no);
        System.out.println("date" + date);
        //System.out.println("member" + member);
        System.out.println("card" + card_type);
        String o = null;
        String t = null;
        for (int i = 0; i < quantity.length; i++) {
            System.out.println("in for loop");
            System.out.println(quantity.length);
            try {
                System.out.println("hello");
                Connection conn = Database.getConnection();
                System.out.println("hi");
                Statement st = conn.createStatement();
                ResultSet r1 = st.executeQuery("select item_name from add_item where id=" + item_name[i]);
                while (r1.next()) {
                    t = r1.getString("item_name");
                }
                PreparedStatement p = conn.prepareStatement("select quantity from item_detail2 where item_name=? and distribution_id='" + session.getAttribute("uid") + "'");
                p.setString(1, t);
                System.out.println(t);
                ResultSet r = p.executeQuery();
                while (r.next()) {
                    System.out.println("available");
                    double f = r.getDouble("quantity");
                    System.out.println(f);
                    //System.out.println("####"+f);
                    if (Double.parseDouble(quantity[i]) > f) {

                        out.print("<script type=\"text/javascript\">");
                        out.print("alert('Quantity Shortage')");
                        out.print("<script>");
                    } else {
                        System.out.println(quantity[i]);
                        PreparedStatement p1 = conn.prepareStatement("update item_detail2 set quantity=quantity-? where item_name=? and distribution_id='" + session.getAttribute("uid") + "'");
                        p1.setDouble(1, Double.parseDouble(quantity[i]));
                        p1.setString(2, t);

                        m = p1.executeUpdate();
                    }

                }
                conn.close();
            } catch (Exception y) {
                System.out.println(y);
            }
        }

        if (m > 0) {

            for (int u = 0; u < quantity.length; u++) {
                //System.out.println(quantity[u]);
                k = 0;
                try {
                    Connection conn = Database.getConnection();
                    Statement st = conn.createStatement();
                    ResultSet r1 = st.executeQuery("select item_name from add_item where id=" + item_name[u]);
                    while (r1.next()) {
                        o = r1.getString("item_name");
                    }
                    PreparedStatement ps = conn.prepareStatement("select * from item_detail3 where item_name='" + o + "' and customer_name='" + Custemer_Name + "'");
                    ResultSet rss = ps.executeQuery();
                    if (rss.next()) {
                        PreparedStatement pp = conn.prepareStatement("select quantity from item_detail3 where item_name='" + o + "' and customer_name='" + Custemer_Name + "'");
                        ResultSet rj = pp.executeQuery();
                        while (rj.next()) {
                            q = rj.getDouble(1);
                        }
                        PreparedStatement pp1 = conn.prepareStatement("update item_detail3 set quantity='" + q + "'+? where item_name='" + o + "' and customer_name='" + Custemer_Name + "'");
                        pp1.setDouble(1, Double.parseDouble(quantity[u]));
                        k = pp1.executeUpdate();
                        JavaCode jc = new JavaCode();
                        String msg1 = "";
                       
                        
                    }
                    if (k > 0) {
                        System.out.println("not update");
                    } else {
                        Connection con = Database.getConnection();
                        PreparedStatement p = con.prepareStatement("insert into item_detail3(item_name, quantity, rate, unit, date, customer_name) values(?,?,?,?,?,?)");
                        p.setString(1, o);
                        p.setDouble(2, Double.parseDouble(quantity[u]));
                        //id, Item_name, quantity, rate, unit, date, customer_name

                        // p.setDouble(3, Double.parseDouble(quantity[u]));
                        p.setString(3, item_rate[u]);
                        p.setString(4, item_unit[u]);
                        p.setString(5, date);
                        p.setString(6, Custemer_Name);

                        p.executeUpdate();
                        JavaCode jc = new JavaCode();
                        //  item_name[] quantity[] item_unit[] item_rate[]
                        String msg1 = "";
                         finalmsg = finalmsg + "\n" + o + ":" + quantity[u] + "" + item_unit[u] + ",Rate:" + item_rate[u] + ",Total:" + Double.parseDouble(quantity[u].toString()) * Double.parseDouble(item_rate[u]) + "\n";
                      
                       

                    }

                } catch (Exception y) {
                    System.out.println(y);

                }
            }
        }
        JavaCode jc= new JavaCode();
        String msg = "Dear Customer" + Custemer_Name + "you have purchaed following items:" + finalmsg + "Thank you";
        jc.sendMessage(mobile, msg);
        response.sendRedirect("fps_home.jsp");
    }

}
