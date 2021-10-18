<%-- 
    Document   : booked-car
    Created on : 31 Oct, 2020, 11:35:40 AM
    Author     : User
--%>

<%@page import="model.RentalRequest"%>
<%@page import="model.Registration" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section id="blog" class="container">
            <center><div class="center">
                <h2>Booking history</h2>
            </div>
                </center>
           <div class="blog">
                <div class="row">
                    <div class="col-md-12">



                        <% if (session.getAttribute("userId")!=null) { %>
                        <table class="table table-condensed table-bordered">
                            <thead class="icon"> <tr>
                                    <th>Rid</th>
                                    <th>RegNo</th>
                                    <th>DateRequested</th>
                                    <th>DateFrom</th>
                                    <th>DateTo</th>
                                   
                                    <th>Status</th>
                                </tr> </thead>
                                <%
                                    Registration reg = new Registration(session);
                                    ArrayList<RentalRequest> data = reg.getRentalstatus();
                                    String statusClass = "", btn = "";
                                    int count = 1;
                                    for (RentalRequest r : data) {
                                        if (r.getStatus().equals("Pending")) {
                                            statusClass = "danger";
                                            btn="PENDING";
                                            
                                        }
                                        if (r.getStatus().equals("Accept")) {
                                            statusClass = "success";
                                            btn = "ACCEPTED";
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
        
                    <br><br>  <br><br>  <br><br>  <br><br>                    <br><br>  <br><br>  <br><br>  <br><br>

                <div style="background-color:#122620">
            <center style="background-color:#122620">
                <div class="bg-blue py-4 ">
                    <h5 style=" color: #fff;font-size: 20px;">Copyright &copy; 2020. All rights reserved</h5><br>
                    <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
                    </div>
                </div>
            </center>
        </div>
    </body>
</html>

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