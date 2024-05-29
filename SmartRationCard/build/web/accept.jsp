
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <% response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);%>
        <%
            if ((session.getAttribute("uname") == null) || (session.getAttribute("uname") == "")) {
                request.getSession().invalidate();
                response.sendRedirect("Login.jsp");
        %>

        <% } else {
            String village = session.getAttribute("village").toString();
            String id = request.getParameter("id");
        %>
        <title>Smart Ration Card System | Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords"
              content="Baby Care Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <script type="application/x-javascript">

            addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

        </script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="css/jquery-ui.css" rel='stylesheet' type='text/css' />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/owl.carousel.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script> 
        <!--JS for animate-->
        <link href="css/animate.css" rel="stylesheet" type="text/css"
              media="all">
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
                text-decoration: none;
            }

            a:hover {
                color: #abda0f;
                text-decoration: none;
            }

            h1 {
                font-weight: 200;
                color: #888888;
                font-size: 16pt;
                background: transparent url(../img/h1.png) no-repeat center left;
                padding-left: 33px;
                margin: 7px 5px 8px 8px;
            }

            h4 {
                padding: 1px;
                color: #ACACAC;
                font-size: 9pt;
                font-weight: 100;
                text-transform: uppercase;
            }

            form.register {
                width: 900px;
                margin: 20px auto 0px auto;
                height: auto;
                background-color: #fff;
                padding: 5px;
                -moz-border-radius: 20px;
                -webkit-border-radius: 20px;
            }

            form p {
                font-size: 8pt;
                clear: both;
                margin: 0;
                color: gray;
                padding: 10px;
            }

            form.register fieldset.row2 {
                border-top: 1px solid #F1F1F1;
                width: 770px;
                height: 340px;
                padding: 5px;
                float: left;
            }

            form.register fieldset.row3 {
                border-top: 1px solid #F1F1F1;
                padding: 5px;
                float: left;
                margin-bottom: 15px;
                width: 770px;
            }

            form.register fieldset.row4 {
                border-top: 1px solid #F1F1F1;
                border-right: 1px solid #F1F1F1;
                padding: 5px;
                float: left;
                clear: both;
                width: 500px;
            }

            form.register .infobox {
                float: right;
                margin-top: 20px;
                border: 1px solid #F1F1F1;
                padding: 5px;
                width: 380px;
                height: 98px;
                font-size: 9px;
                background: #FDFEFA url(../img/bg_infobox.gif) repeat-x top left;
            }

            form.register legend {
                color: #abda0f;
                padding: 2px;
                margin-left: 14px;
                font-weight: bold;
                font-size: 20px;
                font-weight: 100;
            }

            form.register label {
                color: #444;
                width: 118px;
                float: left;
                text-align: right;
                margin-right: 9px;
                margin-top: 2px;
            }

            form.register label.optional {
                float: left;
                text-align: right;
                margin-right: 6px;
                margin-top: 2px;
                color: #A3A3A3;
            }

            form.register label.obinfo {
                float: right;
                padding: 3px;
                font-style: italic;
            }

            form.register input {
                width: 186px;
                color: #505050;
                float: left;
                margin-right: 5px;
            }

            form.register input.long {
                width: 247px;
                color: #505050;
            }

            form.register input.short {
                width: 40px;
                color: #505050;
            }

            form.register input[type=radio] {
                float: left;
                width: 15px;
            }

            form.register label.gender {
                margin-top: -1px;
                margin-bottom: 2px;
                width: 34px;
                float: left;
                text-align: left;
                line-height: 19px;
            }

            form.register input[type=text] {
                border: 1px solid #E1E1E1;
                height: 36px;
            }

            form.register input[type=password] {
                border: 1px solid #E1E1E1;
                height: 18px;
            }

            .button {
                background: #abda0f url(../img/overlay.png) repeat-x;
                padding: 8px 10px 8px;
                color: #fff;
                text-decoration: none;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
                -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
                text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.25);
                cursor: pointer;
                float: left;
                font-size: 18px;
                margin: 90px;
                margin-left: 140px;
            }

            form.register input[type=text].year {
                border: 1px solid #E1E1E1;
                height: 18px;
                width: 30px;
            }

            form.register input[type=checkbox] {
                width: 14px;
                margin-top: 4px;
            }

            form.register select {
                border: 1px solid #E1E1E1;
                width: 186px;
                float: left;
                margin-bottom: 3px;
                color: #505050;
                margin-right: 5px;
            }

            form.register select.date {
                width: 40px;
            }

            input:focus,select:focus {
                background-color: #efffe0;
            }

            p.info {
                font-size: 7pt;
                color: gray;
            }

            p.agreement {
                margin-left: 15px;
            }

            p.agreement label {
                width: 390px;
                text-align: left;
                margin-top: 3px;
            }
            .ui-widget-content{
                color : #000 !important;
                background: #fff !important;

            }
        </style>
    </head>
    <body>
        <!--header-top-->
        <div class="header-top">
            <div class="container">
                <div class="head-main">

                    <div
                        class="col-md-6 head- animated wow fadeInDown animated animated"
                        data-wow-duration="1200ms" data-wow-delay="500ms">
                        <h1 style="font-size: 20pt;">
                            <img src="images/india.png" height="08%" width="11%"
                                 style="margin-top: -20px;" />&nbsp <a href="index.html">Smart
                                Ration Card System</a>
                        </h1>
                    </div>
                    <div class="col-md-6 head-left wow fadeInRight animated"
                         data-wow-delay=".5s">
                        <a href="Login.jsp"><i class="fa fa-user fa-lg"></i> Logout</a>
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
        </div>
        <!--header-top-->
        <!--navigation-starts-->
        <div class="navigation animated " data-wow-duration="1200ms"
             data-wow-delay="500ms" style="background-color: skyblue;">
            <span class="menu"></span>
            <ul class="navig cl-effect-16">
                <li><a href="fps_home.jsp">Home</a></li>
                <li><a href="fps_customer.jsp">Customer Details</a></li>

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
        <div class="reg" style="background-color: gray; height: 665px;">
            <br>
            <form action="ProceedCustomerRequest" class="register" method="post" name="form1" id="form1">
                <h1 style="font-size: 20pt;">DISTRIBUTE ITEMS FPS</h1>
                <fieldset class="row1">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conns = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartrationcard", "root", "root");
                        PreparedStatement ps = conns.prepareStatement("select * from requestfood INNER JOIN register ON requestfood.rationcard=register.rationcard  where register.village='" + session.getAttribute("village") + "'");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>

                    <legend> </legend>
                    <div class="col-md-11 col-md-offset-1" id="card">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Ration Card Number </label>
                                <!--<input type="text" class="form-control item" name="rationcard_no" id="card_no">-->
                                <input type="text" class="form-control item"  list="rno" class="form-control item" name="ration" placeholder="Ration card number" id="ration" value="<%=rs.getString("rationcard")%>">
                            </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                            <div class="form-group">
                                <label>Customer Name </label> 
                                <input type="text"  class="form-control" name="customer" placeholder="Customer name" id="customer"  value="<%=rs.getString("name")%>">
                                <input type="hidden"  class="form-control" name="mobile" placeholder="Customer name" id="mobile"  value="<%=rs.getString("mobile")%>">
                           
                            </div>
                        </div>
                    </div>
                       <%for (int i=0;i<rs.getString("items").split("#").length;i++)
                        {%>     
                    <div class="col-md-11 col-md-offset-1" id="item">
                       
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Item </label> <input type="text" class="form-control unit" name="item" value="<%=rs.getString("items").split("#")[i]%>" readonly />
                           
                            </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                            <div class="form-group">
                                <label>Item Quantity </label> <input type="text" class="form-control" name="item_quantity" value="<%=rs.getString("quantity").split("#")[i]%>" placeholder=" Enter item quantity " />
                            </div>
                        </div>
                    </div>
                            <%}%>
                         
                    <hr>
                    <div class="" id="item2">
                    </div>
                    <hr><br><br>
                    <div class="col-md-11 col-md-offset-1" id="itemRate">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Card Type </label> 
                                <input type="text" class="form-control card" name="card_type" placeholder="Card Type" id="card_type" value="<%=rs.getString("cardtype")%>">
                            </div>
                        </div>
                    </div>
                    <hr><br>
                    <%}%>
                    <input type="submit" class="btn btn-success" style="margin-left: 380px;" value="submit" name="submit">
                </fieldset>
            </form>
        </div>
       
        <script type="text/javascript" src="js/jquery.min"></script>

        <script>


                $(document).ready(function () {
                    $("#add").click(function () {
                        var member = '<div class="col-md-11 col-md-offset-1" id="item">' +
                                ' <div class="col-md-4">' +
                                '<div class="form-group">' +
                                '<label>Select Item:</label>' +
                                '<select class="form-control item_name" name="select_item">' +
                                '<option value="0">Select Item</option>' +
            <%
                Connection c = Database.getConnection();
                PreparedStatement p = c.prepareStatement("select * from add_item");
                ResultSet rt = p.executeQuery();
                while (rt.next()) {
            %>
                        '<option value="<%=rt.getString(1)%>"><%=rt.getString(2)%></option>' +
            <%}%>
                        '</select></div>' +
                                '</div>' +
                                '<div class="col-md-4 col-md-offset-1">' +
                                '<div class="form-group">' +
                                '<label>Item Quantity ' +
                                '</label>' +
                                '<input type="text" class="form-control" name="item_quantity" placeholder=" Enter item quantity "/>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-11 col-md-offset-1" id="Unit">' +
                                '<div class="col-md-4">' +
                                '<div class="form-group">' +
                                '<label>Item Unit </label> <input type="text" class="form-control unit" name="item_unit" readonly />' +
                                '</div>' +
                                '</div>' +
                                '<div class="col-md-4 col-md-offset-1">' +
                                '<div class="form-group">' +
                                '<label>Item Rate </label> <input type="text" class="form-control item_rate" name="item_rate" readonly />' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        $('#item2').append(member);
                    });

                    $(document).on(
                            'click',
                            '.delete_member',
                            function () {
                                var div = $(this).closest('.new_member');
                                div.remove();
                            });
                });

                $(document).on(
                        'change',
                        '.item_name',
                        function () {
                            var id = $(this).val();
                            var card_type = $('#card_type').val();
                            var item = $(this);
                            var url1 = 'fetch2_cust_ajax.jsp?q=' + id;
                            $.ajax({
                                url: url1,
                                dataType: 'json',
                                success: function (result) {
                                    item.parents('#item').siblings('#Unit').find(
                                            ".unit").val($.trim(result.unit));
                                    alert(result.unit);
                                    if (card_type == 'APL') {
                                        item.parents('#item').siblings('#Unit')
                                                .find(".item_rate").val(
                                                $.trim(result.apl_rate));
                                        alert(result.apl_rate);
                                    } else if (card_type = 'BPL') {
                                        item.parents('#item').siblings('#Unit')
                                                .find(".item_rate").val(
                                                $.trim(result.bpl_rate));
                                        alert(result.bpl_rate);
                                    }
                                }
                            });
                        });

        </script>
        <script>
            $(document).ready(function () {
                $("#rationcard_no").focusout(function () {
                    var card = $(this).val();
                    var item = $(this);
                    var url1 = 'fetch_cust_ajax.jsp?q=' + card;
                    $.ajax({
                        url: url1,
                        dataType: 'json',
                        success: function (result) {
                            $('#Custemer_Name').val($.trim(result.name));
                            alert(result.name);
                            item.parents('#card').siblings('#itemRate').find(
                                    ".card").val($.trim(result.card));
                            alert(result.card);
                            item.parents('#card').siblings('#family').find(
                                    ".member").val($.trim(result.member));
                            alert(result.member);
                        }
                    });
                });
            });
        </script>
        <%}%>
</html>