<%-- 
    Document   : header
    Created on : 9 Oct, 2020, 8:55:59 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <style>
            ul {
                list-style-type: none;
                /*width:100%;*/
                margin: 0;
                padding: 10px;
                overflow: hidden;
                background-color:#122620;
            }
            li img{

                height: 80px;
                padding-left: 30px;
            }

            li {
                float: right;
                position: sticky;
                top:0;
                z-index: 10;
            }
            li a {
                display: block;
                color:#fff;
                font-weight: bolder;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                margin-top: 13px;
            }

            li a:hover {
                background: D8C3A5;
            }
            li .uname i{
                margin-right: 10px; 
            }
            .uname{
                margin-top: 13px;
                color: #F4EBD0;
                padding: 14px 16px;
                margin-right: 13px;
            }

            .dropdown{
                float: right;
                position: sticky;
                top:0;
                z-index: 5;
                background-color:#122620;
                margin-top: 13px;
                border-radius: 5px;
                border-color: #00303F;
                color: #fff;
                font-weight: bolder;
                text-decoration: none;
                margin-right: 5px;
                padding: 14px 10px;
                display: block;
            }

            .dropdown option{
                display: block;
                background-color: #122620;
                color: #fff;
                font-weight: bolder;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                margin-top: 13px;

            }        
        </style>
    </head>
    <body  style="margin:0;">
        <ul>
            <% if (session.getAttribute("uname") != null) {%>
            <li class="uname"><i class="fa fa-user-circle" aria-hidden="true" style="margin-right: 5px;"></i><%=session.getAttribute("uname")%></li>
            <li><a href="register?logout=yes">LOGOUT</a></li>
            <% if(!session.getAttribute("userId").equals("1")) {%>
            
<!--            <li><a href="EditForm.jsp">Edit Profile</a></li>
            <li><a href="booked-car.jsp">View Booking</a></li>
            <li><a href="uploaddocs.jsp">Upload document</a></li>
             <li><a href="viewdocs.jsp">view document</a></li>-->
<li>
    <select class="dropdown" onchange="location = this.value;">
                    <option disabled [value]="" selected>USER PANEL</option>
<!--                    <option value="#view-user-accounts.jsp">View user accounts</option>-->
<!--                    <option value="new mail.jsp">New mail</option>-->
                    <option value="EditForm.jsp">Edit Profile </option>
                    <option value="booked-car.jsp">View Booking</option>
                     <option value="uploaddocs.jsp">Upload Document</option>
                    <option value="viewdocs.jsp">View Document</option>
    </select>
</li>
            <%}%>
          
            <% if (session.getAttribute("userId").equals("1")) {%>
           
            <li>
                <select class="dropdown" onchange="location = this.value;">
                    <option disabled [value]="" selected>ADMIN PANEL</option>
<!--                    <option value="#view-user-accounts.jsp">View user accounts</option>-->
<!--                    <option value="new mail.jsp">New mail</option>-->
                    <option value="add-car.jsp">Add car info</option>
                    <option value="rental-requests.jsp">Rental request</option>
                     <option value="approvedlist.jsp">Approved List</option>
                    <option value="available-cars.jsp">Available cars</option>
                    <option value="rented-cars.jsp">Rented cars</option>
                    <option value="registered-users.jsp">Registered users </option>
                    <option value="remove-car.jsp">Remove Car</option>
                </select>
           </li>
            <%}%>
            <%} else {%>
            <li><a href="Registration.jsp">REGISTER</a></li>

            <li><a href="login.jsp">LOGIN</a></li>
                <%}%>
            <li><a class="active" href="home.jsp">HOME</a></li>
            <li style="float: left;"><img src="image/logo.png"></li>
        </ul>
        <script>
            $('#dropdown').change(function () {
                window.location = $(this).val();
            });
        </script>
    </body>
</html>
