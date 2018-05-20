<%-- 
    Document   : Verification
    Created on : 4 May, 2018, 8:28:58 PM
    Author     : mohnish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%=request.getAttribute("title")%></title>

        <link rel="shortcut icon" type="image/png" href="Resources/favicon.png"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <link rel="stylesheet" href="CSS/animate.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    </head>
    <%
        if (request.getAttribute("message") == null) {
            RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
            rd.forward(request, response);
        }
    %>
    <body class="bg-light">
        <div class="container border border-white shadow-nohover rounded p-5 mt-5">

            <div class="clearfix mx-auto">
                <div class="float-left p-5">
                    <%=request.getAttribute("message")%>
                </div>
                <%
                    if (Boolean.valueOf(request.getAttribute("status").toString())) {
                %>
                <div class="float-right" >
                    <img class="img-fluid animated flip"  src="Resources/verified_img.png"  width="160px" height="100px"/>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>




    <!--        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
</html>
