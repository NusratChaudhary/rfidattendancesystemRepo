<%-- 
    Document   : AdminHome
    Created on : 2 Apr, 2018, 6:53:26 PM
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
        <script src="CSS/constants.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
        <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">
        <title>Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br/><br/>
        <div class="container-fluid" ng-app="AdminConsole" ng-controller="AdminConsoleCtrl" >
            <nav>
                <div class="nav nav-tabs  mb-4" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-checkincheckout" role="tab" aria-controls="nav-home" aria-selected="true">Checkin/Checkout</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-attendance" role="tab" aria-controls="nav-profile" aria-selected="false">Attendance</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-employees" role="tab" aria-controls="nav-contact" aria-selected="false">Employees</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-hr" role="tab" aria-controls="nav-contact" aria-selected="false">HR</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-mails" role="tab" aria-controls="nav-contact" aria-selected="false">Mails</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-sms" role="tab" aria-controls="nav-contact" aria-selected="false">SMS</a>

                </div>
            </nav>

            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-checkincheckout" role="tabpanel" aria-labelledby="nav-home-tab">che</div>
                <div class="tab-pane fade" id="nav-attendance" ng-init="loadAttendanceData()" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="col-sm-2 offset-sm-10 mb-3">
                        <input class="form-control form-control-sm" type="text" placeholder="Search Date"  ng-model="dateFilter" id="searchBar">
                    </div>
                    <div class="col-sm-12"  ng-repeat="attendance in attendanceData| filter : {
                        date:dateFilter
                    }"  ng-if="attendanceData">
                        <div>
                            <div class="card shadow-nohover attendanceCard" >
                                <h5 class="card-header">{{attendance.date}}</h5>
                                <div class="card-body">
                                    <table class="col-sm-12 table table-hover  table-striped">
                                        <thead>
                                            <tr>
                                                <th >#</th>
                                                <th >Employee Id</th>
                                                <th >Employee Name</th>
                                                <th >Check In</th>
                                                <th >Check Out</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr  ng-repeat="employee in attendance.attendanceList">
                                                <td>{{$index + 1}}</td>
                                                <td>{{employee.employeeId}}</td>
                                                <td>{{employee.employeeName}}</td>
                                                <td>{{employee.checkIn}}</td>
                                                <td>{{employee.checkOut}}</td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div> 

                            <br/>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-employees" role="tabpanel" aria-labelledby="nav-contact-tab">emp</div>
                <div class="tab-pane fade" id="nav-hr" role="tabpanel" aria-labelledby="nav-contact-tab">hr</div>
                <div class="tab-pane fade" id="nav-mails" role="tabpanel" aria-labelledby="nav-contact-tab">mails</div>
                <div class="tab-pane fade" id="nav-sms" role="tabpanel" aria-labelledby="nav-contact-tab">sms</div>
            </div>

        </div>
        <script>

            $(document).ready(function () {

            });


            var app = angular.module('AdminConsole', []);
            app.controller('AdminConsoleCtrl', function ($scope, $http) {
                showLoader('body');
                $scope.loadAttendanceData = function () {
                    const request = {
                        method: 'GET',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        params: {task: GET_ALL_ATTENDANCE},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response !== ERROR) {
                            $scope.attendanceData = JSON.parse(JSON.stringify(response.data));
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
