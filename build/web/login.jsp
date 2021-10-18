<%-- 
    Document   : login
    Created on : 9 Oct, 2020, 2:03:55 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <style>
         body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-image: url("image/=bmw.jpg");
                background-repeat: no-repeat;
                background-size:cover;
            }
            .error{
                font-weight: bold;
                color: red;
            }

            .card0 {
                box-shadow: 0px 4px 8px 0px #757575;
                border-radius: 0px
            }

            .card2 {
                margin: 0px 40px
            }

            .logo {
                width: 200px;
                height: 100px;
                margin-top: 20px;
                margin-left: 35px
            }

            .image {
                width: 530px;
                height: 500px
            }

            .border-line {
                border-right: 1px solid #EEEEEE
            }

            .facebook {
                background-color: #3b5998;
                color: #fff;
                font-size: 18px;
                padding-top: 5px;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                cursor: pointer
            }

            .twitter {
                background-color: #1DA1F2;
                color: #fff;
                font-size: 18px;
                padding-top: 5px;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                cursor: pointer
            }

            .linkedin {
                background-color: #2867B2;
                color: #fff;
                font-size: 18px;
                padding-top: 5px;
                border-radius: 50%;
                width: 35px;
                height: 35px;
                cursor: pointer
            }

            .line {
                height: 1px;
                width: 45%;
                background-color: #E0E0E0;
                margin-top: 10px
            }

            .or {
                width: 10%;
                font-weight: bold
            }

            .text-sm {
                font-size: 14px !important
            }

            ::placeholder {
                color: #BDBDBD;
                opacity: 1;
                font-weight: 300
            }

            :-ms-input-placeholder {
                color: #BDBDBD;
                font-weight: 300
            }

            ::-ms-input-placeholder {
                color: #BDBDBD;
                font-weight: 300
            }

            input,
            textarea {
                padding: 10px 12px 10px 12px;
                border: 1px solid lightgrey;
                border-radius: 2px;
                margin-bottom: 5px;
                margin-top: 2px;
                width: 100%;
                box-sizing: border-box;
                color: #2C3E50;
                font-size: 14px;
                letter-spacing: 1px
            }

            input:focus,
            textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #304FFE;
                outline-width: 0
            }

            button:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                outline-width: 0
            }

            a {
                color: inherit;
                cursor: pointer
            }

            .btn-blue {
                background-color:#122620;
                width: 150px;
                color: #fff;
                border-radius: 2px
            }

            .btn-blue:hover {
                background-color: #000;
                cursor: pointer
            }

            .bg-blue {
                color: #fff;
                background:linear-gradient(to right,  #348f50, #56b4d3);
            }


            @media screen and (max-width: 991px) {


                .card1 pb-5  .row px-3 justify-content-center mt-4 mb-5 border-line  .image {
                    width: 500px;
                    height: 400px
                }

                .border-line {
                    border-right: none
                }

                .card2 {
                    border-top: 1px solid #EEEEEE !important;
                    margin: 0px 15px
                }
            }
            /**  Footer**/
   .bg-blue {
                 color: #fff;
                background:#2b3a67;
                padding-top: 10px;
            }


            #msg   {
                background: linear-gradient(to right,  #348f50, #56b4d3);
                color:black;
                border: 1px solid red;
                width:24%;
                font-weight: bold;
                font-size: 25px;
                padding: 5px;
                margin-top: 5px;
                border-radius: 5px;

            }

        </style>
    <body>
        <script>
            $(document).ready(function () {
                jQuery.validator.addMethod("lettersonly", function (value, element) {
                    return this.optional(element) || /^[a-z]+$/i.test(value);
                }, "Letters only please");
                $("#log").validate({
                    rules: {
                        email: {
                            required: true,
                            minlength: 3
                        },
                        password: {
                            required: true,
                            minlength: 5
                        }
                    },
                    messages: {
                        email: {required: "You must enter a mailid",
                            first_name: "Please enter name"},
                        password: {
                            required: "Enter the proper password"
                        }
                    }



                });
            });
        </script>
         <%@include file="header.jsp"%>
    <center>
        <% if (request.getAttribute("status") != null) {%>
        <div id="msg"><%= request.getAttribute("status")%><br></div>
            <%}%>
    </center>
    <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
        <div class="card card0 border-0">
            <div class="row d-flex">
                <div class="col-lg-6">
                    <div class="card1 pb-5">

                        <div class="row px-4 justify-content-center mt-4 mb-5 border-line"> <img src="image/=bmw.jpg" class="image"> </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card2 card border-0 px-4 py-5">
                        <!--signin details-->
                        <div class="row mb-4 px-3">
                            <h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
                            <div class="facebook text-center mr-3">
                                <i class="fa fa-facebook-official" aria-hidden="true"></i>
                            </div>
                            <div class="twitter text-center mr-3">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </div>
                            <div class="linkedin text-center mr-3">
                                <i class="fa fa-linkedin" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="row px-3 mb-4">
                            <div class="line"></div> <small class="or text-center">Or</small>
                            <div class="line"></div>
                        </div>
                        <!--log form-->

                        <form id="log" method="Post" action="register" >
                            <div class="row px-3"> <label class="mb-1"> Email</label> 
                                <input class="mb-4" type="text" id="name" name="email" placeholder="Enter a valid username"> </div>
                            <div class="row px-3"> <label class="mb-1">Password</label> 
                                <input type="password" name="pwd" placeholder="Enter password"> </div>

                            <!--checkbox-->
                            <div class="row px-3 mb-4">
                                <div class="custom-control custom-checkbox custom-control-inline"> <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> <label for="chk1" class="custom-control-label text-sm">Remember me</label> </div> <a href="forget.jsp" class="ml-auto mb-0 text-sm">Forgot Password?</a>
                            </div>
                            <!--submit-->
                            <div class="row mb-3 px-3"> <button type="submit"  name="login" class="btn btn-blue text-center">Login</button> </div>
                            <div class="row mb-4 px-3"> <small class="font-weight-bold">Don't have an account? <a class="text-danger" href="Registration.jsp">Register</a></small> </div>
                        </form>
                    </div>
                </div>
            </div>
              
        </div>
    </div>
    <div class='footer-col-1'>
    <center style="background-color:#03045E;">
        <div class="bg-blue py-4" >
            <h5>Copyright &copy; 2020. All rights reserved</h5><br>
            <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
            </div>
        </div>
    </center>
        </div>
    </body>
</html>
