package pack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class go
 */
@WebServlet("/go")
public class go extends HttpServlet {

    private static final long serialVersionUID = 1L;
    String s;
    int i;
    String name;
    String type;
    String f;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession httpSession = request.getSession(false);
         String username = httpSession.getAttribute("uname").toString();
        try {
            ListPorts.main();
        } catch (Exception e) {
            System.out.println(e);
        }
        try {
            Thread.currentThread().sleep(10000);
        } catch (InterruptedException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/smartrationcard", "root", "root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * from register where name='"+username+"'");
            while (rs.next()) {
                s = rs.getString("name");
                System.out.println("first" + s);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/smartrationcard", "root", "root");
            Statement st = con.createStatement();

            String t = s.substring(0, 11);

            System.out.println(t);
            ResultSet rt = st.executeQuery("select * from register where rationcard='" + t + "'");
            while (rt.next()) {
                i = rt.getInt(1);
                name = rt.getString("name");
                type = rt.getString("cardtype");
                f = rt.getString("member");

            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        RequestDispatcher rd = request.getRequestDispatcher("distribute_ff.jsp?id=" + i + "&name=" + name + "&type=" + type + "&f=" + f + "");
        rd.forward(request, response);

    }
}
