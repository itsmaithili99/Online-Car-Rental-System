<%-- 
    Document   : book-now
    Created on : 26 Oct, 2020, 11:38:59 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Registration"%>
<%@page import="model.car" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Book now </title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

    </head>
    <body>
        
             <%@ include file="header.jsp" %>
        <section id="blog" class="container">
            <center><div class="center">
                <h2>Book Now</h2>
            </div>
            </center>
            <div class="blog">
               
               
                <%  Registration reg = new Registration(session);
                    car c = reg.bookcar(request.getParameter("id"),request.getParameter("userId"));
                %>
                <form action="book.jsp" method="post" >
                    <div class="row car-details">
                        <div class="col-md-12">
                            <%  out.println("<img class='img-responsive' src='image/" + c.getCarImage() + "'>");%>
                        </div><br><br>
                        <div class="col-md-12">
                            <%  out.println("<p> <strong>Car type</strong>: " +c.getCarType() + " Car  </p>"); %>
                        </div><br>
                         <div class="col-md-12">
                            <% out.println("<p><b>Description</b> : " + c.getDescription() + "</p>"); %>
                        </div><br>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Date From</label>
                                    <div class='input-group date'>
                                        <input type='date' name="from" id="dateFrom" class="form-control" required/>
                                    </div>
                                </div><br>
                                <div class="form-group col-md-6">
                                    <label>Number of days</label>
                                    <div class='input-group'>
                                        <select id="day" name="days" class="form-control" required onchange="calculateAmount(this.value)">
                                            <option  id= "days" selected disabled="disabled"> - Days - </option>
                                            <% for (int a = 1; a <= 10; a++) {
                                                    out.print("<option value='" + a + "'>" + a + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Rent per day</label>
                                    <div class='input-group'>
                                        <input type='text' class="form-control" id="rent" name="rent" value="<%= c.getRentalPrice()%>" readonly="readonly" /> 
                                    </div>
                                </div>
<!--                                <div class="form-group col-md-6">
                                    <label>Total rent</label>
                                    <div class='input-group'>
                                        <input type='text' class="form-control" id="totalrent" name="totalrent" value="<%= c.getRentalPrice()%>" readonly="readonly" /> 
                                    </div>
                                </div>-->
                            </div>
                            <input type='hidden' name="regNo" value="<%= request.getParameter("id")%>" /> 
                              <input type='hidden' name="userId" value="<%= request.getParameter("userId")%>" /> 
                            <div class="row">
                                <center><div class="col-md-6">
                                    <!--<a href="book.jsp" class="btn btn-secondary">Confirm Booking </a>-->
                                    <input type="submit" class="btn btn-info" value="Confirm Booking" />
                                </div>
                                </center>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script language="javascript" type="text/javascript">
  $(document).ready(function (){
 function calculateAmount(val) {
    rent= Number(document.getElementById('rent').value);
                var totalrent = val * rent;
                /*display the result*/
                var divobj = document.getElementById('totalrent');
                divobj.value = totalrent;
            }
  }

</script>
    </body>
</html>
