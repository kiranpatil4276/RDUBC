<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.Database"%>
<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>


<script type="text/javascript">
    $(document).ready(function () {
        $('#officer').change(function () {
            var id = $(this).val();
            var url = 'selectdistrict.jsp?id=' + id;
            $.ajax({
                url: url,
                dataType: 'json',
                success: function (data) {
                    $('#district').val(data.district);
                    $('#population').val(data.population);

                }
            });
        });
    });

</script>
<>
<div id="page-wrapper" >
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Distribute Item</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-lg-12 col-md-10">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Distribute details
                    </div>
                    <div class="panel-body">
                        <div class="row" id="service">
                            <form action="admin_distribute" method="post" id="form">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="form-group">
                                        <label>Select District Officer:</label>
                                        <select class="form-control" id="officer" name="officer">

                                            <%
                                                Connection con = Database.getConnection();
                                                PreparedStatement ps = con.prepareStatement("Select * from users where category='dist'");
                                                                                     ResultSet rs = ps.executeQuery(); %>
                                            <option>select</option>
                                            <%

                                                while (rs.next()) {


                                            %>

                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(3)%></option>
                                            <%} %>
                                        </select>
                                    </div>
                                    <label>District:</label>
                                    <input type="text" class="form-control" id="district" name="district" readonly> 
                                    <label>Population:</label>
                                    <input type="text" class="form-control" id="population" name="population" readonly> 
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">

                                            <label>Select Item:</label>
                                            <select class="form-control item" id="item" name="item_name">
                                                <option value="">Select</option>
                                                <%
                                                    Connection conn = Database.getConnection();
                                                    PreparedStatement ps1 = conn.prepareStatement("select item_name from admin_stock");
                                                    ResultSet rs1 = ps1.executeQuery();
                                                    while (rs1.next()) {
                                                %>
                                                <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                                                <%} %>
                                            </select>
                                        </div>
                                        <div class="col-md-6" id="itemPrise">

                                            <input type="hidden" class="form-control item_prise" id="item_prise" name="item_prise" readonly></div> 
                                        <div class="col-md-6">  
                                            <label>Quantity:</label>
                                            <input type="text" class="form-control" name="quantity"> </div>
                                        <div class="col-md-6" id="Unit">
                                            <label>Unit:</label>
                                            <input type="text" class="form-control unit" id="unit" name="unit" readonly>	
                                        </div>									 
                                    </div>
                                    <div id="item2">
                                    </div><br>
                                    <div class="row col-md-offset-10">
                                        <input type="button" id="add_item" value="Add item +" style="background-color: #428bca;border-color: #357ebd;">

                                    </div>
                                    <br>
                                    <div class="row">
                                        <label>Date:</label>
                                        <input type="text" class="form-control" name="date" id="datepicker" readonly>
                                    </div>
                                    <br>
                                    <input type="submit" class="btn btn-primary" value="Submit" style="float:right"><br>
                                </div>
                            </form>
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
<script type="text/javascript">

    $(document).ready(function () {
        $("#add_item").click(function () {
            var member = '<hr><div class="row" id="item2">' +
                    '<div class="col-md-6">' +
                    '<label>Select Item:</label>' +
                    '<select class="form-control item" id="item" name="item_name">' +
                    '<option value="0">Select Item</option>' +
    <%
                        Connection c = Database.getConnection();
                        PreparedStatement p = conn.prepareStatement("select item_name from admin_stock");
                        ResultSet rt = p.executeQuery();
                        while (rt.next()) {
    %>
            '<option value="<%=rt.getString(1)%>"><%=rt.getString(1)%></option>' +
    <%
                        }
    %>
            '</select></div>' +
                    '<div class="col-md-6" id="itemPrise">' +
                    '<div class="col-md-6" id="quantity">' +
                    '<label>Quantity:</label>' +
                    '<input type="text" class="form-control quantity" name="quantity"> </div>' +
                    '<div class="col-md-6" id="Unit">' +
                    '<label>Unit:</label>' +
                    '<input type="text" class="form-control unit" name="unit" readonly>' +
                    '</div></div>';
            $('#item2').append(member);

        });
    });

    $(document).on('change', '.item', function () {
        var id = $(this).val();
        var item = $(this);
        alert(id);
        var url1 = 'ad_dis_ajax.jsp?q=' + id;
        $.ajax({url: url1, dataType: 'json', success: function (result) {
                //item.parent().siblings('#itemPrise').find(".item_prise").val($.trim(result.item_prise));
                item.parent().siblings('#Unit').find(".unit").val($.trim(result.unit));

            }
        });
    });


    function getName1()
    {



    }
</script>
<script>
    $.validator.setDefaults({
        submitHandler: function (form) {
            form.submit();
        }
    });
    $(document).ready(function () {
        $("#form").validate({
            rules: {
                officer: {
                    required: true
                },
                file: {
                    required: true,
                    extension: ""
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
<%@ include file="footer.jsp" %>
