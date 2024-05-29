<%@ include file = "header.jsp" %>

	<!--script-for-menu-->
	<div class="reg" style="background-color:gray; height:504px;">
	    <br>
		 <form action="Feedback" class="register" method="post">
            <fieldset class="row1">
                <legend>Feedback Form
                </legend>
              <div class="col-md-12">
                  <div class="row">

		            <div class="form-group">
                	<div class="row">
                	    <div class="col-md-11 col-md-offset-2">
							<p><label>Name *</label>
							<input type="text" name="name" placeholder="Name"/>
							<label>Contact No</label>
							<input type="text" name="contact" placeholder="Contact No."/></p>
						</div>
				    </div>
				   </div>
				    <div class="form-group">
                	<div class="row">
                	    <div class="col-md-11 col-md-offset-2">
							  <p> 
			                    <label>Email *
			                    </label>
			                    <input type="text" name="email" placeholder="Email"/>
			                    <label >Subject *
			                    </label>
			                    <input type="text" name="subject" placeholder="Subject"/>
			                </p>
			              </div>
			         </div>
			         </div>
			         <div class="form-group">
                	<div class="row">
                	    <div class="col-md-11 col-md-offset-2">
							  <p> 
			                    <label>Feedback *
			                    </label>
			                    <textarea name="message" style="width:450px;" placeholder="Write your feedback here..."/></textarea>
			                </p>
			              </div>
			         </div>
			         </div>
		            </div>
                </div>
            </fieldset>
            
            <button class="btn btn-info" style="margin-left:600px" id="add">Submit</button> 
            </div>
        </form>

	</div>
	<%@ include file="footer.jsp" %>