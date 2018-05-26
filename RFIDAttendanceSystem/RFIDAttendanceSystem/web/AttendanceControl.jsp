<%-- 
    Document   : AttendanceControl
    Created on : 1 Apr, 2018, 1:14:36 PM
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
        <br/>

        <div class="container-fluid"  ng-app="Attendance" ng-controller="AttendanceCtrl" ng-init="loadAttendanceData()">

            <!-- Alert -->
            <div class="alert alert-dismissible fade show  animated {{alertData.className}}" style="position: absolute;display: block;width: 50%;left: 25%;"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Alert End -->

            <div class="col-sm-2 offset-sm-10">
                <input class="form-control form-control-sm" type="text" placeholder="Search Date"  ng-model="dateFilter" id="searchBar">
            </div>
            <br/><br/>
            <div class="col-sm-3  float-left bg-light shadow-nohover">
                <center><p class="lead">Find Attendance</p></center>
                <div class="dropdown-divider"></div>
                <form name="myForm">
                    <div class="form-group">
                        <label for="date1">From Date</label>
                        <input type="date" class="form-control" onchange="setMinimumDate(this.value)" id="date1" ng-model="fromDate">
                    </div>
                    <div class="form-group">
                        <label for="date2">To Date</label>
                        <input type="date" class="form-control" id="date2" ng-model="toDate">
                    </div>
                    <center><button type="button" ng-disabled="!(toDate && fromDate)" ng-click="searchRecords()" class="btn btn-primary">Find Records</button></center><br/><br/>
                </form>
            </div>


            <div class="col-sm-9 float-right"  ng-repeat="attendance in attendanceData| filter : {
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
                                        <th ></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr  ng-repeat="employee in attendance.attendanceList">
                                        <td>{{$index + 1}}</td>
                                        <td>{{employee.employeeId}}</td>
                                        <td>{{employee.employeeName}}</td>
                                        <td>{{employee.checkIn}}</td>
                                        <td>{{employee.checkOut}}</td>
                                        <td style="padding-top: 5px;">
                                            <button type="button" ng-click="editRecordConfirmation(employee)" style="font-weight: 500;" class="btn btn-outline-info">Edit</button>
                                            &nbsp;&nbsp;&nbsp;<button type="button" ng-click="deleteUserConfirmation(employee)" style="font-weight: 500;" class="btn btn-outline-danger">Delete</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div> 

                    <br/>
                </div>
            </div>


            <div class="modal fade"  id="attendanceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Edit Record</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label >Check In:</label>
                                <input type="text"  class="form-control" ng-model="checkIn" maxlength="17"/>
                            </div>
                            <div class="form-group">
                                <label >Check Out:</label>
                                <input type="text" class="form-control" ng-model="checkOut" maxlength="17"/>
                            </div>
                        </div>  
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-info" ng-click="editEmployeeAttendance(editAttendance, checkIn, checkOut)" data-dismiss="modal">Edit Record</button>                               
                        </div>
                    </div>
                </div>
            </div>



            <div class="modal fade" ng-if="confirmationData" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Delete Record</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Do you want to delete {{confirmationData.employeeName}} record permanently </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger" ng-click="deleteUser(confirmationData)" data-dismiss="modal">Delete Record</button>                        
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script>
            $(document).ready(function () {
            });

            document.getElementById('date1').max = GetOneDayPrior();
            document.getElementById('date2').max = GetOneDayPrior();

            showLoader('body');
            var app = angular.module('Attendance', []);
            app.controller('AttendanceCtrl', function ($scope, $http) {
                $scope.loadAttendanceData = function () {
                    const request = {
                        method: 'GET',
                        url: 'AttendanceController',
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

                $scope.editRecordConfirmation = function (attendance) {
                    $scope.editAttendance = attendance;
                    $scope.checkIn = attendance.checkIn;
                    $scope.checkOut = attendance.checkOut;
                    $('#attendanceModal').modal('show')
                };

                $scope.editEmployeeAttendance = function (attendance, checkIn, checkOut) {
                    if (attendance.checkIn !== checkIn || attendance.checkOut !== checkOut) {
                        if (checkIn.length === 17 && checkOut.length === 17) {
                            const request = {
                                method: 'POST',
                                url: 'AttendanceController',
                                headers: {"api_key": API_KEY},
                                timeout: 10000,
                                params: {attendanceId: attendance.attendanceId, checkIn: checkIn, checkOut: checkOut, task: UPDATE_ATTENDANCE}
                            };
                            $http(request).then(function (response) {
                                if (response !== ERROR && response.data !== 'invalidRequest') {
                                    $scope.loadAttendanceData();
                                    $scope.alertCreator('Successfully Updated Record', 'alert-success');
                                } else {
                                    $scope.alertCreator('Error in Updating Record', 'alert-danger');
                                }
                                hideLoader('body');
                            }, function (response) {
                                console.log('Error ', response);
                                hideLoader('body');
                            });
                        } else {
                            $scope.alertCreator('Enter Valid Date and Time', 'alert-warning');
                        }
                    } else {
                        $scope.alertCreator('No Changes Were Made', 'alert-info');
                    }
                };

                $scope.deleteUserConfirmation = function (attendance) {
                    $scope.confirmationData = attendance;
                    $('#confirmationModal').modal('show')
                };

                $scope.deleteUser = function (deleteData) {
                    showLoader('body');
                    const request = {
                        method: 'POST',
                        url: 'AttendanceController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {attendanceId: deleteData.attendanceId, task: DELETE_ATTENDANCE}
                    };
                    $http(request).then(function (response) {
                        if (response !== ERROR && response.data !== 'invalidRequest') {
                            $scope.loadAttendanceData();
                            $scope.alertCreator('Successfully Deleted Record', 'alert-success');
                        } else {
                            $scope.alertCreator('Error in Deleting Record', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.searchRecords = function () {
                    var fromDate = extractDate(new Date($scope.fromDate));
                    var toDate = extractDate(new Date($scope.toDate));
                    showLoader('body');
                    const request = {
                        method: 'POST',
                        url: 'AttendanceController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {fromDate: fromDate, toDate: toDate, task: GET_SPECIFIC_RECORDS}
                    };
                    $http(request).then(function (response) {
                        console.log(response);
                        if (response.data !== ATTENDANCE_NOT_FOUND && response.data !== 'invalidRequest') {
                            $scope.attendanceData = undefined;
                            $scope.attendanceData = JSON.parse(JSON.stringify(response.data));
                        } else if (response.data === ATTENDANCE_NOT_FOUND) {
                            $scope.alertCreator('No such attendance found', 'alert-warning');
                        } else {
                            $scope.alertCreator('Error in Retriving Record', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        $scope.alertCreator('Error in Retriving Record', 'alert-danger');
                        hideLoader('body');
                    });
                }

                $scope.alertCreator = function (message, className) {
                    document.getElementById("messageAlert").classList.remove('fadeOut');
                    $scope.alertData = {message: message, className: className};
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


            function setMinimumDate(date) {
                var d = new Date(date);
                d.setDate(d.getDate() + 1);
                var day, month, year;

                year = d.getFullYear();
                if (d.getDate() < 10) {
                    day = '0' + String(d.getDate());
                } else {
                    day = String(d.getDate());
                }
                if (d.getMonth() + 1 < 10) {
                    month = '0' + String(d.getMonth() + 1);
                } else {
                    month = String(d.getMonth() + 1);  //+1; //January is 0!
                }
                document.getElementById('date2').min = year + '-' + month + '-' + day;
            }

            function GetOneDayPrior() {
                var d = new Date();
                d.setDate(d.getDate() - 1);
                var day, month, year;

                year = d.getFullYear();
                if (d.getDate() < 10) {
                    day = '0' + String(d.getDate());
                } else {
                    day = String(d.getDate());
                }
                if (d.getMonth() + 1 < 10) {
                    month = '0' + String(d.getMonth() + 1);
                } else {
                    month = String(d.getMonth() + 1);  //+1; //January is 0!
                }

                return year + '-' + month + '-' + day;
            }

            function extractDate(date) {
                var d = new Date(date);
                var day, month, year;
                year = d.getFullYear();
                if (d.getDate() < 10) {
                    day = '0' + String(d.getDate());
                } else {
                    day = String(d.getDate());
                }
                if (d.getMonth() + 1 < 10) {
                    month = '0' + String(d.getMonth() + 1);
                } else {
                    month = String(d.getMonth() + 1);  //+1; //January is 0!
                }
                return  day + '-' + month + '-' + year;
            }
            document.title = '<%=((Employee) session.getAttribute("userData")).getName()%>';

        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
