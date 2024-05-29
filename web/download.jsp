<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <%    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
    PreparedStatement stm=con.prepareStatement("select adhar_image from register where id='"+session.getAttribute("id")+"'");
    ResultSet rs=stm.executeQuery();
    String filename=null;
    while(rs.next())
    {
       filename =rs.getString(1);   
    }
      String filepath = "D:\\Ration123\\SmartRationCard\\WebContent\\image\\";   
      response.setContentType("APPLICATION/OCTET-STREAM");   
      response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
      
      java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
                
      int i;   
      while ((i=fileInputStream.read()) != -1) {  
        out.write(i);   
      }   
      fileInputStream.close();   
   
      %>   

</body>
</html>