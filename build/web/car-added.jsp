<%-- 
    Document   : car-added
    Created on : 15 Oct, 2020, 1:12:00 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car added</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
        
    </head>
    <body>
      <%@ include file="header.jsp" %>  

        <section id="blog" class="container">
            <div class="center">
                <h2>Car Details</h2>
                <p class="lead">Car details added</p>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Car details successfully added </h1>
                        <h4> <a href="add-car.jsp">Click here</a> to add new car</h4>
                    </div>
                </div><!--/.row-->
            </div>
        </section><!--/#blog-->

        <%@ include file="footer.jsp" %>  
    </body>
</html>
