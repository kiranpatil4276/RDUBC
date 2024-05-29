<%@page import="jdbc.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>

        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>Registration Details</strong>
                        </div>
                    </div>
                </div>                
                  <!-- /. ROW  --> 
				  
				<div class="row">
                    <div class="col-lg-12 col-md-12">
                        <table class="table table-responsive table-striped table-bordered table-hover" style="">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Name</th>
                                     <th>Category</th>
                                    <th>Email_id</th>
                                    <th>Contact</th>
                                    <th>DOB</th>
                                    <th>Gender</th>
                                    <th>Taluka</th>
                                    <th>Dist</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <%
												Connection conn = Database.getConnection();
												PreparedStatement ps=conn.prepareStatement("select * from users");
												ResultSet rs=ps.executeQuery();
												while(rs.next())
												{
									
												%>
                                <tr>
                                    <td><%=rs.getInt(1) %></td>
                                    <td><%=rs.getString(3) %></td>
                                     <td><%=rs.getString(2) %></td>
                                     <td><%=rs.getString(4) %></td>
                                    <td><%=rs.getString(5) %></td>
                                    <td><%=rs.getString(6) %></td>
                                    <td><%=rs.getString(7) %></td>
                                    <td><%=rs.getString(9) %></td>
                                    <td><%=rs.getString(8) %></td>
                                  
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
<%@ include file="footer.jsp" %>
