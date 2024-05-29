<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import="org.json.*"%>
<%@page import="java.sql.*"%>
<%
   // String village = session.getAttribute("village").toString();
    String q1 = request.getParameter("q");
    System.out.println(q1);

    if ("".equals(q1)) {

    } else {

        try {
            System.out.print("hey guyz");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
            PreparedStatement ps = con.prepareStatement("Select * from register where rationcard='" + q1 + "'");

            ResultSet rs = ps.executeQuery();

            JSONObject ven = new JSONObject();
            while (rs.next()) {

                ven.put("name", rs.getString(2));
                ven.put("card", rs.getString("cardtype"));
                //ven.put("member", rs.getString(23));
            }
            out.print(ven);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

%>