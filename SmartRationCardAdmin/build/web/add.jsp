<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


      <%
      String name=request.getParameter("name");
       String a=request.getParameter("item");
      String b=request.getParameter("rate_apl");
      String rate_bpl=request.getParameter("rate_bpl");
      Double bb=Double.parseDouble(b);
      String c=request.getParameter("unit");
      String d=request.getParameter("date");
      try{
    	  int i=0;
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
    	 Statement stm=con.createStatement();
    	
    	 //PreparedStatement stm=con.prepareStatement("insert into add_item(item_name,rate,unit,date) values('"+a+"','"+Double.parseDouble("b")+"''"+c+"','"+d+"')");
    	  i=stm.executeUpdate("insert into add_item(item_name,rate_apl,unit,date,rate_bpl) values('"+a+"','"+bb+"','"+c+"','"+d+"','"+rate_bpl+"')");
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
        
