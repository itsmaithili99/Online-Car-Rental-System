<%-- 
    Document   : remove-car
    Created on : 15 Oct, 2020, 2:06:12 PM
    Author     : User
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Registration"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove car </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
             .bg-blue {
               color: #fff;
                background:#2b3a67;
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
         <section id="blog" class="container">
            <div class="center">
                <h2>Remove car</h2>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <%
                            String error;
                            if ( session.getAttribute("userId").equals("1")) {
                                if (request.getParameter("cid") != null) {
                                    try {
                                        // Get connection object from Registration.java
                                          Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                        // Prepare SQL query
                                        PreparedStatement ps = conn.prepareStatement("UPDATE car SET active=? WHERE regNo=? order by Carid desc");
                                        ps.setString(1, "In-Active");   // set first parameter to email
                                        ps.setString(2, request.getParameter("cid"));   // set first parameter to email
                                        ps.executeUpdate(); // get the result of the SQL query
                                    } catch (Exception ex) {
                                        StringWriter errors = new StringWriter();
                                        ex.printStackTrace(new PrintWriter(errors));
                                        error = "exception" + errors.toString();
                                        out.println(error);
                                    }
                        %>
                                
                        <%
                            } %>
                        <table class="table table-condensed table-bordered">
                            <thead> <tr>
                                    <td>Carid</td>
                                    <td>RegNo</td>
                                    <td>Car Type</td>
                                    <td>Car Image</td>
                                    <td>Description</td>
                                    <td>Rental Price</td>
                                    <td>Active</td>
                                </tr> </thead>
                                <%
                                    String btn = "";
                                    try {
                                        // Get connection object from ConnectionProvider.java
                                          Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                        // Prepare SQL query
                                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM car WHERE active LIKE 'active%' ");
                                       
                                        ResultSet rs = ps.executeQuery();
                                        int count = 1;
                                        while (rs.next()) {
                                            if (rs.getString("active").equals("active")) {
                                                btn = "<a href='remove-car.jsp?cid=" + rs.getString("regNo") + "' class='btn btn-danger'>Remove</a> ";
                                            }
                                %>
                            <tr>
                                <td><%= count++%></td>
                                <td><%= rs.getString("regNo")%></td>
                                <td><%= rs.getString("carType")%></td>
                                <td><img class="img-responsive" src="image/<%=rs.getString("carImage")%>"></td>
                                <td><%= rs.getString("description")%></td>
                                <td><%= rs.getString("rentalPrice")%></td>
                                <td><%= btn%></td>
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
