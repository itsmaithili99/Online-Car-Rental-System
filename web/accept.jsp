<%-- 
    Document   : accept
    Created on : 27 Oct, 2020, 12:10:16 PM
    Author     : User
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .bg-blue {
               color: #00303F;
                background:#B68D40;
                padding-top: 10px;
            } 
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
         <section id="blog" class="container">
            <div class="center">
                <h2>Book</h2>
                <p class="lead">Booking accepted</p>
            </div>
          
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <% 
                            String error;
                            if ( session.getAttribute("userId").equals("1")) { 
                            try {
                                
                                // Get connection object from ConnectionProvider.java
                                 Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                PreparedStatement ps = con.prepareStatement("UPDATE rentalRequest SET status=? WHERE requestId=?");
                                ps.setString(1, "Accept");   // set first parameter to email
                                ps.setString(2, request.getParameter("rid"));   // set first parameter to email
                                ps.executeUpdate(); // get the result of the SQL query
                            } catch (Exception ex) {
                                StringWriter errors = new StringWriter();
                                ex.printStackTrace(new PrintWriter(errors));
                                error = "exception" + errors.toString();
                                out.println(error);
                            }
                        %>
                        <h4>Booking accepted</h4>
                        <h4>Email is sent to the customer</h4>
                        <jsp:forward page="rental-requests.jsp" />

                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            <strong> Please login: </strong> You must be logged-in to book car!
                        </div>                           
                        <% }%>

                    </div><!--/.col-md-8
                </div><!--/.row-->
                </div>
        </section><!--/#blog-->
         <div class='footer-col-1'>
            <center>
                <div class="bg-blue py-4 ">
                    <h5>Copyright &copy; 2020. All rights reserved</h5><br>
                    <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
                    </div>
                </div>
            </center>
        </div>
        
        
    </body>
</html>
