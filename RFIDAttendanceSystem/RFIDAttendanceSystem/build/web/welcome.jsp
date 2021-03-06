<%-- 
    Document   : welcolme
    Created on : 22 Mar, 2018, 3:00:06 PM
    Author     : mohnish
--%>

<%@page import="Shared.SMSManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="Resources/favicon.png"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <link rel="stylesheet" href="CSS/animate.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

        <script src="CSS/jquery.loading.js"></script>

        <link href="CSS/jquery.loading.css" rel="stylesheet">
        <script src="CSS/constants.js"></script>
        <title>Welcome</title>
    </head>
    <body>
        <%

            if (session.getAttribute("id") != null) {
                RequestDispatcher rd = request.getRequestDispatcher("EmployeeHome.jsp");
                rd.forward(request, response);
            }

            if (session.getAttribute("hrId") != null) {
                RequestDispatcher rd = request.getRequestDispatcher("null.jsp");
                rd.forward(request, response);
            }

        %>
        <jsp:include page="header.jsp"/>



        <div class="container" style="margin-top: 15px">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Resources/1.jpg" style="height: 500px" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Resources/2.jpg" style="height: 500px" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Resources/3.jpg" style="height: 500px" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" id="next-button" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>


        <script>
            window.sessionStorage.clear();
        </script>

        <!--        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
