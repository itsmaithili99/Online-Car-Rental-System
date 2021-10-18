<%-- 
    Document   : register
    Created on : Oct 1, 2020, 11:58:29 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-validation/additional-methods.min.js"></script>
        <script type="text/javascript"></script>
        <style>
            #msg
            {
                background: linear-gradient(to right,  #348f50, #56b4d3);
                color:black;
                border-radius: 5px;
                width:25%;
                font-weight: bold;
                font-size: 25px;
                padding: 5px;
            }

            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-image: url("image/=bmw.jpg");
                background-repeat: no-repeat;
                background-size:cover;
            }

            .error{
                color: red;
                font-weight: bold;
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
                background-color: #1A237E;
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
                background:#2b3a67;
                padding-top: 10px;
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
            #navbar{
                position: sticky;
                top:0;
                z-index: 10;
            }
            .navbar-brand img{
                height: 80px;
                padding-left: 30px;

            }
            .navbar-nav li{
                padding: 0 10px;
            }
            .navbar-nav li a {
                float: right;
                text-align: right;
            }
            #nav-bar ul li a:hover{
                color: #007bff!important;
            }
            .navbar{
                background: linear-gradient(to right,  #348f50, #56b4d3);
            }
            .navbar-toggler {
                border: none!important;
            }
            .nav-link{
                color:#555!important;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <script>

            $(document).ready(function () {
                jQuery.validator.addMethod("lettersonly", function (value, element) {
                    return this.optional(element) || /^[a-z]+$/i.test(value);
                }, "Letters only please");
                $("#regform").validate({
                    rules: {
                        name: {
                            lettersonly: true,
                            minlength: 3
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        address: {
                            required: true
                        },
                        city: {
                            required: true
                        },
                        phone: {
                            required: true,
                            number: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        pwd: {
                            required: true,
                            minlength: 5
                        },
                        re_pass: {
                            required: true,
                            minlength: 6,
                            equalTo: "#pwd"
                        },
                        active: {
                            required: true,
                            minlength: 3,
                        }

                    },
                    messages: {
                        name: {
                            required: "You must enter a Username",
                            first_name: "Please enter name"
                        },
                        email: {
                            required: "Enter your Email",
                            email: "Please enter a valid email address like abc@gmail.com.",
                        },
                        address: {
                            required: "Enter a valid address proof",
                        },
                        city: {
                            required: "Enter a valid city name",
                        },
                        phone: {
                            required: "Please enter a valid phone number ",
                        },
                        pwd: {
                            required: "Please provide a password",
                            minlength: "Your password must be at least 5 characters long"
                        },
                        re_pass: {
                            required: "Please reenter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                            equalTo: "mismatch password"
                        }



                    }
                });
            });
        </script>


        <%@include file="header.jsp" %>
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
                        <!---form log--->
                        <form id="regform" action="register" method="Post">
                            <div class="reg-form">
                                <div class="row px-3"> <label class="mb-1">Name</label> 
                                    <input class="mb-4" type="text"  id="name" name="name" placeholder="Enter a valid  user name "> </div>
                                <div class="row px-3"> <label class="mb-1">Email</label> 
                                    <input type="email"  id="name" name="email" placeholder="Enter valid email"> </div>
                                <div class="row px-3"> <label class="mb-1">Address</label> 
                                    <input type="text"  id="name" name="address" placeholder="Enter valid address"> </div>
                                <div class="row px-3"> <label class="mb-1">City</label> 
                                    <input type="text"  id="name" name="city" placeholder="Enter valid city name"> </div>
                                <div class="row px-3"> <label class="mb-1">Phone</label> 
                                    <input type="number"  id="number" name="phone" placeholder="Enter valid Phone number"> </div>

                                <div class="row px-3"> <label class="mb-1">Password</label> 
                                    <input type="password"  id ="password" name="pwd" placeholder="Enter valid password"> </div>
                                <div class="row px-3"> <label class="mb-1">Repeat Password</label> 
                                    <input type="password"  id ="password" name="re_pass" placeholder="Enter valid password again"> </div>

<!--                                <div class="row px-3"> <label class="mb-1">Active</label> 
                                    <input type="text"  id="number" name="active" placeholder="Enter active"> </div>-->

                                <div class="row px-3 mb-4">
                                    <div class="custom-control custom-checkbox custom-control-inline"> <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> <label for="chk1" class="custom-control-label text-sm">Remember me</label> </div> <a href="forget.jsp" class="ml-auto mb-0 text-sm">Forgot Password?</a>
                                </div>
                                <div class="row mb-3 px-3"> <button type="submit"  name="register" value="register" class="btn btn-blue text-center">Register</button></div>
                                <div class="row mb-4 px-3"> <small class="font-weight-bold">Already  have an account? <a class="text-danger" href="login.jsp">Login</a></small> </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>  

    <div class="footer-col-1">
        <center>
            <div class="bg-blue py-4">
                <h5> Copyright &copy; 2020. All rights reserved</h5>
            </div>
        </center>
    </div>
</body>
</html>
