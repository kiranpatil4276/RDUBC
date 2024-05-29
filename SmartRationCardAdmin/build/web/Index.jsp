
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Smart Ration Card Admin </title>

        <!-- Bootstrap -->
        <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Animate.css -->
        <link href="vendors/animate.css/animate.min.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="vendors/css/custom.min.css" rel="stylesheet">
    </head>

    <body class="login">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>
            <a class="hiddenanchor" id="forgotpassword"></a>
            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="./LoginServlet">
                            <h1>Login Form</h1>
                            <div>
                                <input type="text" name="user" id="user" class="form-control" placeholder="Username" required="" />
                            </div>
                            <div>
                                <input type="password" name="pass" id="pass" class="form-control" placeholder="Password" required="" />
                            </div>
                            <div>
                                <input type="submit"  class="btn btn-default submit" value="Log In">
                                <a class="reset_pass" href="ForgotPassword.jsp">forgot password?</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                               
                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><i class="fa fa-users"></i> Smart Ration Card</h1>
                                    <p>©2018 All Rights Reserved. Privacy and Terms</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>

                <div id="register" class="animate form registration_form">
                    <section class="login_content">
                        <form action="./RegisterServlet"> 
                            <h1>Create Account</h1>
                            <div>
                                <input type="text" class="form-control" placeholder="Username" required="" name="name" id="name" />
                            </div>
                            <div>
                                <input type="password" class="form-control" name="pass" id="pass" placeholder="Password" required="" />
                            </div>
                            <div>
                                <input type="email" class="form-control" placeholder="Email" required="" name="email" id="email"  />
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Mobile" required="" name="mobile" id="mobile"  /><br>
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Address" required="" name="addrs" id="addrs"  />
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Country" required="" name="country" id="country"  />
                            </div>
                            <div>
                                <select id="question" name="question" class="form-control">
                                    <option>Select Your Question</option>
                                    <option>your first phone no?</option>
                                    <option>your pet name?</option>
                                    <option>your first teacher name?</option>
                                </select>   <br>
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Answer" required="" name="answer" id="answer"  />
                            </div>
                            <div>
                                <select name="ref" id="ref" class="form-control">
                                    <option value="">Select Reference</option>
                                    <option value="Friend">Friend</option>
                                    <option value="Website">Website</option>
                                    <option value="Others">Others</option>
                                </select><br>
                            </div>
                            <div>
                                <input class="btn btn-default submit" value="Create Account" type="submit"/>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">Already a member ?
                                    <a href="#signin" class="to_register"> Log in </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><i class="fa fa-users"></i> Smart Ration Card</h1>
                                    <p>©2017 All Rights Reserved.</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
