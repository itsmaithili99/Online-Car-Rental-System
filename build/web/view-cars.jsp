<%-- 
    Document   : view-cars
    Created on : 17 Oct, 2020, 10:53:54 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
 <%@page import="model.Registration"%>
<%@page import="model.car"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        <title>view-cars</title>
        <style>
           .footer-col-1  .bg-blue {
               color: black;
                background:#c52d2f;
                padding-top: 10px;
            }
            .blog img{
                width: 400px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
          <section id="blog" class="container">
              <Center><div class="center">
                <h2>View Cars</h2>
            </div>
              </center><br><br>
            <div class="blog">
               
               
                <%
                     Registration reg = new Registration(session);
                    ArrayList<car> str =reg.ViewCars( request.getParameter("Type"));
                   for (car a1 : str) { %>
                <div class="row car-details">
                    <div class="col-6">
                        <%  out.println("<img class='img-responsive' src=image/" + a1.getCarImage() + ">"); %>
                    </div>
                    <div class=" col-3">
                        <%
                             
                            out.println("<p> <strong>Car type</strong>: " +a1.getCarType() + " Car  </p>");
                         
                            out.println("<p><b>Description</b> : " + a1.getDescription() + "</p>");
                            out.println("<p><b>Rental Price per Day:</b> Rs " + a1.getRentalPrice() + "</p>");
                            out.println("<a class='btn btn-warning' href='book-now.jsp?id=" + a1.getRegNo() + "' role='button'>Book Now</a>");
                        %>
                    </div>
                </div><br>
                <% }%>
            </div><!--/.row-->
        
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
