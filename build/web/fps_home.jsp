<%@ include file = "header_fps.jsp" %>
<% response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>
<%
    if ((session.getAttribute("uname") == null) || (session.getAttribute("uname") == "")) {
        request.getSession().invalidate();
        response.sendRedirect("Login.jsp");
%>

<% } else {%>
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
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!--End-slider-script-->
<!--welcome-->
<div class="welcome">
    <div class="container">
        <center><a href="view_item_fps.jsp"><button class="btn btn-info">View Stock</button></a> &nbsp
            <a href="distribute_ff.jsp"><button class="btn btn-info">Distribute Stock</button></a>
              <a href="proceedrequest.jsp"><button class="btn btn-info">Customer Request</button></a>

        </center>
        <div class="clearfix"></div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<%}%>