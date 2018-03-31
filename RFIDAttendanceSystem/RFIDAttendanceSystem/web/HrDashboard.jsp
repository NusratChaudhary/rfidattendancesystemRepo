<%-- 
    Document   : HRDashBoard
    Created on : 22 Mar, 2018, 3:51:11 PM
    Author     : mohnish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="Resources/favicon.png"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <link rel="stylesheet" href="CSS/animate.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
    </head>
    <body class="bg-light">
        <jsp:include page="header.jsp"/>
        <br/><br/>
        <div class="container ">


            <div class="row live-counter ">

                <div class="col-sm-6 " >
                    <center> <span class="lead">Attendance Entries </span><span class="live-counter-numbers animated fadeIn" style="color: green">50</span></center>
                </div>
                <!--<div class="col-sm-1 live-counter-divider">
                    
                </div>-->
                <div class="col-sm-6">
                    <center>  <span class="lead">Pending Requests </span><span class="live-counter-numbers animated fadeIn" style="color: red">62</span></center>
                </div>

            </div>




            <div class="row dashboard-card-row">
                <div class="col-sm-6 ">
                    <div class="card shadow card-cursor" id="EmployeeDetails">
                        <div class="card-body">

                            <img src="Resources/employeeIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="employeeIcon">

                            <h3 class="card-title " align="center">Employees</h3>


                        </div>
                    </div>
                </div>
                <div class="col-sm-6 ">
                    <div class="card shadow  card-cursor" id="Broadcast">
                        <div class="card-body">

                            <img src="Resources/broadcastIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="broadcastIcon">

                            <h3 class="card-title " align="center">Broadcast Message</h3>
                        </div>
                    </div>
                </div>
            </div> 


            <div class="row dashboard-card">
                <div class="col-sm-6 ">
                    <div class="card shadow  card-cursor" id="PendingRequest">
                        <div class="card-body">

                            <img src="Resources/employeeRequestIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="employeeRequestIcon">

                            <h3 class="card-title " align="center">Employee Requests</h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 ">
                    <div class="card shadow  card-cursor" id="AttendanceControl">
                        <div class="card-body">
                            <img src="Resources/attendanceIcon.png" style="height: 140px;width: auto" class="rounded mx-auto d-block img-fluid" alt="attendanceIcon">

                            <h3 class="card-title " align="center">Attendance Records</h3>
                        </div>
                    </div>
                </div>
            </div> 


        </div>


        <script>

            $(document).ready(function () {

                $('.card-cursor').click(function (){
                    location.href = this.id+'.jsp';
                });



            });
        </script>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
