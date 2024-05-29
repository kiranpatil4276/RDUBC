<%@ include file = "header.jsp" %>
<div id="page-wrapper" >
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>ABOUT US</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-lg-12 col-md-10">
                <form action="AddAboutUs" method="post" id="form" enctype="multipart/form-data">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Insert Information
                        </div>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-12">
                                    <h4 style="color:#3b5998">About US</h4>
                                    <div class="form-group"><hr>
                                        <label for="image">heading:</label>
                                        <input type="text" class="form-control" name="heading">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Description:</label>
                                        <input type="text" class="form-control" name="desc"> 
                                    </div>  
                                    <div class="form-group">   
                                        <label for="img">Image</label>  
                                        <input type="file" name="file" class="form-control"> 
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
                heading: {
                    required: true
                },
                
                desc: {
                    required: true
                }
            },
            messages: {

            }

        });
    });

</script>       
<%@ include file = "footer.jsp" %>