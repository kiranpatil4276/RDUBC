<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>


<%@ include file = "header.jsp" %>
	<!--banner-starts-->
	<div class="banner">
		<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" style="width:1150px;" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
<% response.setHeader("Cache-Control","no-cache");
                   response.setHeader("Cache-Control","no-store");
                response.setHeader("Pragma","no-cache");
                 response.setDateHeader ("Expires", 0);
                 
                 session.setAttribute("uname",null);
                 request.getSession().invalidate();
                 
                 %>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/1.jpg" alt="Chania" width="460" height="345">
      </div>

      <div class="item">
        <img src="images/2.jpg" alt="Chania" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="images/3.jpg" alt="Flower" width="460" height="345">
      </div>

      <div class="item">
        <img src="images/4.jpg" alt="Flower" width="460" height="345">
      </div>
           
      <%try{
		    	 
		     Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
				PreparedStatement stm=conn.prepareStatement("select image1, image2,image3 from imagecheck ");
		     ResultSet rs=stm.executeQuery();
		     
		     while(rs.next()) {
		    	
		    	//out.print(s);
		    	 
		    	 
		   
		    	 %>
		    	
           
		 <div class="item">  <img src="home_img/<%=rs.getString(1)%>" width="100" height="100"> </div>
		  <div class="item"> <img src="home_img/<%=rs.getString(2)%>" width="100" height="100"> </div>
		  <div class="item"> <img src="home_img/<%=rs.getString(3)%>" width="100" height="100"> 	 </div>		 
		    	 <%}  }catch(Exception e){out.print(e);}
		     %> 
      
      
      
      
      
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

		
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
	
		<div class="col-md-3  welcome-left wow fadeInLeft animated" data-wow-delay=".5s" style="width:400px; margin-left:-20px;">
			<div class="container1" style=" height:380px;  border: 1px solid #D3D3D3;; margin-left:10px;">
			<center>
			<h4 ><mark style="width:300px;">  -: Important Info. :-  </mark></h4>
			<h4 style="fint-size:0.6em;">Area: 50000 sq.ft</h4><hr>
			<h4  style="fint-size:0.6em;">Population:80,000</h4><hr>
			<h4  style="fint-size:0.6em;">Literacy: 80%</h4><hr>
			<h4  style="fint-size:0.6em;">Male: 40,000</h4><hr>
			<h4 style="fint-size:0.6em;">Female: 40,000</h4>
			
			<%try{
		    	 
		     Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
				PreparedStatement stm=conn.prepareStatement("select info_heading,info_content from imagecheck ");
		     ResultSet rs=stm.executeQuery();
		     
		     while(rs.next()) {
		    	
		    	   	out.println(rs.getString(1));
		    	out.print(rs.getString(2));
		    	 
		    	 
		    
		    	 %>
		    	
 			
		    	 <%}  
		     }catch(Exception e){System.out.println(e);}
			 %>
			
			
			
			</div>
		</div>
		<div class="col-md-6 welcome-middle wow fadeInUp animated" data-wow-delay=".5s" style="  border: 1px solid #D3D3D3; height:380px; margin-left:-110px;">
		    <center>
		    <br>
		     Click here for registering New Ration Card <a href="register1.jsp"><button class="btn btn-success"> Register Now >>> </button></a>
			<br><br>
			<hr>
			<h5>Notices & Offers</h5>
			
			
			</center>
			<ul>
			<marquee behavior="scroll" direction="left" onmouseover="this.setAttribute('scrollamount', 3, 0);" onmouseout="this.setAttribute('scrollamount', 8, 0);"><li>New Top Services & News <a href=""><img src="img/new.gif"></a></li></marquee>
			<marquee behavior="scroll" direction="left" onmouseover="this.setAttribute('scrollamount', 3, 0);" onmouseout="this.setAttribute('scrollamount', 8, 0);"><li>New Top Services & News <a href=""><img src="img/new.gif"></a></li></marquee>
			<%try{
		    	 
		     Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard","root","root");
				PreparedStatement stm=conn.prepareStatement("select notice_heading,notice_content from imagecheck ");
		     ResultSet rs=stm.executeQuery();
		     
		     while(rs.next()) {
		    	
		    	   	out.println(rs.getString(1));
		    	out.print(rs.getString(2));
		    	 
		    	 
		    
		    	 %>
		    	
 			
		    	 <%}  }catch(Exception e){out.print(e);}
			 %>
			
			</ul>
		</div>
		<div class="col-md-3  welcome-right wow fadeInRight animated" data-wow-delay=".5s"  style="   border: 1px solid #D3D3D3;  height:380px; margin-left:2px;">
		<center><h4><mark style="width:300px;">  -: Uploads :-  </mark></h4>
		<h4 style="higth:100px;">Uploaded Documents<a href="#"> Link 1</a></h4>
		
		
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