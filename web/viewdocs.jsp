<%-- 
    Document   : viewdocs
    Created on : 7 Nov, 2020, 10:01:07 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.client"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Registration" %>
<%@page import="model.client" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    </head>
    <body>
        <%@include file="header.jsp" %>
             <section id="blog" class="container">
            <center><div class="center">
                <h2>DL Documents details</h2>
            </div>
                </center>
           <div class="blog">
                <div class="row">
                    <div class="col-md-12">



                        <% if (session.getAttribute("uname")!=null) { %>
                        <table class="table table-condensed table-bordered">
                            <thead class="icon"> <tr>
                                    <th>Name</th>
                                     <th>Driving License Number</th>
                                    <th>Expirationyear</th>
<!--                                    <th>DLProof</th>
                                   -->
                                </tr> </thead>
                                <%
                                    Registration reg = new Registration(session);
                                    ArrayList<client> data = reg.getDLdocs();
                                    String statusClass = "", btn = "";
                                    int count = 1;
                                    for (client r : data) {
                                        
                                %>
                            <tr class="<%=statusClass%>">
                               <td> <%= r.getName()%></td>
                                <td> <%= r.getDrivingLicense()%></td>
                                <td> <%= r.getExpirationyear()%></td>
                             
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
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp" %>
    </body>
</html>
