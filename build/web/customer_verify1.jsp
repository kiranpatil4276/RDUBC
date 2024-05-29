<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%            response.setHeader("Cache-Control","no-store");
                response.setHeader("Pragma","no-cache");
                 response.setDateHeader ("Expires", 0);%>
                 <%
    if ((session.getAttribute("uname") == null) || (session.getAttribute("uname") == "")) {
    	request.getSession().invalidate();
    	response.sendRedirect("Login.jsp");
%>

<% } else
{%>
<title>Smart Ration Card System | Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Baby Care Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/additional-methods.js"></script>
<script>
		$.validator.setDefaults({
				submitHandler: function(form) {
					form.submit();
				}
			});
		$(document).ready(function() {
					$("#Form").validate({
					   rules:{
						   card_type:{
								required:true
							},
							status:{
								required:true
							},
							officer:{
								required:true
							}
						},
						messages: {
						}
						
			});
		});
		
</script>
<style>
	p {
    padding: 7px 0 7px 0;
    font-weight: 500;
    font-size: 10pt;
}
a {
    color: #656565;
    text-decoration:none;
}
a:hover{
    color: #abda0f;
    text-decoration: none;
}
h1 {
    font-weight:200;
    color: #888888;
    font-size:16pt;
    background: transparent url(../img/h1.png) no-repeat center left;
    padding-left:33px;
    margin:7px 5px 8px 8px;
}
h4 {
    padding:1px;
    color: #ACACAC;
    font-size:9pt;
    font-weight:100;
    text-transform:uppercase;
}
form.register{
    height:auto;
    background-color:#fff;
	text-align: center;
    -moz-border-radius:20px;
    -webkit-border-radius:20px;
}
form p{
    font-size: 8pt;
    clear:both;
    margin: 0;
    color:gray;
    padding:10px;
}
form.register .infobox{
    float:right;
    margin-top:20px;
    border: 1px solid #F1F1F1;
    padding:5px;
    width:380px;
    height:98px;
    font-size:9px;
    background: #FDFEFA url(../img/bg_infobox.gif) repeat-x top left;
}
form.register legend
{
    color: #abda0f;
    padding:5px;
    font-weight:bold;
    font-size: 20px;
    font-weight:100;
}
form.register label{
    color:#444;
    width:204px;
    float: left;
    text-align: right;
    margin-right: 6px;
    margin-top:2px;
}
form.register label.optional{
    float: left;
    text-align: right;
    margin-right: 6px;
    margin-top:2px;
    color: #A3A3A3;
}
form.register input{
    width: 153px;
    color: #505050;
    float: left;
    margin-right: 5px;
}
form.register input.long{
    width: 247px;
    color: #505050;
}
form.register input.short{
    width: 40px;
    color: #505050;
}
form.register input[type=radio]
{
    float:left;
    width:15px;
}
form.register label.gender{
    margin-top:-1px;
    margin-bottom:2px;
    width:34px;
    float:left;
    text-align:left;
    line-height:19px;
}
form.register input[type=text],input[type=password],input[type=number],select
{
    border: 1px solid #E1E1E1;
    height: 31px;
}
form.register input[type=text].year
{
    border: 1px solid #E1E1E1;
    height: 18px;
    width:30px;
}
form.register input[type=checkbox] {
    width:14px;
    margin-top:4px;
}
form.register select
{
	width: 153px;
    float:left;
    margin-bottom:3px;
    color: #505050;
    margin-right:5px;
}
form.register select.date
{
    width: 40px;
}
.button
{
    background: #abda0f url(../img/overlay.png) repeat-x;
    padding: 8px 10px 8px;
    color: #fff;
    text-decoration: none;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
    text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
    cursor: pointer;
    float:left;
    font-size:18px;
    margin:90px;
	margin-left:140px;
}
input:focus, select:focus{
    background-color: #efffe0;
}
p.info{
    font-size:7pt;
    color: gray;
}
p.agreement{
    margin-left:15px;
}
p.agreement label{
    width:390px;
    text-align:left;
    margin-top:3px;
}
</style>
</head>
<body>
<!--header-top-->
	<div class="header-top">
		<div class="container">
			<div class="head-main">
				
				<div class="col-md-6 head- animated wow fadeInDown animated animated" data-wow-duration="1200ms" data-wow-delay="500ms" >
					<h1 style="font-size:20pt;"><img src="images/india.png" height="08%" width="11%" style="margin-top:-20px;"/>&nbsp <a href="index.html">Smart Ration Card System</a></h1>
				</div>
				<div class="col-md-6 head-left wow fadeInRight animated" data-wow-delay=".5s">
                    <a href="Login.jsp"><i class="fa fa-user fa-lg"></i>Sign out</a> &nbsp
					<!-- <a href="register1.jsp"><i class="fa fa-user fa-lg"></i>Sign Up</a> -->					
					<!--<ul>
						<li><a href="#"><span class="fb"> </span></a></li>
						<li><a href="#"><span class="twit"> </span></a></li>
						<li><a href="#"><span class="pin"> </span></a></li>
						<li><a href="#"><span class="rss"> </span></a></li>
					</ul>-->
				</div>
				<div class="clearfix"></div>
				
			</div>
		</div>
	</div>
	<!--header-top-->
	<!--navigation-starts-->
	<div class="navigation animated " data-wow-duration="1200ms" data-wow-delay="500ms" style="background-color:skyblue;">
		<span class="menu"></span> 
			<ul class="navig cl-effect-16">
				<!--  <li><a href="index.jsp">Home</a></li>
				<li><a href="about_us.jsp">About US</a></li>
				<li><a href="services.jsp">Services</a></li>
				<li><a href="gallery.jsp">Gallary</a></li>
				<li><a href="contact.jsp">Contact</a></li>-->
			</ul>
	</div>
	<!--navigation-end-->
	<!--script-for-menu-->
		<script>
			$("span.menu").click(function(){
				$(" ul.navig").slideToggle("slow" , function(){
				});
			});
		</script>
	<!--script-for-menu-->
	<div class="container-fluid" style="background-color:gray; height:auto;">
	
	 
		 <form action="update" class="register col-md-8 col-md-offset-2" method="post" id="Form">
            <h1 class="text-center" style="font-size:20pt;">Registration</h1>
            <fieldset class="row">
                <legend>Personal Details</legend>
                <div class="form-group">
                	<div class="row">
                	<% 
                	ResultSet vlgRs = null;
                //String id1=session.getAttribute("uid").toString(); 
                	String id1=request.getParameter("id");
                	String village = request.getParameter("village");
               try{ Class.forName("com.mysql.jdbc.Driver");  
			      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
				 Statement stmt=con.createStatement(); 
				 ResultSet rs=stmt.executeQuery("select * from register where id='"+id1+"'");
				 PreparedStatement vlg = con.prepareStatement("select * from users where village='"+village+"'");
				 vlgRs = vlg.executeQuery();
				 
				 while(rs.next()){	%>
                	    <div class="col-md-12">
                	    <input type="hidden" name="id" value="<%=rs.getString(1) %>">
                	   <%
													HttpSession session1 = request.getSession();
																session1.setAttribute("uid", rs.getInt(1));
												%> 
	                    <label class="control-label col-md-2">Name :</label>
	                    <input type="text" name="name" style="width:520px" value=" <%=rs.getString("name") %>" class="form-control col-md-6" placeholder="Enter Name" readonly/>
                        
                        </div>
                   </div>
                </div>
                <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
			                    <label class="control-label col-md-2">Contact Number :</label>
			                    <input type="text" class="form-control col-md-4" name="contact" value=" <%=rs.getString("mob") %>" readonly/>
			                    <label class="control-label col-md-2">Income :</label>
							    <input type="text" class="form-control col-md-3" name="zip" value=" <%=rs.getString("zip") %>" readonly/>
			              </div>
			         </div>
			    </div>
             
                <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
							<label class="control-label col-md-2">AdharCard No. :</label>
							<input type="text" class="form-control col-md-3" name="adhar" value=" <%=rs.getString("adhar") %>" readonly/>
							<label class="control-label col-md-2">Address :</label>
				            <input type="text" class="form-control col-md-3" name="addr" value=" <%=rs.getString("addr") %>" readonly/>
						</div>
				    </div>
				</div>
				    <div class="form-group">
                	<div class="row">
             
                	    <div class="col-md-12">
			                <label class="control-label col-md-2">Birthdate :</label>
			                <input type="text" class="form-control col-md-3" name="dob" value=" <%=rs.getString("dob") %>" readonly/>
			                
			                <label class="control-label col-md-2">Age :</label>
			                <input type="text" class="form-control col-md-3" name="age" value=" <%=rs.getString("age") %>" readonly/>
			            </div>
			         </div>
			         </div>
			          <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
                	                <label class="control-label col-md-2">State :</label>
		                            <input type="text" class="form-control col-md-3" name="dist" value=" <%=rs.getString("state") %>" readonly/>
									<label class="control-label col-md-2">Dist :</label>
									<input type="text" class="form-control col-md-3" name="tal" value=" <%=rs.getString("dist") %>" readonly/>
									
					     </div>
					  </div>
				</div>
				 <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
		                    <label class="control-label col-md-2">Tal :</label>
		                    <input type="text" class="form-control col-md-3" name="state" value=" <%=rs.getString("tal") %>" readonly/>
		                    <label class="control-label col-md-2">Village :</label>
				             <input type="text" class="form-control col-md-3" name="vlg" value=" <%=rs.getString("village") %>" readonly/>

					</div>
				   </div>
				</div>
				<div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
		                    <label class="control-label col-md-2">Gender :</label>
		                    <input type="text" class="form-control col-md-3" name="gender" value=" <%=rs.getString("gender") %>" readonly/>

		                    <label class="control-label col-md-2">Caste :</label>
		                    <input type="text" class="form-control col-md-3" name="cast" value=" <%=rs.getString("cast") %>" readonly/>
						</div>
				   </div>
				</div>
				 <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
								<label class="control-label col-md-2">Pin Code :</label>
								<input type="text" class="form-control col-md-3" name="zip" value=" <%=rs.getString("zip") %>" readonly/>
								<label class="control-label col-md-2">Family Members :</label>
								<input type="text" class="form-control col-md-3" name="member" value=" <%=rs.getString("member") %>" readonly/>
			              </div>
			           </div>
			           
			           
			  
			           
			           
			     </div>
			     
			     
			     
			                  <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
	                    <label class="control-label col-md-2">Email:</label>
	                    <input type="text" name="email" style="width:520px" value=" <%=rs.getString("email") %>" class="form-control col-md-6" readonly/>
                        
                        </div>
                   </div>
                </div>
			     <%
			     ServletContext context=getServletContext();
					String filePath=context.getInitParameter("file-upload");
			     %>
			     <br><br><legend>Uploaded Documents:</legend>
				 <div class="form-group">
                	<div class="row">
                	    <div class="col-md-4">
								<label class="control-label col-md-4">Aadhar card upload :</label>
								<a href="view.jsp?path=<%="image/"+rs.getString("adhar1_image") %>">View</a>					
			            </div>
			            <div class="col-md-4">
								<label class="control-label col-md-4">Address Proof upload :</label>
								<a href="view.jsp?path=<%="image/"+rs.getString("addr_image") %>">View</a>						
			            </div>
			            <div class="col-md-4">
								<label class="control-label col-md-4">Fingerprint upload :</label>
			           			<a href="view.jsp?path=<%="image/"+rs.getString("finger_image") %>">View</a>		
                        </div>
			        </div><br>
            </fieldset>
            <fieldset class="row">
                <legend>Family Details</legend>
            <%     try{ Class.forName("com.mysql.jdbc.Driver");  
			      Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
				 Statement stmt1=con1.createStatement(); 
				 ResultSet rs1=stmt1.executeQuery("select * from mem_reg where id='"+id1+"'");
				 
				 while(rs1.next()){	%>
                <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
	                    <label class="control-label col-md-2">Name :</label>
	                    <input type="text" name="name"  class="form-control col-md-6" style="width:520px" value=" <%=rs1.getString(2) %>" readonly/>
                        </div>
                   </div>
                </div>
				<div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
			                    <label class="control-label col-md-2">Birthdate :</label>
			                    <input type="text" class="form-control col-md-4" name="dob" value=" <%=rs1.getString(4) %>" readonly/>
			                    <label class="control-label col-md-2">Age :</label>
			                    <input type="text" class="form-control col-md-4" name="age" value=" <%=rs1.getString(3) %>" readonly/>
			              </div>
			         </div>
			    </div>
				<div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
		                    <label class="control-label col-md-2">Gender </label>
		                    <input type="text" class="form-control col-md-4" name="gender" value=" <%=rs1.getString(5) %>"  readonly/>
							<label class="control-label col-md-2">Relation </label>
		                    <input type="text" class="form-control col-md-4" name="relation" value=" <%=rs1.getString(6) %>" readonly/>
						</p>
					</div>
				   </div>
				</div>
				<div class="form-group">
                	<div class="row">
                	    <div class="col-md-6">
								<label class="control-label col-md-4">Aadhar card upload :</label>
								<a href="view.jsp?path=<%="image/"+rs1.getString(8) %>">View</a>				
			            </div>
			            <div class="col-md-6">
								<label class="control-label col-md-4">Fingerprint upload :</label>
								<a href="view.jsp?path=<%="image/"+rs1.getString(7) %>">View</a>				
			              </div>
			           </div>
			     </div><br><hr>
			    <% }}catch(Exception er){
			    System.out.println(er);
			    }
			    %> 
				<div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
                	        <label class="control-label col-md-2">Ration Card Type </label>
                            <select name="card_type">                              
		                    <option value="APL">APL</option>
		                    <option value="BPL">BPL</option>
		                    </select>		                    
		                    <label class="control-label col-md-2">Status </label>
		                    <select name="status">
		                    <option value="1">Enable</option>
		                    <option value="0">Disable</option>
		                    </select>
							
						</p>
					</div>
				   </div>
				</div>
				<%   }
		                    
		             }catch(Exception e)
						 	 	{
						 	 		System.out.println(e);
						 	 	}%>
			
				<br>
				<!-- <div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
		                    <label class="control-label col-md-2">Upload Fingerprint *</label>
		                    <input type="file" class="form-control col-md-4" name="fingerprint" style="width:259px"/>
						</p>
					</div>
				   </div> -->
				   <div class="col-md-4">
		                        <div class="form-group">
									     <label>FPS Officer:</label>
										 
										<%
										if(vlgRs.next()){
											
										 %>
												<input type="text" name="officer" value="<%=vlgRs.getString(3)%>">										  
										<%}
										else{
										%>
										<input type="text" name="officer" value="">
										<%	
										}
										%> 
										
			                    </div>
		                    </div>
		
			
	
			
			<!-- 	<div class="form-group">
                	<div class="row">
                	    <div class="col-md-12">
                	        <label class="control-label col-md-2">Select FPS </label>
                            <select name="card_type">
		                    <option value=""></option>
		                    </select>	
						</p>
					</div>
				   </div>
				</div> -->
				<br>
				</div>-->
            </fieldset>
			<fieldset id="member">
			</fieldset>
			<fieldset style="margin-bottom:5px;">
			<div class="row">
                <div class="col-md-6 col-md-offset-5">
                
                
                
                <input type="submit" class="btn btn-info" id="submit" value="submit"> 
              
		                    
		      
                  </form>
					
				</div>
				
			</div>
			</fieldset>
			
			
      
	</div>
	<style>
	.error{
	color:red;
	}
	</style>

    </script>
	<!--JS for animate-->
	<script src="js/wow.min.js"></script>
		<script>
			new WOW().init();
		</script>
	<!--//end-animate-->
</body>
<%} %>
</html>