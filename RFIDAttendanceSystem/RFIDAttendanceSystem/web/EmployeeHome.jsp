<%-- 
    Document   : EmployeeHome
    Created on : 29 Mar, 2018, 7:32:16 PM
    Author     : mohnish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <link rel="stylesheet" href="CSS/animate.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Employee</title>
    </head>
    <body > 
        <jsp:include page="header.jsp"/>
        <br/><br/>


        <div class="container">


            <div class="row dashboard-card-row" style="margin-top: 15%">
                <div class="col-sm-6 ">
                    <div class="card shadow">
                        <div class="card-body">

                            <img src="Resources/attendanceIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="attendanceIcon">

                            <h3 class="card-title " align="center">Attendance Records</h3>


                        </div>
                    </div>
                </div>
                <div class="col-sm-6 ">
                    <div class="card shadow">
                        <div class="card-body">

                            <img src="Resources/employeeRequestIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="employeeRequestIcon">

                            <h3 class="card-title " align="center">Requests</h3>
                        </div>
                    </div>
                </div>
            </div> 






        </div>




        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
