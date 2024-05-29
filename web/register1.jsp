<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
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
        <script src="js/country.js"></script>
        <script src="js/state.js"></script>
        <script src="dist.js"></script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/owl.carousel.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/additional-methods.js"></script>
        <script>
            $.validator.setDefaults({
                submitHandler: function (form) {
                    form.submit();
                }
            });
            $(document).ready(function () {
                $("#Form").validate({
                    rules: {
                        name: {
                            required: true,
                            pattern: /^[a-zA-Z]*$/
                        },
                        mob_no: {
                            required: true
                        },
                        password: {
                            required: true,
                            pattern: /^[a-zA-Z0-9.]*$/
                        },
                        cpassword: {
                            required: true,
                            equalTo: "#password"
                        },
                        adhar: {
                            required: true,
                            digits: true,
                            minlength: 12,
                            maxlength: 12

                        },
                        zip: {
                            required: true,
                            digits: true
                        },
                        dob: {
                            required: true,
                            date: true // mm-dd-yyyy
                        },
                        age: {
                            required: true,
                            digits: true
                        },
                        addr: {
                            required: true
                        },
                        country: {
                            required: true
                        },
                        gender: {
                            required: true
                        },
                        state: {
                            required: true
                        },
                        dist: {
                            required: true
                        },
                        tal: {
                            required: true
                        },
                        vlg: {
                            required: true
                        },
                        cast: {
                            required: true
                        },
                        relation: {
                            required: true,
                            pattern: /^[a-zA-Z\s]*$/
                        },
                        aadhar: {
                            required: true,
                            extension: "pdf"
                        },
                        address: {
                            required: true,
                            extension: "pdf"
                        },
                        fingerprint: {
                            required: true,
                            extension: "pdf"
                        },
                        name1: {
                            required: true,
                            pattern: /^[a-zA-Z]*$/
                        },
                        dob1: {
                            required: true,
                            date: true // mm-dd-yyyy
                        },
                        age1: {
                            required: true,
                            digits: true
                        },
                        gender1: {
                            required: true
                        },
                        aadhar1: {
                            required: true,
                            extension: "pdf"
                        },
                        fingerprint1: {
                            required: true,
                            extension: "pdf"
                        },
                    },
                    messages: {
                        name: {
                            pattern: "Please enter valid name"
                        },
                        mon_no: {
                            pattern: "Please enter valid name"
                        },
                        aadhar: {
                            extension: "Please enter filr format of .pdf extension"
                        },
                        address: {
                            extension: "Please enter filr format of .pdf extension"
                        },
                        fingerprint: {
                            extension: "Please enter filr format of .pdf extension"
                        }
                    }

                });
            });

        </script>
        <style>
            .error
            {
                color:red;
            }

            div.error {
                position:absolute;
                margin-top:-21px;
                margin-left:150px;
                border:2px solid #C0C097;
                background-color:#fff;
                color:red;
                padding:3px;
                text-align:left;
                z-index:1;
                font:100% arial,helvetica,clean,sans-serif;
                font-size:15px;
                font-weight:bold;  
            }

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
            form.register input[type=password]
            {
                float:left;
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
        <style>
            .color{
                color:red;
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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about_us.jsp">About us</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="gallery.jsp">Gallary</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="Login.jsp">Sign In</a></li>

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


        <!-- Style for MODAL POPUP -->
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;

            width: 60%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <%

        HttpSession hs = request.getSession();
        String d = request.getRequestURL().toString();
        hs.setAttribute("urii", d);
    %>
    <script>

        function isNumericKey(e)
        {
            if (window.event)
            {
                var charCode = window.event.keyCode;
            } else if (e)
            {
                var charCode = e.which;
            } else
            {
                return true;
            }
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 45)
            {
                return false;
            }
            return true;
        }


        function validation() {



            var email = document.getElementById('emailss');
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (!filter.test(email.value)) {
                alert('Please provide a valid email address');
                email.focus;
                return false;
            }

            var mob = document.getElementById('mob').value;
            if (mob == '') {
                document.getElementById('mob_err').innerHTML = 'Kindly Enter Contact No';
                document.getElementById('mob').focus();
                return false;
            } else {
                document.getElementById('mob_err').innerHTML = '';
            }

            var password = document.getElementById('password').value;
            if (password == '') {
                document.getElementById('password_err').innerHTML = 'Kindly Enter Password';
                document.getElementById('password').focus();
                return false;
            } else {
                document.getElementById('password_err').innerHTML = '';
            }

            var cpassword = document.getElementById('cpassword').value;
            if (password != cpassword) {
                document.getElementById('cpassword_err').innerHTML = 'Password Does not match. Try Again..!!';
                document.getElementById('cpassword').focus();
                return false;
            } else {
                document.getElementById('cpassword_err').innerHTML = '';
            }

            var adhar = document.getElementById('adhar').value;
            if (adhar == '') {
                document.getElementById('adhar_err').innerHTML = 'Kindly Enter Adhar no.';
                document.getElementById('adhar').focus();
                return false;
            } else {
                document.getElementById('adhar_err').innerHTML = '';
            }

            var income = document.getElementById('income').value;
            if (income == '') {
                document.getElementById('income_err').innerHTML = 'Kindly Enter Your Income';
                document.getElementById('income').focus();
                return false;
            } else {
                document.getElementById('income_err').innerHTML = '';
            }





            var addr = document.getElementById('addr').value;
            if (addr == '') {
                document.getElementById('addr_err').innerHTML = 'Kindly Enter Your Address';
                document.getElementById('addr').focus();
                return false;
            } else {
                document.getElementById('addr_err').innerHTML = '';
            }

            var country = document.getElementById('country').value;
            if (country == '-1') {
                document.getElementById('country_err').innerHTML = 'Kindly Select Country';
                document.getElementById('country').focus();
                return false;
            } else {
                document.getElementById('country_err').innerHTML = '';
            }



            var district = document.getElementById('district').value;
            if (district == '-1') {
                document.getElementById('district_err').innerHTML = 'Kindly Select Your District';
                document.getElementById('district').focus();
                return false;
            } else {
                document.getElementById('district_err').innerHTML = '';
            }

            var Taluka = document.getElementById('Taluka').value;
            if (Taluka == '-1') {
                document.getElementById('Taluka_err').innerHTML = 'Kindly Select Your Taluka';
                document.getElementById('Taluka').focus();
                return false;
            } else {
                document.getElementById('Taluka_err').innerHTML = '';
            }
            var Village = document.getElementById('Village').value;
            if (Village == '-1') {
                document.getElementById('Village_err').innerHTML = 'Kindly Select Your Village';
                document.getElementById('Village').focus();
                return false;
            } else {
                document.getElementById('Village_err').innerHTML = '';
            }

            var Cast = document.getElementById('Cast').value;
            if (Cast == '-1') {
                document.getElementById('Cast_err').innerHTML = 'Kindly Select Your Cast';
                document.getElementById('Cast').focus();
                return false;
            } else {
                document.getElementById('Cast_err').innerHTML = '';
            }
        }
    </script>
    <!--script-for-menu-->
    <div class="container-fluid" style="background-color:gray; height:auto;">

        <div>
            <center>
                <label id="myBtn" style="color: blue ; font-size: 17px">Open Device</label>
            </center>
        </div>

        <form action="upload_image1" onsubmit="return validation();" method="post"  class="register col-md-8 col-md-offset-2">

            <h1 class="text-center" style="font-size:20pt;">Registration</h1>

            <fieldset class="row">
                <legend>Personal Details</legend>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-2">Email<span class="color"> *</span></label>
                                <input type="text" name="email" id="email" class="form-control col-md-6" placeholder="email" rew/>
                                <div id="name_err" class="color" ></div>
                            </div>
                            <div class="col-md-6">
                                <label class="control-label col-md-2">Mobile Number<span class="color"> *</span></label>
                                <input type="text" name="mob" id="mob" class="form-control col-md-6" onKeyPress="return isNumericKey(event);" maxlength="12" placeholder="Mobile No."/>
                                <div id="mob_err" class="color" ></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-2">Passowrd<span class="color"> *</span></label>
                                <input type="password" name="password" id="password" class="form-control col-md-6" placeholder="Password"/>
                                <div id="password_err" class="color" ></div>
                            </div>

                            <div class="col-md-6">
                                <label class="control-label col-md-2">Caste<span class="color" required> *</span></label>

                                <select name="Cast" id="Cast" class="form-control col-md-3">
                                    <option value="-1">Select Cast</option>
                                    <option value="open">open</option>
                                    <option value="OBC">OBC</option>
                                    <option value="NT">NT</option>
                                    <option value="VJNT">VJNT</option>
                                    <option value="SC">SC</option>



                                </select>
                                <div id="Cast_err" class="color" ></div>

                            </div>


                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-2">AdharCard No. <span class="color"> *</span></label>
                                <input type="text" class="form-control col-md-3" id="adhar" name="adhar" onKeyPress="return isNumericKey(event);" placeholder="Adhar card No."/>
                                <div id="adhar_err" class="color" ></div>
                            </div>
                            <div class="col-md-6">
                                <label class="control-label col-md-2">Income<span class="color"> *</span></label>
                                <input type="text" class="form-control col-md-3" id="income" onKeyPress="return isNumericKey(event);" name="income" placeholder="Your Income" />
                                <div id="income_err" class="color" ></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <label class="control-label col-md-2">Address<span class="color"> *</span></label>
                                <textarea class="form-control col-md-3" style="width:42%;height:5%" id="addr" name="addr" placeholder="Enter Address" required/>
                                </textarea>
                                <div id="addr_err" class="color" ></div>
                            </div>


                            <div class="col-md-6">
                                <label class="control-label col-md-2">District <span class="color"> *</span></label>
                                <select name="district" id="district" class="form-control col-md-3">
                                    <option value="-1">Select District</option>
                                    <%
                                        try {
                                            Connection conn = Database.getConnection();
                                            PreparedStatement ps = conn.prepareStatement("select * from add_district");
                                            ResultSet rs = ps.executeQuery();
                                            while (rs.next()) {
                                    %>
                                    <option><%=rs.getString(2)%></option>
                                    <%   }
                                        } catch (Exception e) {
                                            System.out.println(e);
                                        }


                                    %>
                                </select>
                                <div id="district_err" class="color" ></div>
                            </div>



                        </div>

                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">






                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6">

                                <label class="control-label col-md-2">Taluka <span class="color"> *</span></label>
                                <select name="Taluka" id="Taluka" class="form-control col-md-3">
                                    <option value="-1">Select Taluka</option>
                                    <%                                        try {
                                            Connection conn = Database.getConnection();
                                            PreparedStatement ps1 = conn.prepareStatement("select * from add_taluka");
                                            ResultSet rs1 = ps1.executeQuery();
                                            while (rs1.next()) {
                                    %>
                                    <option><%=rs1.getString(2)%></option>
                                    <%   }
                                        } catch (Exception e) {
                                            System.out.println(e);
                                        }


                                    %>
                                </select>	  
                                <div id="Taluka_err" class="color" ></div>
                            </div>
                            <div class="col-md-6">
                                <label class="control-label col-md-2"> Village <span class="color"> *</span></label>
                                <select name="Village" id="Village"  class="form-control col-md-3">
                                    <option value="-1">Select Village</option>
                                    <%                                          try {
                                            Connection conn = Database.getConnection();
                                            PreparedStatement ps2 = conn.prepareStatement("select * from users");
                                            ResultSet rs2 = ps2.executeQuery();
                                            while (rs2.next()) {
                                                if (!(rs2.getString(12) == null)) {
                                    %>
                                    <option><%=rs2.getString(12)%></option>
                                    <%   }
                                            }
                                        } catch (Exception e) {
                                            System.out.println(e);
                                        }


                                    %>

                                </select>
                                <div id="Village_err" class="color" ></div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">

                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <%                             try {
                                Connection conn = Database.getConnection();
                                PreparedStatement ps = conn.prepareStatement("select * from rfid");
                                ResultSet rs = ps.executeQuery();
                                if (rs.next()) {


                        %>
                        <div class="col-md-12">
                            <label class="control-label col-md-2">Ration card number<span class="color"> *</span></label>
                            <input type="text" class="form-control col-md-3" name="rationcard" value="<%=rs.getString("rfid").toString().trim()%>" onKeyPress="return isNumericKey(event);" placeholder="Ration card No." required/>
                            <%}
                               } catch (Exception e) {
                                   System.out.println(e);
                               }%>
                            <label class="control-label col-md-2">Card Type<span class="color"> *</span></label>

                            <select name="cardtype" id="cardtype" class="form-control col-md-3">
                                <option value="-1">Select Card</option>
                                <option value="open">BPL</option>
                                <option value="OBC">APL</option>




                            </select>
                        </div>
                    </div>

                </div>
                <center>

                    <table>
                        <tr>
                            <td>
                                Color:
                            </td>
                            <td></td>
                            <td>
                                <input type="color" name="red" value="#fffff">
                            </td>
                            

                        </tr>
                        
                    </table><br>

                </center>
            </fieldset>
            <fieldset class="row">
                <legend>Family Details</legend>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="control-label col-md-2">Name <span class="color"> *</span></label>
                            <input type="text" name="name1" class="form-control col-md-6" style="width:400px" placeholder="Enter Name"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="control-label col-md-2">Birth date <span class="color"> *</span></label>
                            <input type="text" class="form-control col-md-4" id="dob1" name="dob1" placeholder="DD/MM/YY"/>
                            <label class="control-label col-md-2">Age<span class="color"> *</span></label>
                            <input type="text" class="form-control col-md-4" name="age1" maxlength=
                                   "3" onKeyPress="return isNumericKey(event);" placeholder="Enter Age"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="control-label col-md-2">Gender <span class="color"> *</span></label>
                            <select name="gender1" class="form-control col-md-4">
                                <option>Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                            <label class="control-label col-md-2">Relation <span class="color"> *</span></label>
                            <input type="text" class="form-control col-md-4" name="relation" placeholder="Enter Relation"/>
                            </p>
                        </div>
                    </div>
                </div><br>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="control-label col-md-6">Aadhar Card Number <span class="color"> *</span></label>
                            <input type="text" class="form-control col-md-3" name="adhar1" style="width:259px"/>					
                        </div>
                    </div>
                </div><br>
            </fieldset>
            <fieldset id="member">
            </fieldset>
            <fieldset style="margin-bottom:5px;">
                <div class="row">
                    <div class="col-md-6 col-md-offset-4">
                        <input type="button" class="btn btn-info" id="add_member" value="Add Member +"> 
                        <input type="submit" class="btn btn-success" value="Register &raquo;">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script>
                                       $(document).ready(function () {
                                           $('#add_member').click(function () {
                                               var member = '<div class="new_member"><p class="pull-right" style="text_align:right;"><span class="delete_member btn btn-metis-1 btn-sm"><i class="fa fa-close" ></i></span></p>' +
                                                       '<legend></legend><fieldset class="row">' +
                                                       '<div class="form-group">' +
                                                       '<div class="row">' +
                                                       '<div class="col-md-12"><label class="control-label col-md-2">Name *</label>' +
                                                       '<input type="text" name="name1" class="form-control col-md-6" style="width:520px" placeholder="Enter Name"/>' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '<div class="form-group">' +
                                                       '<div class="row">' +
                                                       '<div class="col-md-12">' +
                                                       '<label class="control-label col-md-2">Birthdate </label>' +
                                                       '<input type="text" class="form-control col-md-4" id="dob1" name="dob1" placeholder="DD/MM/YY"/>' +
                                                       '<label class="control-label col-md-2">Age</label>' +
                                                       '<input type="text" class="form-control col-md-4" name="age1"/>' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '<div class="form-group">' +
                                                       '<div class="row">' +
                                                       '<div class="col-md-12">' +
                                                       '<label class="control-label col-md-2">Gender </label>' +
                                                       '<select name="gender1" class="form-control col-md-4">' +
                                                       '<option></option>' +
                                                       '<option value="male">Male</option>' +
                                                       '<option value="female">Female</option>' +
                                                       '</select>' +
                                                       '<label class="control-label col-md-2">Relation </label>' +
                                                       '<input type="text" class="form-control col-md-4" name="relation" />' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '<div class="form-group">' +
                                                       '<div class="row">' +
                                                       '<div class="col-md-12">' +
                                                       '<label class="control-label col-md-6">Aadhar Card Number <span class="color"> *</span></label>' +
                                                       '<input type="text" class="form-control col-md-3" name="adhar1" style="width:259px">' +
                                                       '</div>' +
                                                       '</div>' +
                                                       '</div><br>' +
                                                       '</div>' +
                                                       '</fieldset></div>';
                                               $('#member').append(member);
                                           });

                                           $(document).on('click', '.delete_member', function () {
                                               var div = $(this).closest('.new_member');
                                               div.remove();
                                           });
                                       });

                                       populateCountries("country", "state");


                                       new WOW().init();
    </script>
    <!--JS for animate-->
    <script src="js/wow.min.js"></script>
    <!--//end-animate-->
</body>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

                                       $(function () {
                                           $("#dob").datepicker({dateFormat: 'dd/mm/yy'});
                                       });
                                       $(function () {
                                           $("#dob1").datepicker({dateFormat: 'dd/mm/yy'});
                                       });
</script>
<!-- Modal content -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <form action="FingerScan1?<%=d%>" name="fpass" method="post" class="mod2">
            <input type="submit" style= " height:50px; width: 150px ; background: greenyellow" value="Open Device">
            <button onclick="window.close();" style= " height:50px; width: 150px ; background: red"> Cancel</button>
        </form>
    </div>

</div>

<!-- Script for MODAL  -->
<script>
// Get the modal
    var modal = document.getElementById('myModal');

// Get the button that opens the modal
    var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    }

// When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

// When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</html>

