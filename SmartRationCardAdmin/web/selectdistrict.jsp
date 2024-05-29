
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("id");
String dist="";

Connection con=Database.getConnection();
 PreparedStatement ps=con.prepareStatement("select * from users where userid='"+id+"'");
ResultSet rs=ps.executeQuery();
JSONObject ob=new JSONObject();
if(rs.next())
{    dist=rs.getString(8);
	ob.put("district", rs.getString(8));
}
 PreparedStatement ps1=con.prepareStatement("select sum(member1) from register where dist='"+dist+"'");
 ResultSet rs1=ps1.executeQuery();
 if(rs1.next()){
 ob.put("population",rs1.getString(1));
 }
 out.print(ob);

%>