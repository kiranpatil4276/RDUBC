
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.Database"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
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
        <script src="js/jquery.min.js"></script>
        <!--JS for animate-->
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
        <script src="js/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
        <!--//end-animate-->
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
                width:900px;
                margin: 20px auto 0px auto;
                height:auto;
                background-color:#fff;
                padding:5px;
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
            form.register fieldset.row2
            {
                border-top:1px solid #F1F1F1;
                width:770px;
                height:340px;
                padding:5px;
                float:left;
            }
            form.register fieldset.row3
            {
                border-top:1px solid #F1F1F1;
                padding:5px;
                float:left;
                margin-bottom:15px;
                width:770px;
            }
            form.register fieldset.row4
            {
                border-top:1px solid #F1F1F1;
                border-right:1px solid #F1F1F1;
                padding:5px;
                float:left;
                clear:both;
                width:500px;
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
                padding:2px;
                margin-left: 14px;
                font-weight:bold;
                font-size: 20px;
                font-weight:100;
            }
            form.register label{
                color:#444;
                width: 118px;
                float: left;
                text-align: right;
                margin-right: 9px;
                margin-top:2px;
            }
            form.register label.optional{
                float: left;
                text-align: right;
                margin-right: 6px;
                margin-top:2px;
                color: #A3A3A3;
            }
            form.register label.obinfo{
                float:right;
                padding:3px;
                font-style:italic;
            }
            form.register input{
                width: 186px;
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
            form.register input[type=text]
            {
                border: 1px solid #E1E1E1;
                height: 36px;
            }
            form.register input[type=password]
            {
                border: 1px solid #E1E1E1;
                height: 18px;
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
                border: 1px solid #E1E1E1;
                width: 130px;
                float:left;
                margin-bottom:3px;
                color: #505050;
                margin-right:5px;
            }
            form.register select.date
            {
                width: 40px;
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
                    <div class="clearfix"></div>

                </div>
            </div>
        </div>
        <!--header-top-->
        <!--navigation-starts-->

        <div class="navigation animated " data-wow-duration="1200ms" data-wow-delay="500ms" style="background-color:skyblue;">
            <span class="menu"></span> 
            <ul class="navig cl-effect-16">
                <li><a href="district_home.jsp">Home</a></li>
                <li><a href="view_taluka_district.jsp">Taluka</a></li>
                <li><a href="view_fps_district.jsp">FPS</a></li>
            </ul>
        </div>
        <!--navigation-end-->
        <!--script-for-menu-->
        <script>
            $("span.menu").click(function () {
                $(" ul.navig").slideToggle("slow", function () {
                });
            });
        </script>
        <!--script-for-menu-->

        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info">
                            <strong>Distribute Details</strong>
                        </div>
                        <div class="panel-body">


                            <div class="row">
                                <div class="col-md-12">
                                    <h4 style="color:#3b5998">See Distribute Details</h4>
                                    <div class="form-group"><hr>
                                        <table id="myTable" class="table table-striped table-bordered tabledata" style="overflow-x:auto;">
                                            <thead>
                                                <tr>
                                                    <th>Sr.No</th>
                                                    <th>Item Name</th>
                                                    <th>Item Quantity</th>
                                                    <th>Item Unit</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    int i = 1;
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
                                                    PreparedStatement ps = conn.prepareStatement("select * from item_detail where distribution_id='" + session.getAttribute("uid") + "'");
                                                    ResultSet rs = ps.executeQuery();
                                                    while (rs.next()) {

                                                %>


                                                <tr>
                                                    <td><%=i%></td>
                                                    <td><%=rs.getString(2)%></td>
                                                    <td><%=rs.getString(3)%></td>
                                                    <td><%=rs.getString(4)%></td>
                                                    <td><%=rs.getString(5)%></td>
                                                    
                                                    <% i++; %>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </div>
        <!-- /. ROW  -->

    </div>
</div>
<!-- /. PAGE WRAPPER  -->
</div>

<script type="text/javascript" src="js/jquery.min"></script>

</body>
</html>