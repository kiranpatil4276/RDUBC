<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>

        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Add Item</h2>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <div class="col-lg-12 col-md-10">
                    	<form action="add.jsp" method="post" id="form">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Add Item
                            </div>
                            <div class="panel-body">
								<div class="row" id="service">
									<div class="col-md-8 col-md-offset-2">
									<div class="form-group">
									<label>Item Name:</label>
										 <input type="text" class="form-control" name="item">
										</div>
										<div class="form-group">
										 <label>Rate Apl:</label>
										 <input type="text" class="form-control" value="" name="rate_apl" >
										  </div>
										  <div class="form-group">
										  <label>Rate Bpl:</label>
										 <input type="text" class="form-control" value="" name="rate_bpl" >
										 </div>
										  <div class="form-group">
										 <label>Unit:</label>
										 <input type="text" class="form-control" value="" name="unit" >
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
								required:true,
								pattern:/^[A-Za-z\s]*$/
							},
							rate_apl:{
					            required:true,
					            number:true
							},
							rate_bpl:{
					            required:true,
					            number:true
							},
							unit:{
								required:true,
								pattern:/^[A-Za-z\s]*$/
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
