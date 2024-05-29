<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>

        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info">
                             <strong>Distribute Details</strong>
                        </div>
                            <div class="panel-body">
                  
								
								<div class="row">
									<div class="col-md-12">
									    <h4 style="color:#3b5998">See Distribute Details</h4>
									    <div class="form-group"><hr>
										   <table id="myTable" class="table table-striped table-bordered tabledata" style="overflow-x:auto;">
												<thead>
													<tr>
														<th>Sr.No</th>
														<th>Item Name</th>
														<th>Item Quantity</th>
														<!-- <th>Item Rate</th> -->
														<th>Item Unit</th>
														<th>Date</th>
													</tr>
												</thead>
												<tbody>
												<%
												Class.forName("com.mysql.jdbc.Driver");
												Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
												PreparedStatement ps=conn.prepareStatement("select * from admin_stock");
												ResultSet rs=ps.executeQuery();
												while(rs.next())
												{
									
												%>
												
												
												    <tr>
													     <td><%=rs.getInt(1) %></td>
													     <td><%=rs.getString(2) %></td>
													     <td><%=rs.getString(3) %></td>
													    <%--  <td><%=rs.getString(4) %></td> --%>
													     <td><%=rs.getString(5) %></td>
													     <td><%=rs.getString(6) %></td>
													</tr>
													<%} %>
												</tbody>
                                           </table>
										</div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>
                    
                </div>
				
				
             
                </div>
                <!-- /. ROW  -->
               
            </div>
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
<%@ include file="footer.jsp" %>
