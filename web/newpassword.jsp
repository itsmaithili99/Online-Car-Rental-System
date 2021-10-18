<%-- 
    Document   : newpassword
    Created on : 7 Nov, 2020, 9:25:31 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <style>
                 .footer-col-1 .bg-blue {
               color: black;
                background:#c52d2f;
                padding-top: 10px;
            } 
            </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
              <%if (request.getAttribute("status") != null) {%>
        <div class="status"><%=request.getAttribute("status")%></div>
        <%}%>
        <div class="container">
            <!--<div class="jumbotron">-->
            <%if (session.getAttribute("uname") != null) {%>
            <form id="newpass" method="post" action="register1">
                <!--<div class="forgot">-->
                <span style="font-size: 29px;font-weight: bold;">Enter your new password</span>
                <div class="form-group" style="margin-top: 10px;">
                    <div>
                        <input id="n_password" class="form-control" style="width:50%" type="password" placeholder="Password" name="n_password"> 
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <input id="c_password" class="form-control" style="width:50%" type="password" placeholder="Confirm Password" name="c_password"> 
                    </div>
                </div>
                <div class="form-group">
                    <div  style="width:100%">
                        <input type="submit" name="submit_NewPassword" value="Submit" >
                        <!--<input type="hidden" name="SubmitEmail" value="submitemail"/>-->
                    </div>
                </div> 
                <!--</div>-->
            </form>  
            <%} else {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                    }%>
            </div>
        </div>
        <script>
            jQuery(document).ready(function ($) {
                $("#newpass").validate({
                    ignore: [],
                    rules: {
                        n_password: {
                            required: true,
                            minlength: 6
                        },
                        c_password: {
                            required: true,
                            equalTo: "#n_password"
                        }
                    }
                });
            });
        </script>

        <%@include file="footer.jsp" %>
        
    </body>
</html>
