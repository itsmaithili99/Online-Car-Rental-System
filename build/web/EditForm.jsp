<%-- 
    Document   : EditForm
    Created on : Oct 5, 2020, 11:37:28 AM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>Update</title>
    </head>
    <body>

        <%@include file="header.jsp"%>
    <center>
        <% if (session.getAttribute("uname") != null) {
                Registration reg = new Registration(session);
                client c = reg.getInfo();%>
        <font color="blue" size="5"><br>
        <h2> Edit Profile</h2>
        </font>
        <form action='update' method='POST'>
            <div class="container ">
                <div class="jumbotron">
                    <div class="form-group col-md-3">
                        <label >Name</label>
                        <input type="text" class="form-control"  name="name" value="<%=c.getName()%>">
                    </div>
                    <div class="form-group col-md-3">
                        <label >Driving  License Number</label>
                        <input type="number" class="form-control"  name="dlno" value="<%=c.getDrivingLicense()%>">
                    </div>
                    <div class="form-group col-md-3">
                        <label >Phone Number</label>
                        <input type="number" class="form-control"  name="phone" value="<%=c.getPhone()%>">
                    </div>
                    <div class="form-group col-md-3">
                        <div><label>Expiration year :</label></div> 
                        <input type="date"  id="date" name="exp" size="50" value="<%=c.getExpirationyear()%>"> 
                    </div>
                   
                    <div  >
                    <center>
                        
                     <button type="submit" class="btn btn-primary" name="submit">Update</button>
                    </center></div>
                </div>
            </div>
        </form>
        <%}%>
    </center>
            <script>
            function IsEmpty() {
                var imgs = document.getElementById('file').value;
                if (imgs == null || imgs == "" || imgs == "null") {
                } else {
                    document.imageupload.action = "upload";
                    document.imageupload.submit();
                }
            }
        </script>
        <br><br><br><br><br><br><br><br><br><br><br><br>
    <%@include file="footer.jsp"%>

</body>
</html>
