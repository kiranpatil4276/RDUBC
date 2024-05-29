<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>

        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Add Stock</h2>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <div class="col-lg-12 col-md-10">
                    	<form action="additem" method="post" id="form">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Add Item Stock
                            </div>
                            <div class="panel-body">
								<div class="row" id="service">
									<div class="col-md-8 col-md-offset-2">
										<div class="form-group">
										 <label>Select Item Name:</label>
										 <select class="form-control" id="item" name="item" onchange="getName()">
										 
										 <%
										 try{
										 Class.forName("com.mysql.jdbc.Driver");
								    	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");

										 PreparedStatement ps=con.prepareStatement("Select * from add_item");
										 ResultSet rs=ps.executeQuery();
										 
										 while(rs.next())
										 {
										 
										 
										 %>
										 
										 <option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
										<%} }catch(Exception e)
										{
											System.out.print(e);
										}
										%>
										 </select>					 
						 	</div>
						 	<div class="form-group">
						 <label>Quantity:</label>
										 <input type="text" class="form-control" value="" name="quantity" >
										</div>
										<div class="form-group">
										 <label>Unit:</label>
										 <input type="text" class="form-control" id="unit" value="" name="unit" readonly>
										  </div>
										<div class="form-group">
										 <label>Date:</label>
										 <input type="text" class="form-control" name="date" id="datepicker" readonly>
										 </div><br>
										 <input type="submit" class="btn btn-primary" value="Submit" style="float:right"><br>
									</div>
								</div>
                            </div>
                        </div>
                        </form> 
                    </div>
                   
                </div>
				
				
             
                </div>
                <!-- /. ROW  -->
               
            </div>
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
        <script type="text/javascript">
   
   
 /*   $("#file").filestyle({icon: false}); */
   
   
   function getName()
   {
   	var id = document.getElementById("item").value;

   	var url1 = 'stockjq.jsp?q='+id;
 
   	$.ajax({url:url1,dataType:'json',success:function(result){
   	
   		$("#rate").val($.trim(result.rate));
   		$("#unit").val($.trim(result.unit));

   		}
   	});
 
   }
 </script>
      <script>
		$.validator.setDefaults({
				submitHandler: function(form) {
					form.submit();
				}
			});
		$(document).ready(function() {
					$("#form").validate({
					   rules:{
						   item:{
								required:true
							},
							quantity:{
					            required:true,
					            digits:true
							},
							date:{
								required:true
							}
						},
						messages: {
							img1:{
								extension:"Enter only .jpg or .png image"
							}
							
						}
						
			});
		});
		
</script>
<%@ include file="footer.jsp" %>
