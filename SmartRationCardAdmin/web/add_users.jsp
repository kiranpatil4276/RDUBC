<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.Database"%>

<%@ include file="header.jsp" %>
<div id="page-wrapper" >
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Add Users</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-lg-12 col-md-10">
                <form action="AddUsers1" method="post" id="form">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Register New User
                        </div>
                        <div class="panel-body">
                            <div class="row" id="service">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="form-group">
                                        <label>Select Category:</label>
                                        <select class="form-control" name="category">
                                            <option value="">Select</option>
                                            <option value="fps">FPS</option>
                                            <option value="taluka">Taluka</option>
                                            <option value="dist">District</option>
                                        </select>
                                    </div>	 
                                    <script>
                                        $(document).ready(function () {
                                            $("#a").hide();
                                            $("select").change(function () {
                                                if ($(this).val() == "fps") {
                                                    $("#a").show();
                                                } else {
                                                    $("#a").hide();
                                                }
                                            });
                                        });
                                    </script>
                                    <div class="form-group">
                                        <label>Name:</label>
                                        <input type="text" class="form-control" name="name"  placeholder="Add User Name"> 
                                    </div>
                                    <div class="form-group">	
                                        <label>Email Id:</label>
                                        <input type="text" class="form-control" name="email"  placeholder="Add Mail-id"> 
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="Password" class="form-control" name="password"  placeholder="Enter your password">  
                                    </div>
                                    <div class="form-group">
                                        <label>Contact Number:</label>
                                        <input type="text" class="form-control" name="contact"  placeholder="Enter your mobile no.">
                                    </div>
                                    <div class="form-group">
                                        <label>DOB:</label>
                                        <input type="text" class="form-control" name="dob"  placeholder="Date of birth" id="datepicker">
                                    </div>
                                    <div class="form-group">
                                        <label>Gender:</label>
                                        <select class="form-control" name="gender">
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>District:</label>
                                        <select class="form-control" name="district">
                                            <%
                                                Connection conn = Database.getConnection();
                                                PreparedStatement ps1 = conn.prepareStatement("select district from add_district");
                                                ResultSet rs1 = ps1.executeQuery();
                                                while (rs1.next()) {
                                            %>
                                            <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                                            <%} %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Taluka:</label>
                                        <select class="form-control" name="taluka">
                                            <%
                                                Connection connn = Database.getConnection();
                                                PreparedStatement ps11 = conn.prepareStatement("select taluka from add_taluka");
                                                ResultSet rs11 = ps11.executeQuery();
                                                while (rs11.next()) {
                                            %>
                                            <option value="<%=rs11.getString(1)%>"><%=rs11.getString(1)%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group" id="a">
                                        <label>Village:</label>
                                        <input type="text" class="form-control" name="village">
                                    </div><br>
                                    <input type="submit" class="btn btn-primary" value="Submit" style="float:right"><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </form> 
            </div>

        </div>



    </div>
    <!-- /. ROW  -->

</div>
</div>
<!-- /. PAGE WRAPPER  -->
</div>
<script>
    $.validator.setDefaults({
        submitHandler: function (form) {
            form.submit();
        }
    });
    $(document).ready(function () {
        $("#form").validate({
            rules: {
                category: {
                    required: true
                },
                name: {
                    required: true,
                    pattern: /^[A-Za-z\s]*$/
                },
                email: {
                    pattern: /^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
                    email: true
                },
                contact: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 10
                },
                password: {
                    required: true,
                    minlength: 8
                },
                dob: {
                    required: true
                },
                district: {
                    required: true
                },
                taluka: {
                    required: true
                },
                gender: {
                    required: true
                }
            },
            messages: {
                img1: {
                    extension: "Enter only .jpg or .png image"
                }

            }

        });
    });

</script>       
<%@ include file="footer.jsp" %>
