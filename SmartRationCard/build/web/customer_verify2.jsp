<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
			<%
								
			                 
								try{  
										Class.forName("com.mysql.jdbc.Driver");  
										Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
										Statement stmt=con.createStatement();  
										ResultSet rs=stmt.executeQuery("select * from mem_reg where id='"+session.getAttribute("id")+"'");  
										
										
										while(rs.next()){
											
											out.println("<tr>");	
											
											
											
											session.setAttribute("p",rs.getString(2));
											
											session.setAttribute("q",rs.getString(3));
											
											session.setAttribute("r",rs.getString(4));
										
											session.setAttribute("s",rs.getString(5));
										
											session.setAttribute("t",rs.getString(6));
											
											
										 
										}
										response.sendRedirect("customer_verify1.jsp");
								}
			
						 	 	catch(Exception e)
						 	 	{
						 	 		System.out.println(e);
						 	 	}
										%>

</body>
</html>