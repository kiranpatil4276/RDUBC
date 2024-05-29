<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <% response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            session.setAttribute("uname", null);
            request.getSession().invalidate();

        %>
        <title>Smart Ration Card System | Login</title>
        <!-- Custom Theme files -->
        <link href="css1/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Custom Theme files -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
        <!--Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!--Google Fonts-->
        <script>var __links = document.querySelectorAll('a');function __linkClick(e) {
        parent.window.postMessage(this.href, '*');
    }
    ;
    for (var i = 0, l = __links.length; i < l; i++) {
        if (__links[i].getAttribute('data-t') == '_blank') {
            __links[i].addEventListener('click', __linkClick, false);
        }
    }</script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>$(document).ready(function (c) {
                $('.sinup-close').on('click', function (c) {
                    $('.setting').fadeOut('slow', function (c) {
                        $('.setting').remove();
                    });
                });
            });
        </script>
        <!---Google Analytics Designmaz.net-->
        <script>(function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-35751449-15', 'auto');
    ga('send', 'pageview');</script>
        <style>
            img {
                opacity: 0.5;
                filter: alpha(opacity=100); /* For IE8 and earlier */
            }
        </style>
    </head>
    <body>
        <!--login start here-->
        <div class="col-md-12 head- animated wow fadeInDown animated animated" data-wow-duration="1200ms" data-wow-delay="500ms" >
            <h1 style="font-size:40pt;"><img src="images/india.png" height="100px" width="80px"/>&nbsp <b><span style="margin-bottom:20px;"> Smart Ration Card System </span></b></h1>
        </div>
        <div class="login" style="background:rgba(255,255,255,0.6);margin-right:524px;margin-top:21px;">
            <h2 style="color:#000;">Login</h2><center><br>
                <form action="check.jsp" method="post" >
                    <div class="form-group">
                        <Select name="category" class="user active form-control" style="width:160px; height:25px;color:#000">
                            <option value="fps">FPS</option>
                            <option value="taluka">Taluka</option>
                            <option value="dist">District</option>
                       
                        </select>
                    </div><br>
                    <div class="form-group">
                        <input type="text" class="user active" name="name" value="User name or Contact" style="color:#000" onfocus="this.value = '';"/>
                        <input type="password" class="lock active" name="pass" value="Password" onfocus="this.value = '';" />
                    </div>
                    <div class="forgot">
                       
                       

                        <div class="clear"> </div>
                    </div>
                    <div class="login-bwn">
                        <input type="submit" value="Log in" />
                    </div>
                </form>
                <center>
                    <h4 style="color:#FFFFFF;">Don,t have an Account? <a href="register1.jsp"> Register Now!</a></h4>
                     <h4 style="color:#FFFFFF;">Citizen Login <a href="Login_1.jsp">Citizen Login!</a></h4>

                    </div>
                    </div>
                    </div>
                    <div style="text-align:center; margin-top:10px;">
                        <ins class="adsbygoogle"
                             style="display:block"
                             data-ad-client="ca-pub-8011246932591811"
                             data-ad-slot="9844648019"
                        data-ad-format="auto"></ins> <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    </div>


                    <!--login end here-->
                    </body>
                    </html>