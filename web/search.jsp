<%-- 
    Document   : search
    Created on : Oct 7, 2020, 9:56:42 AM
    Author     : Acer
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.client"%>
<%@page import="model.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
            
        <title>JSP Page</title>
    </head>
    <style>
        .jumbotron{
            background-color: white;
        }
    </style>
    <body>
        <%@include file="header.jsp"%>
    <center>
        <% if (session.getAttribute("id") != null && session.getAttribute("id").equals("1")){%>
        <font color="blue" size ="4">
        <h2>Search here</h2>
        </font>
        <br><br>
        <form action="search" method="POST">
            <div class="form-group col-md-4">
                <label>Client id:</label>
                <input type="text" name="id" class="form-control">
            </div>
            <br>
            <button type="submit" class="btn  btn-primary" name ="submit">Search</button>
        </form>
      
        <% if (request.getParameter("id") != null) {%>
        <div class="container">
            <div class="jumbotron">

                <table class="table">
                    <thead>
                        <tr style="background-color: buttonface;">
                    <br>

                    <th>id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>

                    </tr>

                    </thead>
                    <tbody id="table">
                        <%Registration reg = new Registration(session);
                            ArrayList<client> mydata = reg.getUserInfo(request.getParameter("id"));
                            Iterator<client> itr = mydata.iterator();
                            while (itr.hasNext()) {
                                client c = itr.next();
                            
                        %>
                        <tr>
                            <td><%=c.getUserId()%></td>
                            <td><%=c.getName()%></td>
                            <td><%=c.getEmail()%></td>
                            <td><%=c.getPhone()%></td>
                        </tr>
                           <%}%>
                    </tbody>
                </table>
            </div>
        </div>
                <%}
                }%>
    </center>
                    
           <%@include file="footer.jsp"%>           
</body>
</html>
