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

    </head>
    <body> 
        <jsp:include page="header.jsp"/>
        <div ng-app="EmployeeBroadcast" ng-controller="EmployeeBroadcastCtrl">
            <!-- Alert -->
            <div class="alert alert-dismissible fade show  animated {{alertData.className}}" style="position: absolute;display: block;width: 50%;left: 25%;"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>
            </div>
            <!-- Alert End -->
            <marquee id='broadcastMarquee' ng-init="showBroadcast()">
                <p ><span ng-repeat="data in employeeBroadcast" style="margin-right: 80%">{{data.message}}</span> </p>
            </marquee>      

            <br/><br/>
            <div class="container hidden" id="root">
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



            <div class="modal fade" id="navigationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body p-5">
                            <div class="row mb-3">
                                <div class="col-2">
                                    <img src="Resources/warning.png" alt="warning"/>
                                </div>
                                <div class="col-10">
                                    <p class="lead ">HR User found which page you want</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <center><button type="button" onclick="changeStatus(1)" class="btn btn-info">HR Dashboard</button></center>
                                </div>
                                <div class="col-6">
                                    <center><button type="button" onclick="changeStatus(0)" class="btn btn-info" data-dismiss="modal" aria-label="Close">Employee</button></center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="pinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body pt-4 pb-4 pl-0 pr-0">
                            <div class="row mb-3">
                                <div class="col-1 offset-1">
                                    <img src="Resources/warning.png" alt="warning"/>
                                </div>
                                <div class="col-8 offset-2">
                                    <label>Checkin Verification</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <form class="form-inline">
                                        <div class="form-group mx-sm-3 mb-2">
                                            <label for="inputPin" class="sr-only">PIN</label>
                                            <input type="text" class="form-control ml-5 mr-4" ng-model="pinNumber" id="inputPin" maxlength="6" placeholder="6 Digit Pin">
                                            <button type="button" ng-click="verifyCheckin()" ng-disabled="!(pinNumber.length === 6)" class="btn btn-info">Verify Checkin</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>

            const BASE_URL = 'http://' + window.location.hostname + ':8080/RFIDAttendanceSystem/';
            var isUserHr, isHrEnabled;
            $(document).ready(function () {
                $('.card-cursor').click(function () {
                    location.href = this.id + '.jsp';
                });
                isUserHr = (JSON.parse('<%=(String) session.getAttribute("userJson")%>')).userHr;
                isHrEnabled = (JSON.parse('<%=(String) session.getAttribute("userJson")%>')).hrEnabled;
                var verifyCheckin = (JSON.parse('<%=(String) session.getAttribute("userJson")%>')).rfid.verifyCheckin;
                if (verifyCheckin) {
                    $('#pinModal').modal('show');
                    $("#pinModal").on('hidden.bs.modal', function () {
                        checkUserHr();
                    });
                } else {
                    checkUserHr();
                }
            });

            function checkUserHr() {
                if (isUserHr && isHrEnabled) {
                    if (!sessionStorage.getItem("isConfirmed")) {
                        $('#navigationModal').modal('show');
                    }
                    if (sessionStorage.getItem("isConfirmed") === 'true') {
                        window.location.replace(BASE_URL + 'HrDashboard.jsp');
                    } else {
                        $('#root').removeClass("hidden");
                    }
                } else {
                    $('#root').removeClass("hidden");
                }
            }

            function changeStatus(page) {
                sessionStorage.setItem("isConfirmed", "false");
                if (page === 1) {
                    sessionStorage.setItem("isConfirmed", "true");
                    window.location.replace(BASE_URL + 'HrDashboard.jsp');
                } else {
                    $('#root').removeClass("hidden");
                }
            }

            var headerApp = angular.module('EmployeeBroadcast', []);
            headerApp.controller('EmployeeBroadcastCtrl', function ($scope, $http,$interval) {
                $scope.showBroadcast = function () {
                    const request = {
                        method: 'GET',
                        url: 'BroadcastController',
                        headers: {"api_key": API_KEY},
                        params: {task: LOAD_BROADCAST_EMPLOYEE},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.employeeBroadcast = JSON.parse(JSON.stringify(response.data));
                        }
                    }, function (response) {
                        console.log('Error ', response);
                    });
                };
                $interval(function () {
                    $scope.showBroadcast();
                }, 5000);

                $scope.verifyCheckin = function () {
                    showLoader('.modal');
                    let employeeId = (JSON.parse('<%=(String) session.getAttribute("userJson")%>')).employeeId;
                    const request = {
                        method: 'POST',
                        url: 'AttendanceController',
                        headers: {"api_key": API_KEY},
                        params: {task: VERIFY_CHECKIN, pin: $scope.pinNumber, id: employeeId},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response.data === OK) {
                            $scope.alertCreator('Checin Verified Successfully', 'alert-success');
                            hideLoader('.modal');
                            $("#pinModal").modal("hide");
                        } else if (response.data === PIN_INCORRECT) {
                            $scope.alertCreator('Pin is incorrect', 'alert-warning');
                            hideLoader('.modal');
                        } else if (response.data === PIN_USED) {
                            $scope.alertCreator('Pin has expired or used', 'alert-warning');
                            hideLoader('.modal');
                        } else {
                            $scope.alertCreator('Something went wrong', 'alert-danger');
                        }
                    }, function (response) {
                        console.log('Error ', response);
                        $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                        hideLoader('.modal');
                    });
                };

                $scope.alertCreator = function (message, className) {
                    document.getElementById("messageAlert").classList.remove('fadeOut');
                    $scope.alertData = {message: message, className: className};
                    $("html, body").animate({scrollTop: 0}, "fast");
                    setTimeout(function () {
                        var element, name, arr;
                        element = document.getElementById("messageAlert");
                        name = "fadeOut";
                        arr = element.className.split(" ");
                        if (arr.indexOf(name) == -1) {
                            element.className += " " + name;
                        }
                    }, 2000);
                };
            });
            document.title = '<%=((Employee) session.getAttribute("userData")).getName()%>';
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
