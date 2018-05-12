<%-- 
    Document   : ViewAttendance
    Created on : 1 Apr, 2018, 8:09:52 PM
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
        <div class="container" ng-app="Attendance" ng-controller="AttendanceCtrl">
            <div class="row" ng-if="status">
                <div class="col-sm-2 offset-sm-11" id="controlButton" >
                    <img src="Resources/printer.png"  onclick="window.print()" style="height: 40px;width: 40px;padding: 5px;cursor: pointer; "  alt="print"/>
                    <img src="Resources/email.png" style="height: 40px;width: 40px;padding: 5px;cursor: pointer;" data-toggle="modal" data-target="#exampleModalCenter" alt="email"/>
                </div>

            </div>

            <table ng-if="status" class="table table-striped shadow-nohover employeeAttendance" >
                <thead >
                <th>Id</th>
                <th >Check In</th>
                <th >Check Out</th>
                <th >Status</th>
                </tr>
                </thead>
                <tbody >
                    <tr ng-repeat="data in attendanceData">
                        <td>{{data.AttendanceId}}</td>
                        <td>{{data.checkIn}}</td>
                        <td>{{data.checkOut}}</td>
                        <td>{{data.flag}}</td>
                    </tr>
                </tbody>
            </table>


            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirmation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you want to send Email on <%=((Employee) session.getAttribute("userData")).getEmail()%>


                            <center> <button type="button" class="btn btn-sm btn-primary">Send Report</button></center>
                        </div>

                    </div>
                </div>
            </div>
            <center ng-if="!status"><h4>No Attendance Found</h4></center>

        </div>




        <script>

      
                showLoader('body');

                var app = angular.module('Attendance', []);
                app.controller('AttendanceCtrl', function ($scope, $http) {
                    $scope.status = false;
                    var request = {
                        method: 'GET',
                        url: 'Attendance',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {task: GET_EMP_ATTENDANCE}
                    };
                    $http(request).then(function (response) {
                        if (!response.data === ATTENDANCE_NOT_FOUND) {
                            $scope.status = true;
                            $scope.attendanceData = response.data;
                        }
                        console.log(response.data);
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                });
          



        </script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
