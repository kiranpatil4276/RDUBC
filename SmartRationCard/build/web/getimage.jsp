<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
<% int id=Integer.parseInt(request.getParameter("id"));
Connection con=Database.getConnection();
try
{
	PreparedStatement ps=con.prepareStatement("select * from aboutus where about_id='"+id+"'");
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		byte barray[]=rs.getBytes(4);
		response.setContentType("image/jpg");
		OutputStream op=response.getOutputStream();
		op.write(barray);
		op.flush();
		op.close();
	}
	
}
catch(Exception e)
{
	System.out.println(e);
}

%>