/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.Database;
import jdbc.JavaCode;

/**
 *
 * @author Pramod
 */
public class FoodRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
            
       
try{
        String rationcard_no = request.getParameter("rationcard_no");
         Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
            String sql = "select * from register where rationcard='"+rationcard_no+"'";
            PreparedStatement stm = conn.prepareStatement(sql);
          ResultSet k = stm.executeQuery();
          String village="";
          String mobile="";
          if(k.next())
          {
              village=k.getString("village");
                mobile=k.getString("mobile");
          }
        String cardtype = request.getParameter("cardtype");
      String item_name[] = request.getParameterValues("select_item");

        String quantity[] = request.getParameterValues("item_quantity");
        String items="";
        String q="";
        
         String name="";
        for(int j=0;j<item_name.length;j++)
        {
         items=items+"#"+item_name[j];   
          q=q+"#"+quantity[j];
          
          
           Connection conns = Database.getConnection();
                System.out.println("hi");
                Statement sts = conns.createStatement();
                ResultSet r1s = sts.executeQuery("select item_name from add_item where id=" + item_name[j]);
                while (r1s.next()) {
                  name   = name+","+r1s.getString("item_name");
                }
        }
       
        
                
       Class.forName("com.mysql.jdbc.Driver");
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
            String sql1 = "insert into requestfood(id,rationcard,cardtype,items,quantity,village)values(0,'" + rationcard_no + "','" + cardtype + "','" + items.substring(1,items.length()) + "','" + q.substring(1,q.length())+ "','"+village+"')";
            PreparedStatement stmm = conn1.prepareStatement(sql1);
          int  kn = stmm.executeUpdate();
          if(kn>0)
          {
              JavaCode jc = new JavaCode();
        String msg = "Dear Customer" + rationcard_no + "Your request is placed. Product details:\n Items:" + name + "\n Quantity:"+items.substring(1,items.length())+". Thank you";
        jc.sendMessage(mobile, msg);
        response.sendRedirect("customer_home.jsp");
          }
          else
          {System.out.print("Something went wrong");}
    }
    
    catch(Exception e)
    {
        e.printStackTrace();
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
