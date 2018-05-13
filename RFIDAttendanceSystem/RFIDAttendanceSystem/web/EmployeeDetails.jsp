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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
        <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br/>

        <div class="container-fluid"  ng-app="Employees" ng-controller="EmployeesCtrl"  >


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

                    <div class="employeeCard">
                        <!-- emp sta -->

                        <div class="card" id="id-{{empData.employeeId}}" ng-repeat="empData in employeeData.employeeList| filter : employeeFilter">
                            <div class="card-header "   id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-light collapsed" data-toggle="collapse" data-target="\#{{empData.name}}" aria-expanded="true" aria-controls="{{empData.name}}">
                                        {{empData.name}}
                                    </button>
                                    <div class="float-right">
                                        <button  class="btn collapsed" id="editForm" name="{{empData.employeeId}}"  data-toggle="collapse" data-target="\#{{empData.name}}" aria-expanded="true" aria-controls="{{empData.name}}" >
                                            <img src="Resources/edit.png"  alt="editButton"/>
                                        </button>

                                        <button  class="btn collapsed" >
                                            <img src="Resources/rubbish-bin.png" alt="deletebutton"/>
                                        </button>

                                        <button  class="btn collapsed"  data-toggle="collapse" data-target="\#{{empData.name}}" aria-expanded="true" aria-controls="{{empData.name}}" >
                                            <img src="Resources/expand-button.png" id="{{empData.employeeId}}-img"  alt="expandButton"/>
                                        </button>
                                    </div> 
                                </h5>
                            </div>

                            <div id="{{empData.name}}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-sm-12 offset-sm-9" >
                                            <img class="employeeImage img-thumbnail" src="ImageProvider?id={{empData.rfid.rfidnumber}}" alt="employeeImage" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class=" col-sm-12" style="padding: 50px;padding-bottom: 0px;">
                                            <form class="employeeDetails-NonEditable" id="{{empData.employeeId}}-form">
                                                <div class="form-group row">
                                                    <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="firstName" value="{{empData.firstName}}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="lastName" class="col-sm-2 col-form-label">Last Name</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="lastName" value="{{empData.lastName}}">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="email" class="col-sm-2 col-form-label">E-mail Id</label>
                                                    <div class="col-sm-10">
                                                        <input type="email" class="form-control" value="{{empData.email}}" id="email" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="mobileNumber" class="col-sm-2 col-form-label">Mobile No</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" value="{{empData.phoneNumber}}" id="mobileNumber" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label  class="col-sm-2 col-form-label" style="padding-right: 0px;">Gender</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control ">
                                                            <option ng-selected="empData.gender === 'male'" >Male</option>

                                                            <option ng-selected="empData.gender === 'female'">Female</option>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="Address" class="col-sm-2 col-form-label">Address</label>
                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" id="Address" rows="1">{{empData.address}}</textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="DOB" class="col-sm-2 col-form-label">DOB</label>
                                                    <div class="col-sm-10">
                                                        <input type="date" class="form-control" id="DOB" value="{{empData.dob}}" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="rfid" class="col-sm-2 col-form-label">RFID TAG</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="rfid" value="{{empData.rfid.rfidnumber}}">
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="sal" class="col-sm-2 col-form-label">Salary</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="sal" value="{{empData.salary}}" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label  class="col-sm-2 col-form-label">Department</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control">
                                                            <option value="1" ng-selected="empData.departmentName === 'Production'" >Production</option>
                                                            <option value="2" ng-selected="empData.departmentName === 'Research and Development'">Research and Development</option>
                                                            <option value="3" ng-selected="empData.departmentName === 'Purchase'">Purchase</option>
                                                            <option value="4" ng-selected="empData.departmentName === 'Marketing'">Marketing</option>
                                                            <option value="5" ng-selected="empData.departmentName === 'Accounting and Finance'">Accounting and Finance</option>
                                                            <option value="6" ng-selected="empData.departmentName === 'IT'">IT</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group row">
                                                    <div class="col-sm-12">
                                                        <center>  <button type="button"  id="button-empId"  class="btn btn-primary submitForm">Save Changes</button></center>
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

        </div>






        <script>
            const src1 = "Resources/expand-button.png";
            const src2 = "Resources/expand-arrow.png";


            $(document).ready(function () {

                $('#editForm').click(function () {
                    console.log('clicked edit');
                    $('#' + $(this).attr('name') + '-form').removeClass('employeeDetails-NonEditable');
                });

                $('.card').on('hidden.bs.collapse', function () {
                    var id = String(this.id).substr(3);
                    $('#' + id + '-img').attr('src', src1);
                    if (!$('#' + id + '-form').hasClass('employeeDetails-NonEditable')) {
                        $('#' + id + '-form').addClass('employeeDetails-NonEditable');
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



            showLoader('body');
            var app = angular.module('Employees', []);
            app.controller('EmployeesCtrl', function ($scope, $http) {
                console.log('req1');
                var request = {
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
                }, function (response) {
                    console.log('Error ', response);
                    hideLoader('body');
                });
            });




            document.title = '<%=((Employee) session.getAttribute("userData")).getName()%>';

        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
