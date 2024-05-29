package constant;

import constant.FingerScan1;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadData
 */
public class upload_image1 extends HttpServlet {

    private static final long serialVersionUID = 1L;
    

    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload_image1() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        String name = null;
        //String gender = null;
        String dob = null;
        String age = null;
        String mob = null;
        String dist = null;
        //String state = null;
        //String zip = null;
        String tal = null;
       // String member = null;
        String password = null;
        String adhar = null;
        String income = null;
        String addr = null;
        String cast = null;
        String rationcard=null;
        String cardtype=null;

        String age1[] = new String[10];
        String gender1[] = new String[10];
        String relation[] = new String[10];
        String dob1[] = new String[10];
        String adhar1[] = new String[10];
        String colorcode=request.getParameter("red");
        String email = null;
        String vill = null;
       // String country = null;
        String name1[] = new String[10];

        int j = 0;

        try {

            //PrintWriter out=response.getWriter();
           // name = request.getParameter("name");
            password = request.getParameter("password");
           // gender = request.getParameter("Gender");
            mob = request.getParameter("mob");
           // state = request.getParameter("state");
           // zip = request.getParameter("zip");
            dist = request.getParameter("district");
            tal = request.getParameter("Taluka");
            income = request.getParameter("income");
            email = request.getParameter("email");
            //dob = request.getParameter("dob");
            addr = request.getParameter("addr");
            //age = request.getParameter("age");
          //  adhar = request.getParameter("adhar");
            cast = request.getParameter("Cast");
           // member = request.getParameter("member");
            rationcard = request.getParameter("rationcard");
            cardtype = request.getParameter("cardtype");
            
            
            
          name1=request.getParameterValues("name1");
           age1=request.getParameterValues("age1");
            dob1=request.getParameterValues("dob1");
            gender1=request.getParameterValues("gender1");
            adhar1=request.getParameterValues("adhar1");
            relation=request.getParameterValues("relation");


            vill = request.getParameter("Village");
           // country = request.getParameter("country");
             } catch (Exception e) {
            System.out.println(e);
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
            String sql = "insert into register(id,name,email2,password,gender2,mobile,cast2,dist2,tal,dob,income,adhar,age,addr,village,rationcard,cardtype,colorcode)values(0,'" + name1[0] + "','" + email + "','" + password + "','" + gender1[0] + "','" + mob + "','" + cast + "','" + dist + "','" + tal + "','" + dob1[0] + "','" + income + "','" + adhar1[0] + "','" + age1[0] + "','" + addr + "','" + vill + "','"+rationcard+"','"+cardtype+"','"+colorcode+"')";
            PreparedStatement stm = conn.prepareStatement(sql);
            j = stm.executeUpdate();
            if (j > 0) {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
                PreparedStatement st1 = conn1.prepareStatement("select  id from register where name='" + name1[0] + "'");
                ResultSet rs = st1.executeQuery();
                if (rs.next()) {
                    for (int k = 0; k < name1.length; k++) {
                        String qry = "insert into mem_reg(id,name,age,dob,gender,relation,finger_image, aadhar_image) values(?,?,?,?,?,?,?,?)";
                      //'" + rs.getInt(1) + "','" + name1[k] + "','" + age1[k] + "','" + dob1[k] + "','" + gender1[k] + "','" + relation[k] + "','"+FingerScan1.fingerArray.get(k)+"','" + adhar1[k] + "'
                        PreparedStatement st = conn1.prepareStatement(qry);
                       st.setString(1,rs.getString(1));
                       st.setString(2,name1[k]);
                       st.setString(3,age1[k]);
                       st.setString(4,dob1[k]);
                       st.setString(5,gender1[k]);
                       st.setString(6,relation[k]);
                       st.setString(7,"j");
                        st.setString(8,adhar1[k]);
                        st.executeUpdate();
                        
                    }
                   
                    response.sendRedirect("Login.jsp");
                }
            } else {
                  Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
                PreparedStatement st1 = conn1.prepareStatement("delete  from register where name='" + name1[0] + "'");
                ResultSet rs = st1.executeQuery();
                System.out.println("not nice");
                FingerScan1.fingerArray=new ArrayList<>();
            }

        } catch (Exception e1) {
            System.out.println(e1);
        }

    }
}
