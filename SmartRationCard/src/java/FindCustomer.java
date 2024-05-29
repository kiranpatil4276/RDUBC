/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import constant.FingerScan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.Database;

/**
 *
 * @author Pramod
 */
public class FindCustomer extends HttpServlet {

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
           try {
               
                PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
               Database db = new Database();
           
           FingerScan fingerScan = new FingerScan();
           Connection con = db.getConnection();
           Statement st= con.createStatement();
           String family_member="";
            String sql = "Select * from mem_reg";
            ResultSet rs = st.executeQuery(sql);
            session.removeAttribute("cust");
            while (rs.next()) {
                family_member = rs.getString("id");

                byte Content[] = {};

                Content = rs.getBytes("finger_image");

                if (fingerScan.fingerMatch(Content)) {
                    FingerScan.myfingerdata = null;
                 System.out.println("matched with id:" + family_member);
            session.setAttribute("cust", family_member);
            
                    break;
                } else {
                    continue;
                }

            }
            //create session
            if(session.getAttribute("cust")!=null)
            {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Customer Record Found!');");
            
            out.println("location='distribute_ff.jsp?';");
            out.println("</script>");
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
            out.println("alert('Customer Record not matched!');");
            
            out.println("location='distribute_ff.jsp?';");
            out.println("</script>");
            }
        } catch (Exception e) {
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
