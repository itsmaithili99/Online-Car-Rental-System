<%-- 
    Document   : available-cars
    Created on : 15 Oct, 2020, 2:38:15 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
         <style>
           .footer-col-1 .bg-blue {
               color: black;
                background:#c52d2f;
                padding-top: 10px;
            } 
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
         <section id="blog" class="container">
            <div class="center">
                <h2>Available Cars</h2>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <%
                            String error;
                            if (session.getAttribute("userId").equals("1")) { %>
                        <table class="table table-condensed table-bordered">
                            <thead> <tr>
                                    <th>RId</th>
                                    <th>Reg No</th>
                                    <th>Car Type</th>
                                    <th>Car Image</th>
                                    <th>Description </th>
                                    <th>Rental Price</th>
                                </tr> </thead>
                                <%
                                    try {
                                        // Get connection object from ConnectionProvider.java
                                        
                                       Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                        // Prepare SQL query
                                        PreparedStatement ps = con.prepareStatement("SELECT * FROM rentalrequest, car WHERE rentalrequest.regNo=car.regNo AND rentalrequest.status NOT LIKE 'A%' AND car.active  NOT LIKE 'In-Active%'");
//                                          ps.setString(1, "Accepted");  // set first parameter to email
                                        ResultSet rs = ps.executeQuery();
                                        int count = 1;
                                        while (rs.next()) {%>

                            <tr>
                                <td><%= count++%></td>
                                <td><%= rs.getString("regNo")%></td>
                                <td><%= rs.getString("carType")%></td>
                                <td><img src='image/<%= rs.getString("carImage")%>' class='img-responsive'></td>
                                <td><%= rs.getString("description")%></td>
                                <td>Rs<%= rs.getString("rentalPrice")%>/Per day</td>
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

                    </div><!--/.col-md-8
                </div><!--/.row-->
                </div>
        </section><!--/#blog-->
        <%@include file="footer.jsp" %>
    </body>
</html>
