
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>

        <%
            if (session != null) {
                session.invalidate();
            }
            out.println("<script>");
            out.println("alert('Logout Successfully');");
            out.println("location='Index.jsp'");
            out.println("</script>");
        %>

    </body>
</html>
