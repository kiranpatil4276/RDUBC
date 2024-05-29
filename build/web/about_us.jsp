
<%@page import="java.io.OutputStream"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.Connection"%>


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
	
		<div class="col-md-6  welcome-left wow fadeInLeft animated" data-wow-delay=".5s">
			<div class="container" style="text-align: justify;text-justify: inter-word;">
			
			<%
			    
			    Connection conn = Database.getConnection();
			   PreparedStatement ps=conn.prepareStatement("select * from aboutus");
			   ResultSet rs=ps.executeQuery();
			  if(rs.next()) 
			  
			  { 
				  
				  rs.last();
				  
			%>
			
			<center>
			<h4><b><%=rs.getString(2) %></b></b></h4>
			
			
			<%=rs.getString(3) %>
		    <br></center>
		 
		     <div class="col-md-4 col-xs-8 welcome-left wow fadeInLeft animated" data-wow-delay="2s" style="width:150px;height:150px;background-image:url();margin-left:500px;background-repeat:no-repeat;background-size:cover;">
		    
		    </div><br><br> 
		   
		    
		    <img src="getimage.jsp?id=<%=rs.getInt(1) %>" width="300" height="300"> 
			 <%} %>
			</div><br>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<%@ include file="footer.jsp" %>