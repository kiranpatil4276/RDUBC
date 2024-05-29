
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
@WebServlet("/ProceedCustomerRequest")
public class ProceedCustomerRequest extends HttpServlet {

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
        String Custemer_Name = request.getParameter("customer");
        String card_type = request.getParameter("card_type");
        String mobile = request.getParameter("mobile");
           String finalmsg = "";
        double q = 0;
        int m = 0;
        String item_name[] = null;
        String quantity[] = null;
        ArrayList item_unit = new ArrayList();
        ArrayList item_rate = new ArrayList();
        try {
            Database ds = new Database();
             Connection conn2 = ds.getConnection();
              Statement st12 = conn2.createStatement();
           
            
           
           

           
            
            
            
            Connection conn = ds.getConnection();
            String rationcard_no = request.getParameter("ration");
            Statement st1 = conn.createStatement();

            ResultSet r11 = st1.executeQuery("select * from requestfood where rationcard= '" + rationcard_no + "'");
            while (r11.next()) {
                item_name = r11.getString("items").split("#");
                quantity = r11.getString("quantity").split("#");

            }
            
             for(int kk=0;kk<item_name.length;kk++)
            {
                 ResultSet r112 = st12.executeQuery("select * from add_item where id= '" + item_name[kk] + "'");
            while (r112.next()) {
                item_unit.add(r112.getString("unit"));
                if(card_type.equalsIgnoreCase("APL"))
                {
                 item_rate.add(r112.getString("rate_apl"));
                }
                else
                {
                  item_rate.add(r112.getString("rate_bpl"));   
                }
            }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        int k = 0;

        System.out.println("name" + Custemer_Name);

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
                PreparedStatement p = conn.prepareStatement("select quantity from item_detail2 where name=? and distribution_id='" + session.getAttribute("uid") + "'");
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
                        PreparedStatement p1 = conn.prepareStatement("update item_detail2 set quantity=quantity-? where name=? and distribution_id='" + session.getAttribute("uid") + "'");
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
                    while (rss.next()) {
                        PreparedStatement pp = conn.prepareStatement("select quantity from item_detail3 where item_name='" + o + "' and customer_name='" + Custemer_Name + "'");
                        ResultSet rj = pp.executeQuery();
                        while (rj.next()) {
                            q = rj.getDouble(1);
                        }
                        PreparedStatement pp1 = conn.prepareStatement("update item_detail3 set quantity='" + q + "'+? where item_name='" + o + "' and customer_name='" + Custemer_Name + "'");
                        pp1.setDouble(1, Double.parseDouble(quantity[u]));
                        k = pp1.executeUpdate();
                        finalmsg = finalmsg + "\n" + o + ":" + quantity[u] + ":" + item_unit.get(u).toString() + ",Rate:" + item_rate.get(u).toString() + "Total:" + Double.parseDouble(quantity[u].toString()) * Double.parseDouble(item_rate.get(u).toString()) + "\n";

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
                        p.setString(3, item_rate.get(u).toString());
                        p.setString(4, item_unit.get(u).toString());
                        // p.setString(5, date);
                        p.setString(6, Custemer_Name);

                        p.executeUpdate();
                         finalmsg = finalmsg + "\n" + o + ":" + quantity[u] + ":" + item_unit.get(u).toString() + ",Rate:" + item_rate.get(u).toString() + "Total:" + Double.parseDouble(quantity[u].toString()) * Double.parseDouble(item_rate.get(u).toString()) + "\n";

                    }

                } catch (Exception y) {
                    System.out.println(y);

                }
            }
        }
        JavaCode jc = new JavaCode();
        String msg = "Dear Customer" + Custemer_Name + "Your request is accepted. you will receive following items:" + finalmsg + "Thank you";
        jc.sendMessage(mobile, msg);
        response.sendRedirect("fps_home.jsp");
    }

}
