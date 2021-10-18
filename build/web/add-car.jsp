<%-- 
    Document   : add-car
    Created on : 15 Oct, 2020, 9:35:22 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add Car | Rent A Car</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/responsive/1.0.5/responsive.min.js" ></script>
        <style>

            body {
                color: #000;
                background-color: #EAE7DC;
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
                background-color: #00303F;
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
                background:#c52d2f;
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
           .footer-col-1 .bg-blue {
               color: #00303F;
                background-color:#03045E;
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
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
                        <section id="blog" class="container">
                            <div class="center">
                                <h2>Add new car</h2>
                            </div>
                            <div class="blog">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-8">
                                        <%  if (session.getAttribute("userId").equals("1")) { %>
                                        <form class="form-horizontal" method="POST" action="AddCarProcess" enctype="multipart/form-data" data-toggle="validator">

                                            <div for="inputEmail3" class="mb1">Registration Number</div>

                                            <input type="text" name="regNo" class="form-control" placeholder="Car licenece number" required>

                                            <div for="inputPassword3" class="mb1">Car Type</div>

                                            <select class='form-control' name="carType">
                                                <option selected="true" disabled="disabled">- Select -</option>
                                                <option>Compact</option>
                                                <option>Full Size</option>
                                                <option>Intermediate</option>
                                               
                                                
                                            </select>



                                            <div for="inputEmail3" class="mb1">Description</div>

                                            <textarea name="description" rows="3" class="form-control" required> </textarea>
                                            <div for="inputEmail3" class="mb1">Rental Price per Day</div>
                                            <input type="number" name="rentalPrice" class="form-control" placeholder="Price" required></div>
                                            </div>

                                            <div for="inputEmail3" class="mb1">Status</div>

                                            <select class='form-control' name="active" required>
                                                <option selected="true" disabled="disabled">- Select -</option>
                                                <option>active</option>
                                                <option>In-active</option>
                                            </select>                                



                                            <div for="inputEmail3" class="mb1">Car image</div>

                                            <input type="file" name="carImage" class="form-control" required>


                                            <center>
                                                <div class="form-group">
                                                    <div class="mb1">
                                                        <button type="submit" class="btn btn-success btn-lg"
                                                                style="background:#03045E; font-weight: bold;"> SUBMIT </button>
                                                    </div>
                                                </div>
                                            </center>
                                        </form>  
                                        <% } else { %>
                                        <div class="alert alert-danger" role="alert">
                                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                            <strong> Please login: </strong> You must be logged-in to view this page
                                        </div>                           
                                        <% }%>
                                    </div><!--/.col-md-8-->
                                </div><!--/.row-->
                            </div>
                        </section>

                    </div>
                </div>
            </div>

        
    </div>  
   <%@include file="footer.jsp" %>
</body>
</html>
