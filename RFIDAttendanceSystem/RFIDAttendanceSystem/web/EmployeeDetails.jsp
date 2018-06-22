<%-- 
    Document   : EmployeeDetails
    Created on : 31 Mar, 2018, 2:01:57 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>   
        <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">
    </head> 
    <body>
        <jsp:include page="header.jsp"/>
        <br/>

        <div class="container-fluid"  ng-app="Employees" ng-controller="EmployeesCtrl" ng-init="loadEmployeesData()" >

            <!-- Alert -->
            <div class="alert alert-dismissible fade show animated  {{alertData.className}}" ng-show="alertData !== undefined" style="position: absolute;display: block;width: 50%;left: 25%;"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>
            </div>
            <!-- Alert End -->

            <div class="col-sm-2 offset-sm-10">
                <input class="form-control form-control-sm" type="text" placeholder="Search Employee"  ng-model="employeeFilter" id="searchBar">
            </div>
            <br/>
            <div class="col-sm-3 statistics float-left bg-light shadow-nohover">
                <center><p class="lead">Statistics</p></center>
                <div class="dropdown-divider"></div>
                <table class="table  table-responsive">
                    <tbody>
                        <tr>

                            <td>Employees </td>
                            <td>:</td>
                            <td>{{employeeData.employeesCount}}</td>

                        </tr>
                        <tr>

                            <td>Employees on Holiday</td>
                            <td>:</td>
                            <td>{{employeeData.employeesHoliday}}</td>

                        </tr>
                        <tr>

                            <td>Inactive Employees</td>
                            <td>:</td>
                            <td>{{employeeData.employeesDisabled}}</td>

                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="col-sm-9 float-right">

                <div id="accordion">

                    <div class="employeeCard" ng-if="employeeData">
                        <!-- emp sta -->

                        <div class="card" id="id-{{empData.employeeId}}" ng-repeat="empData in employeeData.employeeList| filter : employeeFilter">
                            <div class="card-header "   id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-light collapsed" data-toggle="collapse" data-target="\#{{empData.name}}" aria-expanded="true" aria-controls="{{empData.name}}">
                                        {{empData.name}}
                                    </button>
                                    <div class="float-right">
                                        <button  class="btn collapsed" >
                                            <img src="Resources/rubbish-bin.png" ng-click="deleteUserConfirmation(empData, $index)" name="deleteEmployee"  alt="deletebutton"/>
                                        </button>

                                        <button  class="btn collapsed"  data-toggle="collapse" data-target="\#{{empData.name}}" aria-expanded="true" aria-controls="{{empData.name}}" >
                                            <img src="Resources/expand-button.png" id="{{empData.employeeId}}-img"  alt="expandButton"/>
                                        </button>
                                    </div> 
                                </h5>
                            </div>

                            <div id="{{empData.name}}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">

                                    <div class=" clearfix">
                                        <div class="float-left" >
                                            <img class="employeeImage img-thumbnail" src="ImageProvider?id={{empData.rfid.rfidnumber}}" alt="employeeImage" />
                                        </div>
                                        <div class="float-right" >
                                            <label class="switch">
                                                <input  class="editMode" name="{{empData.employeeId}}" ng-model="checkBox" type="checkbox">
                                                <span class="slider round"></span>
                                            </label><br/>
                                            <label>Edit Mode</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class=" col-sm-12" style="padding: 50px;padding-bottom: 0px;">
                                            <form class="employeeDetails-NonEditable" name="{{empData.employeeId}}" id="{{empData.employeeId}}-form">
                                                <div class="form-group row">
                                                    <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="firstName" value="{{empData.firstName}}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="lastName" class="col-sm-2 col-form-label">Last Name</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="lastName" value="{{empData.lastName}}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="email" class="col-sm-2 col-form-label">E-mail Id</label>
                                                    <div class="col-sm-10">
                                                        <input type="email" class="form-control" value="{{empData.email}}" name="email" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="mobileNumber" class="col-sm-2 col-form-label">Mobile No</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="{{empData.phoneNumber}}" name="phoneNumber" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label  class="col-sm-2 col-form-label" style="padding-right: 0px;">Gender</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control " name="gender">
                                                            <option ng-selected="empData.gender === 'male'" >male</option>

                                                            <option ng-selected="empData.gender === 'female'">female</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="Address" class="col-sm-2 col-form-label">Address</label>
                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" name="address" rows="1">{{empData.address}}</textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="DOB" class="col-sm-2 col-form-label">DOB</label>
                                                    <div class="col-sm-10">
                                                        <input type="date" class="form-control" name="dob" value="{{empData.dob}}" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="rfid" class="col-sm-2 col-form-label">RFID TAG</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="rfid" value="{{empData.rfid.rfidnumber}}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="sal" class="col-sm-2 col-form-label">Salary</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="salary" value="{{empData.salary}}" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label  class="col-sm-2 col-form-label">Department</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control" name="departmentName">
                                                            <option value="null" ng-selected="empData.departmentName === 'null'" >Select Department</option>                                                            
                                                            <option value="Production" ng-selected="empData.departmentName === 'Production'" >Production</option>
                                                            <option value="Research and Development" ng-selected="empData.departmentName === 'Research and Development'">Research and Development</option>
                                                            <option value="Purchase" ng-selected="empData.departmentName === 'Purchase'">Purchase</option>
                                                            <option value="Marketing" ng-selected="empData.departmentName === 'Marketing'">Marketing</option>
                                                            <option value="Accounting and Finance" ng-selected="empData.departmentName === 'Accounting and Finance'">Accounting and Finance</option>
                                                            <option value="IT" ng-selected="empData.departmentName === 'IT'">IT</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group row">
                                                    <div class="col-sm-12">
                                                        <center>  <button type="button" ng-if="checkBox"  id="button-{{empData.employeeId}}" ng-click="editUserConfirmation(empData, $index)"   class="btn btn-primary submitForm hidden">Save Changes</button></center>
                                                    </div>
                                                </div>
                                            </form> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- emp end-->
                    </div>
                </div>
            </div>

            <!-- confirmation modal-->
            <div class="modal fade" ng-if="confirmationData" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" ng-hide="confirmationData.mode === 'edit'" id="exampleModalLongTitle">Delete Confirmation</h5>
                            <h5 class="modal-title" ng-hide="confirmationData.mode === 'delete'" id="exampleModalLongTitle">Edit Confirmation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p ng-hide="confirmationData.mode === 'edit'">Do you want to delete {{confirmationData.name}} permanently </p>
                            <p ng-hide="confirmationData.mode === 'delete'" >Do you want to edit {{confirmationData.name}} </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger" ng-hide="confirmationData.mode === 'edit'" ng-click="deleteUser(confirmationData)" data-dismiss="modal">Delete Employee</button>                        
                            <button type="button" class="btn btn-outline-info" ng-hide="confirmationData.mode === 'delete'" ng-click="editUser(confirmationData)" data-dismiss="modal">Edit Employee</button>                        
                        </div>
                    </div>
                </div>
            </div>



        </div>

        <script>
            const src1 = "Resources/expand-button.png";
            const src2 = "Resources/expand-arrow.png";

            showLoader('body');
            var app = angular.module('Employees', []);
            app.controller('EmployeesCtrl', function ($scope, $http) {

                $scope.loadEmployeesData = function () {
                    const request = {
                        method: 'GET',
                        url: 'EmployeeController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response !== ERROR) {
                            $scope.employeeData = JSON.parse(JSON.stringify(response.data));
                        }
                        hideLoader('body');
                        // add event listner after data is loaded 
                        $(document).ready(function () {
                            $('.editMode').click(function () {
                                if ($('#' + $(this).attr('name') + '-form').hasClass('employeeDetails-NonEditable')) {
                                    $('#' + $(this).attr('name') + '-form').removeClass('employeeDetails-NonEditable');
                                    $('#button-' + $(this).attr('name')).removeClass('hidden');
                                } else {
                                    $('#' + $(this).attr('name') + '-form').addClass('employeeDetails-NonEditable');
                                    $('#button-' + $(this).attr('name')).addClass('hidden');
                                }
                            });

                            $('.card').on('hidden.bs.collapse', function () {
                                var id = String(this.id).substr(3);
                                $('#' + id + '-img').attr('src', src1);
                                if (!$('#' + id + '-form').hasClass('employeeDetails-NonEditable')) {
                                    $('#' + id + '-form').addClass('employeeDetails-NonEditable');
                                    $('input[name=' + id + ']').prop('checked', false);
                                }
                            });

                            $('.card').on('shown.bs.collapse', function () {
                                var id = String(this.id).substr(3);
                                $('#' + id + '-img').attr('src', src2);
                            });

                            $('.submitForm').click(function () {
                                var id = String(this.id).substring(7);
                            });

                        });
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.deleteUserConfirmation = function (employee, indexPosition) {
                    $scope.confirmationData = {employeeId: employee.employeeId, name: employee.name, objectPostion: indexPosition, mode: 'delete'};
                    $('#confirmationModal').modal('show')
                };

                $scope.editUserConfirmation = function (employee, indexPosition) {
                    $scope.confirmationData = {employeeId: employee.employeeId, name: employee.name, objectPostion: indexPosition, mode: 'edit'};
                    $('#confirmationModal').modal('show')
                };

                $scope.deleteUser = function (deleteData) {
                    showLoader('body');
                    const request = {
                        method: 'POST',
                        url: 'EmployeeController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {employeeId: deleteData.employeeId, task: DELETE_EMPLOYEE}
                    };
                    $http(request).then(function (response) {
                        if (response !== ERROR) {
                            $scope.employeeData.employeeList.splice(deleteData.objectPostion, 1);
                            let employeeCount = parseInt($scope.employeeData.employeesCount);
                            $scope.employeeData.employeesCount = --employeeCount;
                            $scope.alertCreator('Successfully Deleted Employee', 'alert-success');
                        } else {
                            $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.editUser = function (employee) {
                    const id = employee.employeeId;
                    var fData = $('#' + id + '-form').serializeArray();
                    const emp = $scope.employeeData.employeeList[employee.objectPostion];
                    var changes = 0;
                    angular.forEach(fData, function (data) {
                        if (data.name !== 'rfid') {
                            if (data.value != emp[data.name]) {
                                emp[data.name] = data.value;
                                changes += 1;
                            }
                        } else {
                            if (data.value != emp[data.name].rfidnumber) {
                                emp[data.name].rfidnumber = data.value;
                                changes += 1;
                            }
                        }
                    });
                    console.log(JSON.stringify(emp));
                    if (changes > 0) {
                        delete emp.$$hashKey;
                        delete emp.name;
                        emp.isUserHr = emp.userHr;
                        delete emp.userHr;
                        showLoader('body');
                        const request = {
                            method: 'POST',
                            url: 'EmployeeController',
                            headers: {"api_key": API_KEY},
                            timeout: 10000,
                            params: {employee: JSON.stringify(emp), task: EDIT_EMPLOYEE}
                        };
                        $http(request).then(function (response) {
                            if (response !== ERROR) {
                                $scope.alertCreator('Successfully Edited Employee', 'alert-success');
                            } else {
                                $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                            }
                            hideLoader('body');
                        }, function (response) {
                            console.log('Error ', response);
                            hideLoader('body');
                        });
                    } else {
                        $scope.alertCreator('No Changes were made', 'alert-warning');
                    }
                    $('.editMode[name=' + id + ']').click();
                };

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
            document.title = '<%=((Employee) session.getAttribute("userData")).getName()%>';

        </script>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
