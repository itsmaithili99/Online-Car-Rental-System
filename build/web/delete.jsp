<%-- 
    Document   : delete
    Created on : 14 Oct, 2020, 10:20:33 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-image: url("image/=bmw.jpg");
                background-repeat: no-repeat;
                background-size:cover;
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
            button{
                color: blue;
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
        </style>
    </head>
    <body>
        <%@include file="admin.jsp" %>
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
                            <div class="element-main">
                                <h1>Remove a Car?</h1><br>
                                <p> Please Fill Following Details to Remove Car</p><br>
                                <form action="delete" method="post">
                                    <input type="text" name = "carid" placeholder="Enter CarID of Car to Remove" required=""><br><br>
                                    <input type="submit" value="Remove Car">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
