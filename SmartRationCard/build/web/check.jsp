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
            String category = request.getParameter("category");

            String name = request.getParameter("name");

            String password = request.getParameter("pass");
            out.print(category);
            try {
                Connection conn = Database.getConnection();

                if (category.equals("fps")) {

                    PreparedStatement ps = conn.prepareStatement("select *from users where email='" + name + "' and password='" + password + "' and category='fps'");
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        session.setAttribute("uname", rs.getString(3));
                        session.setAttribute("uid", rs.getInt(1));
                        session.setAttribute("PRN",rs.getInt(1));
                        session.setAttribute("village", rs.getString("village"));
                        /* RequestDispatcher rd=request.getRequestDispatcher("fps_home.jsp");
                                                rd.forward(request, response); */
//                       
                        session.setAttribute("page","fps_home.jsp");
                         response.sendRedirect("AddImageDt");

                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                        rd.include(request, response);
        %>
        <script>
            alert("unable to Login");
        </script>
        <%
            }

        } else if (category.equals("taluka")) {

            PreparedStatement ps = conn.prepareStatement("select *from users where email='" + name + "' and password='" + password + "' and category='taluka'");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("uname", rs.getString(3));
                session.setAttribute("uid", rs.getInt(1));
                session.setAttribute("taluka", rs.getString(9));
                session.setAttribute("PRN",rs.getInt(1));
                /* RequestDispatcher rd=request.getRequestDispatcher("taluka_home.jsp");
        rd.forward(request, response); */
//                response.sendRedirect("taluka_home.jsp");
                session.setAttribute("page","taluka_home.jsp");
                response.sendRedirect("AddImageDt");

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);%>
        <script>
            alert("unable to Login");
        </script>
        <%

            }

        } else if (category.equals("dist")) {

            PreparedStatement ps = conn.prepareStatement("select *from users where email='" + name + "' and password='" + password + "' and category='dist'");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("uname", rs.getString(3));
                session.setAttribute("uid", rs.getInt(1));
                session.setAttribute("district", rs.getString(8));
                session.setAttribute("PRN",rs.getInt(1));
                /*  RequestDispatcher rd=request.getRequestDispatcher("district_home.jsp");
        rd.forward(request, response); */
//                response.sendRedirect("district_home.jsp");
                session.setAttribute("page","district_home.jsp");
                response.sendRedirect("AddImageDt");

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);%>
        <script>
            alert("unable to Login");
        </script>
        <%

            }

        } else if (category.equals("customer")) {

            PreparedStatement ps = conn.prepareStatement("select *from register where name='" + name + "' and password='" + password + "' ");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                session.setAttribute("pass", rs.getString(4));
                session.setAttribute("uname", rs.getString(2));
                session.setAttribute("uid", rs.getInt(1));
                session.setAttribute("PRN",rs.getInt(1));
                /* RequestDispatcher rd=request.getRequestDispatcher("customer_home.jsp");
        rd.forward(request, response); */
//                response.sendRedirect("customer_home.jsp");
                session.setAttribute("page","customer_home.jsp");
                response.sendRedirect("AddImageDt");

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);%>
        <script>
            alert("unable to Login");
        </script>
        <%

                    }

                }

            } catch (Exception e) {
                System.out.println(e);
            }
        %>



    </body>

</html>