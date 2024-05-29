
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
String village="";

Connection con=Database.getConnection();
PreparedStatement ps=con.prepareStatement("select * from users where userid="+id);
ResultSet rs=ps.executeQuery();
JSONObject ob=new JSONObject();
if(rs.next())
{    village=rs.getString(12);
	ob.put("village", rs.getString(12));
}
PreparedStatement ps1=con.prepareStatement("select sum(member) from register where village='"+village+"'");
ResultSet rs1=ps1.executeQuery();
if(rs1.next()){
ob.put("population",rs1.getString(1));
}
out.print(ob);
%>

