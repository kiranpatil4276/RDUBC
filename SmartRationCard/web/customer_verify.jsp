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
            session.setAttribute("id", request.getParameter("id"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from register where id='" + request.getParameter("id") + "'");

                while (rs.next()) {

                    out.println("<tr>");

                    out.println("<td>");
                    out.print(rs.getString(1));
                    out.println("</td>");
                    session.setAttribute("zx", rs.getString(1));

                    out.println("<td>");
                    out.print(rs.getString(2));
                    out.println("</td>");
                    session.setAttribute("a", rs.getString(2));
                    out.println("<td>");
                    out.print(rs.getString(3));
                    out.println("</td>");
                    session.setAttribute("b", rs.getString(3));
                    out.println("<td>");
                    out.print(rs.getString(3));
                    out.println("</td>");
                    session.setAttribute("c", rs.getString(6));
                    out.println("<td>");
                    out.print(rs.getString(4));
                    out.println("</td>");
                    session.setAttribute("d", rs.getString(5));
                    out.println("<td>");
                    out.print(rs.getString(5));
                    out.println("</td>");
                    session.setAttribute("e", rs.getString(9));
                    out.println("<td>");
                    out.print(rs.getString(6));
                    out.println("</td>");
                    session.setAttribute("f", rs.getString(7));
                    out.println("<td>");
                    out.print(rs.getString(7));
                    out.println("</td>");
                    session.setAttribute("g", rs.getString(8));
                    out.println("<td>");
                    out.print(rs.getString(8));
                    out.println("</td>");
                    session.setAttribute("h", rs.getString(12));
                    out.println("<td>");
                    out.print(rs.getString(9));
                    out.println("</td>");
                    session.setAttribute("i", rs.getString(11));
                    out.println("<td>");
                    out.print(rs.getString(10));
                    out.println("</td>");
                    session.setAttribute("j", rs.getString(10));
                    out.println("<td>");
                    out.print(rs.getString(11));
                    out.println("</td>");
                    session.setAttribute("k", rs.getString(26));
                    out.println("<td>");
                    out.print(rs.getString(12));
                    out.println("</td>");
                    session.setAttribute("l", rs.getString(13));
                    out.println("<td>");
                    out.print(rs.getString(13));
                    out.println("</td>");
                    session.setAttribute("m", rs.getString(14));
                    out.println("<td>");
                    out.print(rs.getString(14));
                    out.println("</td>");
                    session.setAttribute("n", rs.getString(15));
                    out.println("<td>");
                    out.print(rs.getString(15));
                    out.println("</td>");
                    session.setAttribute("o", rs.getString(16));

                    out.println("<td>");
                    out.print(rs.getString(16));
                    out.println("</td>");
                    session.setAttribute("x", rs.getString(27));

                }
                response.sendRedirect("customer_verify2.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        %>

    </body>
</html>