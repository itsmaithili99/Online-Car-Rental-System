<%-- 
    Document   : viewdetails
    Created on : 14 Nov, 2020, 10:26:47 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <%@include file="footer.jsp" %>
    </body>
</html>
