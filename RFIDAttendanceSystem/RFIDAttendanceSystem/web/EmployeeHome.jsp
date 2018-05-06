<%-- 
    Document   : EmployeeHome
    Created on : 29 Mar, 2018, 7:32:16 PM
    Author     : mohnish
--%>

<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="Resources/favicon.png"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <link rel="stylesheet" href="CSS/animate.css"/>
        <script src="CSS/constants.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
          <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">
        <title><%=((Employee) session.getAttribute("userData")).getName()%></title>
    </head>
    <body> 
        <jsp:include page="header.jsp"/>
        <br/><br/>


        <div class="container" >

            <div class="jumbotron jumbotron-fluid" style="background-color: transparent;padding: 0">
                <div class="container">
                    <div class="clearfix">
                        <h1 class="employeeNameDisplay float-left mt-2 ml-4">Welcome <%=((Employee) session.getAttribute("userData")).getFirstName()%></h1>
                        <img src="ImageProvider" id="userProfile" class="img-fluid img-thumbnail profilePicture mr-5 float-right" alt="Profile Picture">
                    </div>
                </div>
            </div>

            <div class="row dashboard-card-row " style="margin-top: 8%" >
                <div class="col-sm-6 ">
                    <div class="card shadow card-cursor" id="ViewAttendance">
                        <div class="card-body">

                            <img src="Resources/attendanceIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="attendanceIcon">

                            <h3 class="card-title " align="center">Attendance Records</h3>


                        </div>
                    </div>
                </div>
                <div class="col-sm-6 ">
                    <div class="card shadow card-cursor" id="MakeaRequest">
                        <div class="card-body">

                            <img src="Resources/employeeRequestIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="employeeRequestIcon">

                            <h3 class="card-title " align="center">Requests</h3>
                        </div>
                    </div>
                </div>
            </div> 






        </div>

        <script>

            $(document).ready(function () {
                $('.card-cursor').click(function () {
                    location.href = this.id + '.jsp';
                });
            });


        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
