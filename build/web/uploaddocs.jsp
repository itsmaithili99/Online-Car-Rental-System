<%-- 
    Document   : uploaddocs
    Created on : 5 Nov, 2020, 10:17:35 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
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
    </head>
    <body>
        <%@include file="header.jsp" %>
        <br>
    
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
              <% if (request.getAttribute("userId") != null) {%>
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
                       
                       
                        <!--log form-->

                        <h2>Upload Driving License Proof here</h2>
                                <%if(session.getAttribute("userId")!=null){%>
                            <form name="imageupload" method="post" enctype="multipart/form-data">
                                <input type="file" id="file" name="image"/><br><br>
            <input type="submit" name="Upload" onclick="return IsEmpty()"/>
        </form>

         <%}%>

      
                    </div>
                </div>
            </div>
              
        </div>
    </div>
        
        

    
      <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js">
      </script>
      <script type="text/javascript">
         $(function() {
            $( "#date" ).datepicker({dateFormat: 'yy'});
         });
      </script>
   
        <%@include file="footer.jsp" %>
    </body>
</html>
