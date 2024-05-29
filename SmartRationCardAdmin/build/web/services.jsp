<%@ include file="header.jsp" %>

        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Services</h2>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <div class="col-lg-12 col-md-10">
                     <form action="addServices" method="post" id="form">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Insert Services
                            </div>
                            <div class="panel-body">
								<div  id="service">
									<div class="form-group">
										 <label>Service heading:</label>
										 <input type="text" class="form-control" name="heading">
									</div>
									<div class="form-group">
										 <label>Service Description:</label>
										 <input type="text" class="form-control" name="desc"> 
									</div>
									<div class="form-group">
										 <label>Service Criteria:</label>
										 <input type="text" class="form-control" name="criteria">
									</div>
									<div class="form-group"> 
										 <label>Add Date:</label>
										 <input type="text" class="form-control" name="add_date" id="datepicker1" readonly>
									</div>
									<div class="form-group">
										 <label>Valid Date:</label>
										 <input type="text" class="form-control" name="valid_date" id="datepicker" readonly> <br>
									</div>
										 <input type="submit" class="btn btn-primary" value="Submit" style="float:right"><br>
										<div class="form-group"><hr>
										<table id="myTable" class="table table-striped table-bordered tabledata" style="overflow-x:auto;">
												<thead>
													<tr>
														<th>Sr.No</th>
														<th>Service heading</th>
														<th>Service content</th>
														<th>Add Date</th>
														<th>Valid Date</th>
													</tr>
												</thead>
												<tbody>
												    <tr>
													     <td>01</td>
													     <td>Payment</td>
													     <td>Payment</td>
													     <td>20 Feb 2017</td>
													     <td>20 Mar 2017</td>
													</tr>
												</tbody>
                                           </table>
										</div>
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
						   heading:{
								required:true
							},
							desc:{
								required:true
                            },
                            criteria:{
                            	required:true
                            },
                            add_date:{
                            	required:true
                            },
                            valid_date:{
                            	required:true
                            }
						},
						messages: {
							
						}
						
			});
		});
		
</script> 


<%@ include file="footer.jsp" %>
