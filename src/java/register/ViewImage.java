package register;
import java.sql.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import jdbc.Database;
//@WebServlet("/ViewImage")
public class ViewImage extends HttpServlet{
	
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//PrintWriter pw = response.getWriter();

Connection con=null;
try{
	System.out.println("request.getParameter");
	System.out.println(request.getParameter("id"));
	int id=Integer.parseInt(request.getParameter("id"));
    con=Database.getConnection();
  
PreparedStatement st1=con.prepareStatement("select image from aboutus where about_id=?");
st1.setInt(1, id);
ResultSet rs1 = st1.executeQuery();
String imgLen="";
if(rs1.next()){
imgLen = rs1.getString(1);
System.out.println(imgLen.length());
}
rs1 = st1.executeQuery();
if(rs1.next()){
int len = imgLen.length();
byte [] rb = new byte[len];
InputStream readImg = rs1.getBinaryStream(1);
int index=readImg.read(rb, 0, len); 
System.out.println("index"+index);
st1.close();
response.reset();
response.setContentType("image/jpg");
response.getOutputStream().write(rb,0,len);
response.getOutputStream().flush(); 
}
} catch (Exception e){
e.printStackTrace();
}
}
}