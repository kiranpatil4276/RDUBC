<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.Database"%>



<%@ include file="header.jsp" %>
        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Add District</h2>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <div class="col-lg-12 col-md-10">
                    	<form action="add_district_ration" method="post" id="form">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Register New District
                            </div>
                            <div class="panel-body">
								<div class="row" id="service">
									<div class="col-md-8 col-md-offset-2">
									
									<label>Add District Name:</label>
										 <input type="text" class="form-control" name="name"  placeholder="Add District Name"> 
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
						   name:{
								required:true,
								pattern:/^[a-zA-Z]*$/
							}
						},
						messages: {
							
						}
						
			});
		});
</script> 
<%@ include file="footer.jsp" %>
