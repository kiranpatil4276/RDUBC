<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@ include file = "header.jsp" %>

	<!--banner-starts-->
	<div class="banner">
		<section class="slider">
            <div class="flexslider">
                <ul class="slides">
					<li>
					<div class="banner1">
						<div class="container">
							
						</div>
					</div>
					</li>
					<li>
					<div class="banner2">
						<div class="container">
							
						</div>
					</div>
					</li>
					<li>
					<div class="banner3">
						<div class="container">
							
						</div>
					</div>
					</li>
					<li>
					<div class="banner4">
						
					</div>
					</li>
				</ul>
			</div>
		</section>
		
	</div>
	<!--banner-end-->
	<!--FlexSlider-->
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
	<!--End-slider-script-->
<!--welcome-->
<div class="welcome">
	<div class="container">
	
	
		<div class="col-md-9 welcome-middle wow fadeInUp animated" data-wow-delay=".5s" style="  border: 1px solid #D3D3D3; height:auto;">
		    <center>
		    <br>
		     <h4>PHOTO GALLERY</h4>
		     
		     <%try{
		    	 
		     Class.forName("com.mysql.jdbc.Driver");
				Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
				PreparedStatement stm2=conn2.prepareStatement("select image1,image2,image3,image4,image5 from gallery ");
		     ResultSet rs=stm2.executeQuery();
		     
		     while(rs.next()) {
		    	
		    	//out.print(s);
		    	 
		    	 
		   
		    	 %>
		    	
           
		  <img src="gallery/<%=rs.getString(1)%>" width="100" height="100">
		   			 <img src="gallery/<%=rs.getString(2)%>" width="100" height="100">
		    	   <img src="gallery/<%=rs.getString(3)%>" width="100" height="100"> 
		    	   <img src="gallery/<%=rs.getString(4)%>" width="100" height="100"> 
		    	   <img src="gallery/<%=rs.getString(5)%>" width="100" height="100"> 
		    	 <%}  }catch(Exception e){System.out.println(e);}
		     %> 




  <input type="button" class="btn btn-primary" value="Add More images +" style="float:left">
		     
		    
			<!-- <hr>
			<div class="row">
				<div class="col-md-12 col-xs-12 ">  
				<div class="col-xs-3">
				<img src="img/img2.jpg" style="height:100%;width:100%">
				</div>
				<div class="col-xs-3">
				<img src="img/img3.jpg" style="height:20%;width:80%">
				</div>
				<div class="col-xs-3">
				<img src="img/img4.jpg" style="height:20%;width:80%">
				</div>
				<div class="col-xs-3">
				<img src="img/img5.jpg" style="height:20%;width:80%">
				</div>
				</div>
			</div><br><hr>
			<div class="row">
				<div class="col-md-12 col-xs-12 ">
				<div class="col-xs-3">
				<img src="img/img6.jpg" style="height:20%;width:80%">
				</div>
				<div class="col-xs-3">
				<img src="img/img7.jpg" style="height:20%;width:80%">
				</div>
				<div class="col-xs-3">
				<img src="img/img8.jpg" style="height:20%;width:80%">
				</div>
				<div class="col-xs-3">
				<img src="img/img9.jpg" style="height:20%;width:80%">
				</div>
				</div>
			</div><br>
		</div> -->
		<div class="col-md-3 welcome-right wow fadeInRight animated" data-wow-delay=".5s"  style="   border: 1px solid #D3D3D3;  height:380px;">
		<center><h4><mark style="width:300px;">Gallery Categories</mark></h4>
		<h4><a href="#">Ration Card</a></h>
		<h4><a href="#">Events</a></h4>
		<h4><a href="#">Educational events</a></h4>
		<div class="news">
				<div class="form-group">
				<form action="#" method="post">
					<input type="text" name="search" class="form-control" placeholder="Search">
					<button type="submit" class="btn btn-default" aria-label="Left Align">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
					</form>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<%@ include file="footer.jsp" %>