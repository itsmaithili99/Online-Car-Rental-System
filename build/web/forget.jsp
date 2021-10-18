<%-- 
    Document   : forget
    Created on : 7 Nov, 2020, 9:17:49 AM
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

        <title>JSP Page</title>
         <style>
                     .container{
            max-width: 550px;
            background: #c52d2f;
            color: white;
            padding: 2rem 2rem;
        }
        .error{
            color:red;
        }
        .status{
            background: white;
            color: white;
            text-align: center;
            margin: 20px;
            font-weight: bold;
            font-size: 20px;
        }

           .footer-col-1 .bg-blue {
               color: black;
                background:#c52d2f;
                padding-top: 10px;
            } 
          
        .container{
            max-width: 550px;
            background: #c52d2f;
            color: white;
            padding: 2rem 2rem;
        }
        .error{
            color:red;
        }
        .status{
            background: #6b170a;
            color: white;
            text-align: center;
            margin: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
                <%if (request.getAttribute("status") != null) {%>
        <div class="status"><%=request.getAttribute("status")%></div>
        <%}%>
        <br><br>
        <div class="container">
            <form id="forgot" method="post" action="register1">
                <h1>Forgot Password</h1>
                <p style="clear: left;text-align: left;margin-bottom: 20px;line-height: 21px;font-size: 13px;">Enter your email to recover password.</p>
                <div class="form-group">
                    <div>
                        <input id="email" class="form-control" style="width:70%" type="text" placeholder="Email" name="email" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <div  style="width:100%">
                        <input type="submit" name="forgotpassword" value="Submit" >
                    </div>
                </div> 
            </form>  
        </div>
        <script>
            jQuery.validator.addMethod("email1", function (value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value);
            }, "Enter valid email id");
            jQuery(document).ready(function ($) {
                $("#forgot").validate({
                    ignore: [],
                    rules: {
                        email: {
                            required: true,
                            email1: true
                        }
                    }
                });
            });
                </script><%@include file="footer.jsp" %>

<!--        
         <div class='footer-col-1'>
            <center>
                <div class="bg-blue py-4 ">
                    <h5>Copyright &copy; 2020. All rights reserved</h5><br>
                    <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
                    </div>
                </div>
            </center>
        </div>-->
        
    </body>
</html>
