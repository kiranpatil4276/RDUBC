<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
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
            // String category = request.getParameter("category");

            String name = request.getParameter("name");

            String password = request.getParameter("pass");
            String colorcode = request.getParameter("red").trim();
            //  out.print(category);
            try {
                Connection conn = Database.getConnection();

                PreparedStatement ps = conn.prepareStatement("select *from register where email2='" + name + "' and password='" + password + "' and colorcode='"+colorcode+"' ");
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    session.setAttribute("pass", rs.getString(4));
                     session.setAttribute("village", rs.getString("village"));
                    session.setAttribute("uname", rs.getString(2));
                    session.setAttribute("uid", rs.getInt(1));
                    /* RequestDispatcher rd=request.getRequestDispatcher("customer_home.jsp");
        rd.forward(request, response); */
                    response.sendRedirect("customer_home.jsp");

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("Login_1.jsp");
                    rd.include(request, response);%>
        <script>
            alert("unable to Login");
        </script>
        <%

                }

            } catch (Exception e) {
                System.out.println(e);
            }
        %>



    </body>

</html>