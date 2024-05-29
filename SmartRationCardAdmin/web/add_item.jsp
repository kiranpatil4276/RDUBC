<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


      <%
       String a=request.getParameter("item");
      String b=request.getParameter("rate");
      Double bb=Double.parseDouble(b);
      String c=request.getParameter("unit");
      String d=request.getParameter("date");
      try{
    	  int i=0;
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
    	 Statement stm=con.createStatement();
    	
    	 //PreparedStatement stm=con.prepareStatement("insert into add_item(item_name,rate,unit,date) values('"+a+"','"+Double.parseDouble("b")+"''"+c+"','"+d+"')");
    	  i=stm.executeUpdate("insert into add_item(item_name,unit,date) values('"+a+"','"+c+"','"+d+"')");
    	  if(i>0)
    	  {
    		  response.sendRedirect("home.jsp");
    	  }
      }
      catch(Exception e)
      {
    	  System.out.println(e);
      }
      
      %>
        
