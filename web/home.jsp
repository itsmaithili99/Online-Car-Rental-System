<%-- 
    Document   : home
    Created on : 9 Oct, 2020, 9:04:02 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fastcar rentals</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <!-- css files -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" >
        <!-- //css files -->

        <!-- web-fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
        <!-- //web-fonts -->


        <style>



            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-color:#F4EBD0;
                background-repeat: no-repeat;
                background-size:cover;
            }
            .container{
                max-width: 1200px;;
                margin:auto;
                padding-left: 25px;
                padding-right: 25px;
            }
            .row{
                display: flex;
                align-items:center;
                flex-wrap: wrap;
                justify-content:space-around;
            }
            .col-2{
                flex-basis: 50%;
                min-width: 300px;
            }
            .col-2 img{
                max-width: 100%;
                padding: 50px 0;

            }
            .col-2 h1{
                font-size: 40px;
                line-height: 60px;
                margin: 25px 0;
            }
            .btn{
                display: inline-block;
                background: #E85A4F;
                color: #fff;
                padding: 8px 30px;
                margin: 30px 0;
                border-radius: 30px;
                text-decoration: none;
            }

            .header .row{
                margin-top: 60px;
            }
            .header .container .navbar h1{
                font-size: 24px;
                float: center;
            }
            .categories{
                margin: 40px 0;
            }
            .categories .col-3{
                flex-basis: 30%;
                min-width: 250px;
                margin-bottom: 0px;

                text-align: center;
                padding: 40px 10px;
                /*    box-shadow: 0 0 20px 0px rgba(0,0,0,0.1);*/
                cursor: pointer;
                transition: transform 0.5s;

            }
            .categories .col-3 img{

                width: 150px;
                height: 150px;
                margin-top: 20px;
                border-radius: 50%;
            }
            .categories .col-3:hover{
                transform: translateY(-10px);
            }
            .small-container{
                max-width: 1080px;
                margin: auto;
                padding-left: 25px;
                padding-right: 25px;
            }
            .col-4{
                flex-basis: 25%;
                padding: 10px;
                min-width: 200px;
                margin-bottom: 50px;
                transition: transform 0.5s;
            }
            .col-4 img{
                width: 100%;
            }


            .error{
                color: red;
                font-weight: bold;
            }

            .card0 {
                box-shadow: 0px 4px 8px 0px ;
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
                background:#7A9D96 ;
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

            .Services #services {
                background-image:linear-gradient(rgba(0,0,0,0.8),rgba(0,0,0,0.8),url(services.jpg));
                background-size: cover;
                background-position: center;
                color:crimson;
                background-color: #EAE7DC;
                background-attachment: fixed;
                padding-top: 50px;
                padding-bottom: 50px;
            }
            .bg-blue {
                color: #00303F;
                background: #E85A4F ;
                padding-top: 10px;
                font-size: bold;
            }
            /** sevices**/
            .about .column {
                float: left;
                width: 25%;
                padding: 5px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
            /*Contact us */
            * {
                box-sizing: border-box;
            }

            /* Style inputs */
            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            /* Style the container/contact section */
            .container {
                border-radius: 5px;
                background-color: #EAE7DC;
                padding: 10px;
            }

            /* Create two columns that float next to eachother */
            .column {
                float: left;
                width: 50%;
                margin-top: 6px;
                padding: 20px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /*features*/

            #feature {
                background: #EAE7DC;
                padding-bottom: 40px;
            }

            .features{
                padding: 0;
            }

            .feature-wrap {
                margin-bottom: 35px;
                overflow: hidden;
            }

            .feature-wrap h2{
                margin-top: 10px;
            }

            .feature-wrap .pull-left {
                margin-right: 25px;
            }

            .feature-wrap i{
                font-size: 48px;
                height: 110px;
                width: 110px;
                margin: 3px;
                border-radius: 100%;
                line-height: 110px;
                text-align:center;
                background: #ffffff;
                color: #c52d2f;
                border: 3px solid #ffffff;
                box-shadow: inset 0 0 0 5px #f2f2f2;
                -webkit-box-shadow: inset 0 0 0 5px #f2f2f2;
                -webkit-transition: 500ms;
                -moz-transition: 500ms;
                -o-transition: 500ms;
                transition: 500ms;
                float: left;
                margin-right: 25px;
            }

            .feature-wrap i:hover {
                background: #c52d2f;
                color: #fff;
                box-shadow: inset 0 0 0 5px #c52d2f;
                -webkit-box-shadow: inset 0 0 0 5px #c52d2f;
                border: 3px solid #c52d2f;
            }


        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="header"><br>
            <center>
                <h1>   Pick Enterprise. We'll pick you up.</h1>

            </center>
        </div><br>
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
                            <section id="feature" style="background-color:#EAE7DC" >
                                <div class="container">
                                    <div class="center wow fadeInDown">
                                        <h2  style="font-size: 30px;">Reasons To Choose Us</h2><br>
                                        <p class="lead" style="font-size: 20px;"><i class="fa fa-bullhorn secondary-color"></i> A large selection of quality rental cars to suit your budget</p><br>
                                        <p class="lead"><i class="fa fa-comments secondary-color"></i> 16 independently owned and operated car rental branches</p><br>
                                        <p class="lead"><i class="fa fa-cloud-download secondary-color"></i> Competitive car hire rates</p><br>
                                        <p class="lead"><i class="fa fa-leaf secondary-color"></i> Friendly staff for 7 day, personal service</p><br>
                                        <p class="lead"><i class="fa fa-cogs secondary-color"></i> Free pick-ups and no charge for additional drivers</p><br>
                                        <h2 class="animation animated-item-1">Get Started and Rent for long term</h2><br>

                                        <center><a class="btn btn-danger" style="background-color: #E85A4F; font-size: bold;color:black;" href="view-cars.jsp?cars=all">View Cars</a></center>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div><br><br> 

        <div class="ct-pageWrapper" id="ct-js-wrapper">
            <section class="company-heading intro-type" id="parallax-one">
                <section class="story-section company-sections ct-u-paddingBoth100 paddingBothHalf noTopMobilePadding" id="section">
                    <div class="container text-center">
                        <center>
                            <h2>WHAT DRIVES US</h2>
                        </center>
                        <div class="col-md-8 col-md-offset-2">
                            <div class="red-border"></div>
                            <p >We are a leading online car rental service for hire. Our website is the leading portal for finding the best car rental deals in the world. We have created an easy to use online car rental application which allows you to book and pay for your rental car in minutes. Our team of experienced, highly qualified professionals are available to assist you with booking and booking payments..</p>
                           <center>
                            <h2>OUR PARTNERS</h2>
                            <p>We are Proud to have <strong>Hyundai,Maruthi Suzuki,Renault,..</strong>as our partners</p>
                        </center>
                           
                        </div>
                    </div><br><br>
                </section>
                <section class="about ">
                    <center>
                        <h2>Our Services</h2></center>
                    <div class="row">
                        <div class="container">
                            <div class="column">
                                <h3  style="color:black"> <i class="fa fa-car"></i> Book a Tourist car </h3>
                                <p style="color:black"> We help our patrons by offering them proper solutions as per their exact demands </p>
                            </div>
                            <div class="column">
                                <h3  style="color:black"><i class="fa fa-credit-card-alt"></i> Online payment</h3>
                                <p style="color:black">Go for online transaction without any fear of fraud and miscommunication  </p>
                            </div>
                            <div class="column"> <h3  style="color:black"> <i class="fa fa-road"></i> 24X7 Road assistance </h3>
                                <p style="color:black">We have round-the-clock, pan India partners. Help is never far away from you.</p> </div>
                            <div class="column">
                                <h3  style="color:black"><i class="fa fa-money"></i> Affordable price packages </h3>
                                <p style="color:black">Choose a balance of time and kilometers that works best for you.</p>
                            </div>
                        </div>
                    </div>
                </section><br><br>
                <div class="container">
                    <div style="text-align:center">
                        <h2>Contact Us</h2>
                        <p>Swing by for a cup of coffee, or leave us a message:</p>
                    </div>
                    <div class="row">
                        <div class="column">
                            <img src="image/contact.jpg" style="width:100%">
                        </div>
                        <div class="col-6">
                            <center>
                                <div class="col-12"><h2><i class="fa fa-envelope" aria-hidden="true"> Mail us:</i> </h2>
                                    <br><h3>fastcarenatals@gmail.com</h3></div><br> 
                                    <div class="col-12"><h2> <i class="fa fa-phone-square" aria-hidden="true"> Call us: </i></h2>
                                    <br><h3>08192-22456</h3></div><br>
                                    <div class="col-12"><h2><i class="fa fa-address-card-o" aria-hidden="true"> Address: </i></h2>
                                    <br><h3>124/5,Above Cafe Coffee day,Davangere-577004</h3></div>  
                            </center>
                        </div>
                    </div>
                </div>

        </div>
<!--        <div style="background-color:#03045E">
            <center style="background-color:#03045E">
                <div class="bg-blue py-4 ">
                    <h5 style=" color: #fff;font-size: 30px;">Copyright &copy; 2020. All rights reserved</h5><br>
                    <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
                    </div>
                </div>
            </center>
        </div>-->
 <%@include file="footer.jsp"%>
 
    </body>
</html>
