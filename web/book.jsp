<%-- 
    Document   : book
    Created on : 26 Oct, 2020, 12:28:00 PM
    Author     : User
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Registration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import ="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    </head>
    <body>
       <%@ include file="header.jsp" %>  

        <section id="blog" class="container">
            <div class="center">
                <center>
                <p class="lead">Booking process</p>
                </center>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <% if (session.getAttribute("userId") != null) {
                                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                Date fromDate = formatter.parse(request.getParameter("from"));
                                int days = Integer.parseInt(request.getParameter("days"));
                                long toDateMilliSeconds = fromDate.getTime()
                                        + (days * 24 * 60 * 60 * 1000);
                                Date toDate = new Date(toDateMilliSeconds);
                                String toDateStr = formatter.format(toDate);
                                String fromDateStr = formatter.format(fromDate);
                                Date now = new Date();
                                String nowStr = formatter.format(now);
                                try {
                                    // Get connection object from ConnectionProvider.java
                                     Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                    // Prepare SQL query
                                    PreparedStatement ps = con.prepareStatement("INSERT INTO "
                                            + "rentalrequest (userId, regNo, dateRequested, dateFrom, dateTo, status) "
                                            + "VALUES (?, ?, ?, ?, ?, ?) ");
                                    ps.setString(1, session.getAttribute("userId").toString());
                                 ps.setString(2, request.getParameter("regNo"));
                                    ps.setString(3, nowStr);
                                    ps.setString(4, fromDateStr);
                                    ps.setString(5, toDateStr);
                                    ps.setString(6, "Pending");
                                    ps.executeUpdate(); // get the result of the SQL query
                                } catch (SQLException ex) {
                                    String error;
                                    StringWriter errors = new StringWriter();
                                    ex.printStackTrace(new PrintWriter(errors));
                                    error = "exception" + errors.toString();
                                    out.println(error);
                                }
                        %>
                        <center>
                        <h4>Your booking has been submitted to the company</h4>
                        <h4>Once approved you will receive email</h4><br>
                        <a href="home.jsp">Go to Home page</a></center>
                        
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            <strong> Please login: </strong> You must be logged-in to book car!
                        </div>                           
                        <% }%>

                    </div><!--/.col-md-8-->
                </div><!--/.row-->
            </div>
        </section><!--/#blog-->
        <%@include file="footer.jsp" %>
    </body>
</html>
