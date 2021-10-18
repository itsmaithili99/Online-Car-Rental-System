<%-- 
    Document   : new mail
    Created on : 4 Nov, 2020, 1:27:57 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>new mail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .bg-blue {
                color: #fff;
                background:#c52d2f;
                padding-top: 5px;

            }
            .h5{
                color:black;
            }
        </style>
    </head>
    <body>
          <%@include file="header.jsp" %>
              
         <form action="EmailSendingServlet" method="post">
        <table border="0" width="35%" align="center">
            <center><h2>Send New E-mail</h2></center>
            <tr>
                <td width="50%">Recipient address </td>
                <td><input type="text" name="recipient" size="50"/></td>
            </tr>
            <tr>
                <td>Subject </td>
                <td><input type="text" name="subject" size="50"/></td>
            </tr>
            <tr>
                <td>Content </td>
                <td><textarea rows="10" cols="39" name="content"></textarea> </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Send"/></td>
            </tr>
        </table>
         
    </form>
        
      <%@include file="footer.jsp" %>
    </body>
</html>
