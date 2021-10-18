<%-- 
    Document   : User
    Created on : Oct 7, 2020, 12:05:51 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
<style>
            .jumbotron{
background: white;
            }
</style>
<% if (session.getAttribute("id") != null &&session.getAttribute("id").equals("1")) {%>
<script>
            $(document).ready(function() {
                $.ajax({
type: 'post',
url: 'fetch',
data: 'FetchUser=Fetchuser',
dataType: 'json',
success: function getuserdata() {
var table1 = $("#table");
if (data.jsonarray) {
                            $.each(data.jsonarray, function(key, value)
                            {
varrowNew = $("<tr id='delete" + value.id + "'><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
rowNew.children().eq(0).text(value.id);
rowNew.children().eq(1).text(value.name);
rowNew.children().eq(2).text(value.email);
rowNew.children().eq(3).text(value.number); 

rowNew.children().eq(4).append('<button type="button" class="btnbtn-danger" onclick="Delete(' + value.id + ');">Delete</button>');
rowNew.appendTo(table1);
$(".data").append('<div id='delete" + value.id + "' style='width:20%;display:inline-block'><div><label>id:</label>'+ value.id + '</div><div><label>Name:</label>' + value.name + '</div><div><label>Email:</label>' + value.email + '</div><div><label>Mobile:</label>' + value.number  + '</div><div><button type='button' class='btnbtn-danger' onclick='Delete(" + value.id + ');'>Delete</button></div></div>');
                            });
                        } else {
varrowNew = $("<tr style='text-align:center'><td id='start' colspan='6'></td></tr>");
rowNew.children().eq(0).text(data.status);
rowNew.appendTo(table1);
                          $(".data").append("<div>No data found</div>");
                        }
                    }
                });
            });

function Delete(id) {
                $.ajax({
type: 'post',
url: 'fetch',
data: 'DeleteUser=DeleteUser&&slno=' + id,
dataType: 'json',
success: function(data) {
if (data.status == "Deleted") {
                            $("#delete" + id).remove();
alert("Successfully Deleted");
                        }
                    }
                });
            }
</script>
<div class="container">
<div class="jumbotron">
<font color="blue" size="4">
<h2 style="text-align:center"> Delete Users </h2>
</font>
<table id="table" class="table" cellspacing="0" cellpadding="0" style="margin-bottom: 10px;">
<tr>
<th>id</th>
<th>Name</th>
<th>Email</th>
<th>Number</th>
<th>Delete</th>
</tr>
</table>
<!--<div class="data"></div>-->
</div>
</div>
<%}%>
<%@include file="footer.jsp"%>

    </body>
</html>
