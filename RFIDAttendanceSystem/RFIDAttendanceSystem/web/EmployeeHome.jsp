<%-- 
    Document   : EmployeeHome
    Created on : 29 Mar, 2018, 7:32:16 PM
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
        <title>Employee</title>
    </head>
    <body> 
        <jsp:include page="header.jsp"/>
        <br/><br/>


        <div class="container" ng-app="rootApp" ng-controller="rootCtrl">

            <div class="jumbotron jumbotron-fluid" style="background-color: transparent;padding: 0">
                <div class="container">
                    <div class="clearfix">
                        <h1 class="employeeNameDisplay float-left">Welcome {{userData.firstName}}</h1>
                        <img ng-if="profilePicture" src="{{profilePicture}}" class="img-fluid w-25 float-right" alt="Profile Picture">
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


        <script>
            var app = angular.module('rootApp', []);

            app.controller('rootCtrl', function ($scope, $http) {
                $scope.userData = JSON.parse('<%=(String) session.getAttribute("json")%>');
                $scope.profilePicture = null;
                if ($scope.userData !== null) {

                    var request = {
                        method: 'GET',
                        url: 'ImageProvider',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        data: {rfidNumber: $scope.userData.rfid.rfidnumber}
                    };
                    $http(request).then(function (response) {
                        //First function handles success
                        $scope.profilePicture = response.data;
                    }, function (response) {
                        console.log('Error ', response);
                    });

                }

            });


        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
