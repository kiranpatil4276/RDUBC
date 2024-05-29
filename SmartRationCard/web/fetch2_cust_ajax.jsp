<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="org.json.*"%>
<%@page import="java.sql.*"%>
<%

    String q1 = request.getParameter("q");
    System.out.println("**********");

    if ("".equals(q1)) {

    } else {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
            PreparedStatement ps = con.prepareStatement("Select * from add_item where id='" + q1 + "'");

            ResultSet rs = ps.executeQuery();

            JSONObject ven = new JSONObject();
            while (rs.next()) {

                ven.put("apl_rate", rs.getString(3));
                ven.put("bpl_rate", rs.getString(6));
                ven.put("unit", rs.getString(4));

            }
            out.print(ven);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

%>