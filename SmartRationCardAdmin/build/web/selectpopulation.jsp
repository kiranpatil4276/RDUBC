
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
<%
String dis=request.getParameter("dis");
String dist="";

Connection con=Database.getConnection();
 PreparedStatement ps=con.prepareStatement("select sum(member) from register where dist='"+dis+"'");
ResultSet rs=ps.executeQuery();

if(rs.next())
{   
String member=rs.getString(16);
int i=Integer.parseInt(member);
     JSONObject ob=new JSONObject();
	ob.put("population",i );
    out.print(ob);
}
 

 /* PreparedStatement ps1=con.prepareStatement("select sum(member) from register where dist='"+dist+"'");
 ResultSet rs1=ps1.executeQuery();
 JSONObject ob1=new JSONObject();
 ob1.put("population",rs1.getString("member")); */

%>