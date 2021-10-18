<%-- 
    Document   : rented-cars
    Created on : 15 Oct, 2020, 11:29:30 AM
    Author     : User
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Registration"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Rented Cars | Rent A Car</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    </head>
    <body>
        <%@include file="header.jsp" %>
         <section id="blog" class="container">
            <div class="center">
                <h2>Rented Cars</h2>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <%
                            String error;
                            if ( session.getAttribute("userId").equals("1")) { %>
                        <table class="table table-condensed table-bordered">
                            <thead> <tr>
                                    <th>RequestId</th>
                                    <th>Reg No</th>
                                    <th>Car Type</th>
                                    <th>From Date </th>
                                    <th>To Date </th>
                                    <th>Rental Cost per day</th>
                                </tr> </thead>
                                <%
                                    try {
                                        // Get connection object from ConnectionProvider.java
                                         Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                        // Prepare SQL query
                                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM rentalrequest, car WHERE rentalrequest.regNo=car.regNo AND rentalrequest.status  LIKE 'A%' AND car.active  LIKE 'active%' ");
                                       // set first parameter to email
                                        Date date = Calendar.getInstance().getTime();
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                          // set first parameter to email
                                        ResultSet rs = ps.executeQuery();
                                        int count = 1;
                                        while (rs.next()) {%>

                            <tr>
                                <td><%= count++%></td>
                                <td><%= rs.getString("regNo")%></td>
                                <td><%= rs.getString("carType")%></td>
                                <td><%= rs.getString("dateFrom")%></td>
                                <td><%= rs.getString("dateTo")%></td>
                                <td>Rs<%= rs.getString("rentalPrice")%>
                                    <%
//                                        long MILLISECONDS_IN_DAY = 24 * 60 * 60 * 1000;
//
////                                        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
////                                        Date date1 = format1.format(rs.getString("dateFrom"));
//String[] array = rs.getString("dateFrom").split("\\-", -1);
//out.println(array[0]);
//
//                                        Date from = new Date(rs.getString("dateFrom"));
//                                        Date to = new Date(rs.getString("dateTo"));
//                                        out.println(
//                                                (int) ((to.getTime() - from.getTime()) / MILLISECONDS_IN_DAY)
//                                        );
                                    %>

                                </td>
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
        <br><br>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
