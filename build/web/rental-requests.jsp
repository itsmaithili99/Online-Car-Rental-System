<%-- 
    Document   : rental-requests
    Created on : 25 Oct, 2020, 10:09:50 AM
    Author     : User
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Registration"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.RentalRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>rental-requests</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link  ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js" ></script>
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
      $(document).ready(function(){
    $(".button-links").click(functio/n(){
        var id=this.id;

        $.ajax({
            url:"viewdetails.jsp?sem="+id,
            type: 'POST',
            success: function(response) {
                alert(response);
            }
        });
    });
});
  </script>
        <style>
            .bg-blue {
                color: #fff;
                background:#B68D40;
                padding-top: 5px;

            }
            .btn-info {
                background:#B68D40;
            }
            .btn-danger{
                background: #122620;
            }
            .btn-primary{
                background: #03045E;
            }
            .h5{
                color:black;
            }
            body{
                background-color:#FDf8F5;

            }
            .table th{
                background-color: #FDf8F5;
            }
            .center h2{
                color:#4F4846;
            }
            .table .icon{
                color:#4F4846;
            }
            .footer-col-1{
                background-color: #122620;
            }

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section id="blog" class="container">
            <div class="center">
                <center><h2>Rental Requests</h2></center>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">



                        <% if (session.getAttribute("userId").equals("1")) { %>
                        <table class="table table-condensed table-bordered">
                            <thead class="icon"> <tr>
                                    <th>Rid</th>
                                    <th>RegNo</th>
                                    <th>DateRequested</th>
                                    <th>DateFrom</th>
                                    <th>DateTo</th>
                                    <th class="">userId</th>
                                    


                                    <th>Action</th>
                                </tr> </thead>
                                <%
                                    Registration reg = new Registration(session);
                                    ArrayList<RentalRequest> data = reg.getRentalRequestList();
                                    String statusClass = "", btn = "";
                                    int count = 1;
                                    for (RentalRequest r : data) {
                                        if (r.getStatus().equals("Pending")) {
                                            statusClass = "danger";
                                            btn = "<a href='accept.jsp?rid=" + r.getRequestId() + "' class='btn btn-info'>Accept</a> "
                                                    + "<a href='decline.jsp?rid=" + r.getRequestId() + "' class='btn btn-warning'>Decline</a>";
                                        }
                                        if (r.getStatus().equals("Accept")) {
                                            statusClass = "success";
                                            btn = "ACCEPTED";
                                            btn = "<a href='approvedlist.jsp?userId=" + r.getUserId() + "' class='btn btn-info'>send mail</a> ";

                                        }
                                        if (r.getStatus().equals("Decline")) {
                                            statusClass = "warning";
                                            btn = "DECLINED";
                                        }
                                %>
                            <tr class="<%=statusClass%>">
                                <td> <%=count++%> </td>
                                <td> <%= r.getRegNo()%></td>
                                <td> <%= r.getDateRequested()%></td>
                                <td> <%= r.getDateFrom()%></td>
                                <td> <%= r.getDateTo()%></td>
                                <td> <button type="button" class="btn btn-primary" data-toggle="modal" id="r.getUserId()" data-target="#myModal">
                                        <%= r.getUserId()%></button></td>
                                

                                <td> <%=btn%> </td>
                            </tr>
                            <% }%>
                        </table> 
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            <strong> Please login: </strong> You must be logged-in to view this page!
                        </div>                           
                        <% }%>
                    </div>
                </div><!--/.row-->
            </div>

        </section>
        <!---modalview--->
       
<div class="container">
  <h2></h2>
  <!-- Button to Open the Modal -->
  

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <section id="blog" class="container">
            <div class="center">
                <h2>Document details </h2>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <%
                            String error;
                            if (session.getAttribute("userId") != null) { %>
                        <table class="table table-condensed table-bordered">
                            <thead> <tr>

                                    <th>Name</th>
                                    <th>DLProof</th>
                                    <!--                                    <th>active</th>-->
                                </tr> </thead>
                                <%
                                    try {

                                        Class.forName("com.mysql.jdbc.Driver");
                                        // Get connection object from ConnectionProvider.java
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                        // Prepare SQL query
                                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM image  WHERE userId=" + session.getAttribute("userId"));

                                        ResultSet rs = ps.executeQuery();
                                        int count = 1;
                                        while (rs.next()) {
                                            String statusClass = "";
                                            if (rs.getString("userId") != null) {
                                                statusClass = "";
                                            } else {
                                                statusClass = "danger";
                                            }
                                %>

                            <tr class="<%=statusClass%>">


                                <td><%= rs.getString("name")%></td>
                                <td><img src="image/<%= rs.getString("link")%>" class='img-responsive'></td>
                            </tr>
                            <%
                                    }
                                } catch (Exception ex) {
                                    StringWriter errors = new StringWriter();
                                    ex.printStackTrace(new PrintWriter(errors));
                                    error = "exception" + errors.toString();
                                    out.println(error);
                                }
                            %>
                        </table>
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            <strong> Please login: </strong> You must be logged-in to view this page
                        </div>                           
                        <% }%>
                    </div>
                </div><!--/.row-->
            </div>
        </section>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

        <!--modal end-->      
       
<!--        <div class='footer-col-1'>
            <center>
                <div class="bg-blue py-4 ">
                    <h5 style="color:black">Copyright &copy; 2020. All rights reserved</h5><br>
                    <div  style="color:black" class="social-contact ml-4 ml-sm-auto"> <span  style="color:black" class="fa fa-facebook mr-4 text-sm"></span> <span  style="color:black" class="fa fa-google-plus mr-4 text-sm"></span> <span style="color:black" class="fa fa-linkedin mr-4 text-sm"></span> <span style="color:black" class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
                    </div>
                </div>
            </center>
        </div>-->
 <%@include file="footer.jsp" %>

    </body>
</html>
