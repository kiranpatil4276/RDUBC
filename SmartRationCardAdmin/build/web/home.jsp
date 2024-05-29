<%@ include file="header.jsp" %>
<script>
    $.validator.setDefaults({
        submitHandler: function (form) {
            form.submit();
        }
    });
    $(document).ready(function () {
        $("#form").validate({
            rules: {
                img1: {
                    required: true,
                    extension: ""
                },
                img2: {
                    required: true,
                    extension: ""
                },
                img3: {
                    required: true,
                    extension: ""
                },
                info_heading: {
                    required: true
                },
                info_content: {
                    required: true
                },
                notice_heading: {
                    required: true
                },
                notice_content: {
                    required: true
                },
                news_heading: {
                    required: true
                },
                news_content: {
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

<div id="page-wrapper" >
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>HOME</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-lg-12 col-md-10">
                <form action="Myser" method="post" id="form" enctype="multipart/form-data">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Insert Information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-2">
                                    <input type=button class="btn btn-success" value="Images" id="image">
                                    <input type=button class="btn btn-success" value="Info" id="info">
                                    <input type=button class="btn btn-success" value="Notices & Offers" id="current_info">
                                    <input type=button class="btn btn-success" value="News Feed" id="news">
                                </div>
                            </div><hr>

                            <div class="row" id="image1">
                                <div class="col-md-12">
                                    <h4 style="color:#3b5998">Image</h4>
                                    <div class="form-group"><hr>
                                        <label for="image">Choose Image 1:</label>
                                        <input type="file" class="form-control" 	name="img1" style="line-height:2px;">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Choose Image 2:</label>
                                        <input type="file" class="form-control"  name="img2" style="line-height:2px;">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Choose Image 3:</label>
                                        <input type="file" class="form-control" name="img3" style="line-height:2px;"><br>
                                    </div>
                                    <table id="myTable" class="table table-striped table-bordered tabledata" style="overflow-x:auto;">
                                        <thead>
                                            <!-- 	<tr>
                                                            <th>Sr.No</th>
                                                            <th>Image Name</th>
                                                    </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                         <td>01</td>
                                                         <td>img1.jpg</td>
                                                    </tr> -->
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="info1">
                            <div class="col-md-12">
                                <h4 style="color:#3b5998">Info</h4>
                                <div class="form-group"><hr>
                                    <label for="image">Info heading:</label>
                                    <input type="text" class="form-control" name="info_heading">
                                </div>
                                <div class="form-group">
                                    <label for="image">Info content:</label>
                                    <input type="text" class="form-control" name="info_content">          
                                </div>
                            </div>
                        </div>
                        <div class="row" id="current_info1">
                            <div class="col-md-12">
                                <h4 style="color:#3b5998">Notice Info</h4>
                                <div class="form-group"><hr>
                                    <label for="image">Notice heading:</label>
                                    <input type="text" class="form-control" name="notice_heading">
                                </div>
                                <div class="form-group">
                                    <label for="image">Notice content:</label>
                                    <input type="text" class="form-control" name="notice_content">          
                                </div>
                            </div>
                        </div>
                        <div class="row" id="news1">
                            <div class="col-md-12">
                                <h4 style="color:#3b5998">News</h4>
                                <div class="form-group"><hr>
                                    <label for="image">News heading:</label>
                                    <input type="text" class="form-control" name="news_heading">
                                </div>
                                <div class="form-group">
                                    <label for="image">News content:</label>
                                    <input type="text" class="form-control" name="news_content">          
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit" style="float:right"><br>

                    </div>
            </div>
            </form>
        </div>
    </div>



</div>
<!-- /. ROW  -->

</div>
<%@ include file="footer.jsp" %>
