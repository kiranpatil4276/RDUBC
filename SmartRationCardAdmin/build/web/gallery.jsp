<%@ include file="header.jsp" %>

        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h2>GALLERY</h2>
                    </div>
                </div>
                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <div class="col-lg-12 col-md-10">
                    <form action="AddGallery" method="post" id="form" enctype="multipart/form-data">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Insert Images
                            </div>
                            <div class="panel-body">
                                
								<div class="row">
									<div class="col-md-12">
									    <h4 style="color:#3b5998">Image</h4>
									    <div class="form-group"><hr>
									      <label>Gallery Category:</label>
									      <input type="text" name="category" class="form-control" >
									    </div>
									    <div class="form-group">
										  <label for="image">Choose Image 1:</label>
										  <input type="file" class="form-control" id="img" name="image1" style="line-height:2px;">
										  </div>
										  <div class="form-group">
										  <label for="image">Choose Image 2:</label>
										  <input type="file" class="form-control" id="img" name="image2" style="line-height:2px;">
										  </div>
										  <div class="form-group">
										  <label for="image">Choose Image 3:</label>
										  <input type="file" class="form-control" id="img" name="image3" style="line-height:2px;"><br>
										 </div>
										  <div class="form-group">
										  <label for="image">Choose Image 4:</label>
										  <input type="file" class="form-control" id="img" name="image4" style="line-height:2px;"><br>
										  </div>
										  <div class="form-group">
											 <label for="image">Choose Image 5:</label>
												<input type="file" class="form-control" id="img" name="image5" style="line-height:2px;"><br>
												</div>
												<input type="submit" class="btn btn-primary" value="Submit" style="float:right"><br><br>
										   <!-- <table id="myTable" class="table table-striped table-bordered tabledata" style="overflow-x:auto;">
												<thead>
													<tr>
														<th>Sr.No</th>
														<th>Image Name</th>
													</tr>
												</thead>
												<tbody>
												    <tr>
													     <td>01</td>
													     <td>img1.jpg</td>
													</tr>
												</tbody>
                                           </table> -->
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
	
</script> 
<%@ include file="footer.jsp" %>
