<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
int j=0;
String Name=request.getParameter("name");
String Mob=request.getParameter("mob");
String Password=request.getParameter("password");
String Age=request.getParameter("age");
String Addr=request.getParameter("addr");
String Adhar=request.getParameter("adhar");
String Income=request.getParameter("income");
String Gender=request.getParameter("gender");
String Taluka=request.getParameter("tal");
String District=request.getParameter("dist");
String State=request.getParameter("state");
String Code=request.getParameter("zip");
String Cast=request.getParameter("cast");
String Member=request.getParameter("member");
String Name1=request.getParameter("name1");
String Gender1=request.getParameter("gender1");
String Age1=request.getParameter("age1");
String Relation=request.getParameter("relation");
String Birthdate=request.getParameter("dob");
String Birthdate1=request.getParameter("dob1");

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
	PreparedStatement stm=conn.prepareStatement("insert into register(Mame,Mob,Password,Adhar,Income,Birthdate,Age,Addr,Tal,Dist,State,Gender,Cast,Zip,Member,Name1,Birthdate1,Age1,Gender1,Relation) values('"+Name+"','"+Integer.parseInt(Mob)+"','"+Password+"','"+Adhar+"','"+Integer.parseInt(Income)+"','"+Birthdate+"','"+Integer.parseInt(Age)+"','"+Addr+"','"+Taluka+"','"+District+"','"+State+"','"+Gender+"','"+Cast+"','"+Integer.parseInt(Code)+"','"+Integer.parseInt(Member)+"','"+Name1+"','"+Birthdate1+"','"+Integer.parseInt(Age1)+"','"+Gender1+"','"+Relation+"')");
	 j=stm.executeUpdate();  
     if(j>0)
	{
		response.sendRedirect("index.jsp");
	}
	else
	{
		response.sendRedirect("Failure.jsp");
	}
    }
	catch(Exception e)
	{
		System.out.println(e);
	}

%>

</body>
</html>