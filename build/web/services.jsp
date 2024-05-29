<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
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
	     <marquee style="color:green"><b>New Service !!!</b></marquee><br><br><br>
		<div class="col-md-12  welcome-left wow fadeInLeft animated" data-wow-delay=".5s">
			<div class="container" style="text-align: justify;text-justify: inter-word;">
			<center>
			<h4><b>Our Services</b></b></h4>
			</center>
			<table class="table table-stripped table-responsive" style="color:black;align:center;overflow-x:scroll;">
			<thead>
			<tr>
			<th>Sr. No</th>
			<th>Service Name</th>
			<th>Service Description</th>
			<th>Service Criteria</th>
			<th>Service Valid Date</th>
			<th>Apply Now</th>
			</tr>
			</thead>
			<%
			Connection conn=Database.getConnection();
			PreparedStatement ps=conn.prepareStatement("select * from services");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
			
			%>
			
			<tbody>
			<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(6) %></td>
			<td><button class="btn btn-info">Click here ></button></td>
			</tr>
			</tbody>
			<%} %>
			</table>
			</div>
		</div>
		
		<div class="clearfix"></div>
	</div>
</div>
<%@ include file="footer.jsp" %>