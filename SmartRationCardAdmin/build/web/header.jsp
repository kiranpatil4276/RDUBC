<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smart Ration Card Admin</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/custom.css" rel="stylesheet" />

        <script src="assets/js/custom.js"></script>
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/additional-methods.js"></script>
        <script>
            $(document).ready(function () {
                $("#image1").hide();
                $("#image").click(function () {
                    $("#image1").toggle();
                });
            });

            $(document).ready(function () {
                $("#current_info1").hide();
                $("#current_info").click(function () {
                    $("#current_info1").toggle();
                });
            });

            $(document).ready(function () {
                $("#info1").hide();
                $("#info").click(function () {
                    $("#info1").toggle();
                });
            });

            $(document).ready(function () {
                $("#news1").hide();
                $("#news").click(function () {
                    $("#news1").toggle();
                });
            });

        </script>
        <script type="text/javascript">
        </script>
        <style>
            .error{
                color:red;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="adjust-nav">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">
                            <img src="assets/img/india.png" /><span style="color:#fff;"><b>  Smart Ration Card System</b></span>
                        </a>

                    </div>

                    <span class="logout-spn" >
                        <a href="Logout.jsp"> LOG-OUT</a> 

                    </span>
                </div>
            </div>
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li>
                            <a href="home.jsp" ><i class="fa fa-desktop "></i>Home</a>
                        </li>
                        <li>
                            <a href="about_us.jsp" ><i class="fa fa-desktop "></i>About Us</a>
                        </li>
                        <li>
                            <a href="services.jsp" ><i class="fa fa-desktop "></i>Services</a>
                        </li>
                        <li>
                            <a href="gallery.jsp" ><i class="fa fa-desktop "></i>Gallery</a>
                        </li>
                        <li>
                            <a href="add_users.jsp" ><i class="fa fa-desktop "></i>Add Users</a>
                        </li>

                        <li>
                            <a href="enquiry.jsp"><i class="fa fa-pencil-square-o "></i>Enquiry</a>
                        </li>
                        <li>
                            <a href="data.jsp"><i class="fa fa-database"></i>Data</a>
                        </li>
                        <li>
                            <a href="feedback.jsp"><i class="fa fa-envelope"></i>Feedback</a>
                        </li>
                        <li>
                            <a href="add_item1.jsp"><i class="fa fa-envelope"></i>Add Item</a>
                        </li>
                        <li>
                            <a href="admin_distribute.jsp"><i class="fa fa-envelope"></i>Distribute Stock</a>
                        </li>
                        <li>
                            <a href="add_stock.jsp"><i class="fa fa-envelope"></i>Add Stock</a>
                        </li>
                        <li>
                            <a href="view_admin.jsp"><i class="fa fa-envelope"></i>View Stock</a>
                        </li>

                    </ul>
                </div>

            </nav>
            <!-- /. NAV SIDE  -->