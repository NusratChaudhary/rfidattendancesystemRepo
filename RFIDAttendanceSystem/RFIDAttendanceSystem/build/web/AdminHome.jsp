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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>   
        <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">
        <title>Admin</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br/><br/>
        <div class="container-fluid" ng-app="AdminConsole" ng-controller="AdminConsoleCtrl" >

            <!-- Alert -->
            <div class="alert alert-dismissible fade show animated  {{alertData.className}}" ng-show="alertData !== undefined" style="position: absolute;display: block;width: 50%;left: 25%;"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>
            </div>
            <!-- Alert End -->
            <nav>
                <div class="nav nav-tabs  mb-4" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-checkincheckout" role="tab" aria-controls="nav-home" aria-selected="true">Checkin/Checkout</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-attendance" role="tab" aria-controls="nav-profile" aria-selected="false">Attendance</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-employees" role="tab" aria-controls="nav-contact" aria-selected="false">Employees</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-hr" role="tab" aria-controls="nav-contact" aria-selected="false">HR</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-mails" role="tab" aria-controls="nav-contact" aria-selected="false">Mails</a>
                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-sms" role="tab" aria-controls="nav-contact" aria-selected="false">SMS</a>
                    <a class="nav-item nav-link" id="nav-request-tab" data-toggle="tab" href="#nav-request" role="tab" aria-controls="nav-contact" aria-selected="false">Request</a>
                </div>
            </nav>

            <div class="tab-content" id="nav-tabContent">

                <!-- checking start-->
                <div class="tab-pane fade show active" id="nav-checkincheckout" role="tabpanel" ng-init="loadCurrentCheckins()" aria-labelledby="nav-home-tab">
                    <div class="container-fluid">
                        <div class="col-sm-2 offset-sm-10 mb-3">
                            <input class="form-control form-control-sm" type="text" placeholder="Search Employee"  ng-model="checkinEmployeeFilter" id="searchBar">
                        </div>
                        <div class="col-sm-12">
                            <table class="table table-striped text-center shadow-nohover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Employee Name</th>
                                        <th scope="col">Checkin</th>
                                        <th scope="col">Checkout</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-if="currentCheckins.length > 0" ng-repeat="checkin in currentCheckins| filter : {employeeName:checkinEmployeeFilter}">
                                        <th scope="row">{{$index + 1}}</th>
                                        <td>{{checkin.employeeName}}</td>
                                        <td>{{checkin.checkIn}}</td>
                                        <td>{{checkin.checkOut}}</td>
                                    </tr>
                                    <tr ng-if="currentCheckins.length === 0">
                                        <td colspan="4"><b>No Current Checkin Made...</b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- checking end-->

                <!-- attendance start-->
                <div class="tab-pane fade" id="nav-attendance" ng-init="loadAttendanceData()" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="col-sm-2 offset-sm-10 mb-3">
                        <input class="form-control form-control-sm" type="text" placeholder="Search Date"  ng-model="dateFilter" id="attendanceSearchBar">
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
                                                    &nbsp;&nbsp;&nbsp;<button type="button" ng-click="deleteUserAttendanceConfirmation(employee)" style="font-weight: 500;" class="btn btn-outline-danger">Delete</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div> 
                            <br/>
                        </div>
                    </div>
                </div>
                <!-- attendance end-->

                <!-- emptab start-->
                <div class="tab-pane fade" id="nav-employees" ng-init="loadEmployeesData();" role="tabpanel" aria-labelledby="nav-contact-tab">

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
                                                    <img class="employeeImage img-thumbnail" src="{{empData.rfid.rfidnumber>0?'ImageProvider?id=' + empData.rfid.rfidnumber:''}}" alt="employeeImage" />
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
                </div>
                <!-- emptab end-->

                <!-- Hr start-->
                <div class="tab-pane fade" id="nav-hr" role="tabpanel" aria-labelledby="nav-contact-tab">
                    <div class="col-sm-1 offset-sm-11" style="cursor: pointer;">
                        <div data-toggle="modal" data-target="#addHrUser">
                            <img src="Resources/addUsericon.png" alt="icon" class="ml-3" /><br/>
                            <label>Add User</label>
                        </div>
                    </div>
                    <div class="card p-3 m-2 mr-5 float-left shadow-nohover" style="width: 18%;" ng-repeat="empData in employeeData.employeeList" ng-if="empData.userHr">
                        <center> <img class="card-img-top w-50" src="{{empData.rfid.rfidnumber>0?'ImageProvider?id=' + empData.rfid.rfidnumber:''}}" alt="Card image cap" height="125px"></center>
                        <div class="card-body pb-0 pr-0 pl-0">
                            <h5 class="card-title text-center">{{empData.name}}</h5>
                            <p class="card-text text-center">{{empData.email}}</p>
                            <p class="card-text text-center">{{empData.departmentName?empData.departmentName:'-'}}</p>
                            <button type="button" class="btn btn-danger mt-2" ng-click="delHrUser(empData)">Delete User</button>
                            <div class="float-right">
                                <label class="switch">
                                    <input ng-click="toggleHrUserStatus(empData)" ng-checked="{{!empData.hrEnabled}}" class="editMode" type="checkbox">
                                    <span class="slider round"></span>
                                </label><br/>
                                <label>&nbsp;&nbsp;Disable&nbsp;&nbsp;</label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Hr end-->

                <!-- mail start-->
                <div class="tab-pane fade" id="nav-mails" role="tabpanel" ng-init="loadMailData()" aria-labelledby="nav-contact-tab">
                    <div class="container-fluid">
                        <div class="col-sm-2 offset-sm-10 mb-3">
                            <input class="form-control form-control-sm" type="text" placeholder="Search"  ng-model="mailFilter" id="searchBar">
                        </div>
                        <div class="col-sm-12">
                            <table class="table table-striped text-center shadow-nohover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Subject</th>
                                        <th scope="col">Message</th>
                                        <th scope="col">Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-if="mailData.length > 0" ng-repeat="mail in mailData| filter : mailFilter">
                                        <th scope="row">{{$index + 1}}</th>
                                        <td>{{mail.reciver}}</td>
                                        <td>{{mail.subject}}</td>
                                        <td>{{mail.context}}</td>
                                        <td>{{mail.time}}</td>
                                    </tr>
                                    <tr ng-if="mailData.length === 0">
                                        <td colspan="5"><b>No Mails Found...</b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- mail end-->

                <!-- Sms start-->
                <div class="tab-pane fade" id="nav-sms" role="tabpanel" ng-init="loadSmsData()" aria-labelledby="nav-contact-tab">
                    <div class="container-fluid">
                        <div class="col-sm-2 offset-sm-10 mb-3">
                            <input class="form-control form-control-sm" type="text" placeholder="Search"  ng-model="smsFilter" id="searchBar">
                        </div>
                        <div class="col-sm-12">
                            <table class="table table-striped text-center shadow-nohover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Subject</th>
                                        <th scope="col">Message</th>
                                        <th scope="col">Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-if="smsData.length > 0" ng-repeat="sms in smsData| filter : smsFilter">
                                        <th scope="row">{{$index + 1}}</th>
                                        <td>{{sms.reciver}}</td>
                                        <td>{{sms.subject}}</td>
                                        <td>{{sms.context}}</td>
                                        <td>{{sms.time}}</td>
                                    </tr>
                                    <tr ng-if="smsData.length === 0">
                                        <td colspan="5"><b>No Sms Found...</b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Sms end-->

                <!-- Request start-->
                <div class="tab-pane fade" id="nav-request" role="tabpanel" ng-init="loadRequestData()" aria-labelledby="nav-request-tab">
                    <div class="container-fluid">
                        <div class="col-sm-2 offset-sm-10 mb-3">
                            <input class="form-control form-control-sm" type="text" placeholder="Search Request"  ng-model="requestFilter" id="searchBar">
                        </div>
                        <div class="col-sm-12">
                            <div  ng-repeat="request in requestsData| filter:requestFilter" class="animated fadeInUp">
                                <div class="card requestCard shadow-nohover" style="clear: right">
                                    <div class="card-header pending" ng-class="{'pending':request.flag === 'request_pending', 'read':request.flag === 'request_read', 'responded':request.flag === 'request_responded'}">
                                        <span class="float-left">{{request.requestSubject}}</span> 
                                        <span class="float-right">Request Id : {{request.requestId}}</span>
                                    </div>
                                    <div class="card-body">
                                        <div class="float-left">
                                            <h6>Date : {{request.dateTime}}</h6>
                                        </div>
                                        <div class="float-right">
                                            <h6>Employee : {{request.employeeName}}</h6>
                                            <h6>Employee Id : {{request.employeeId}}</h6>
                                        </div>
                                        <br/>
                                        <div style="clear: right">
                                            <p class="requestBody" ng-if="!(request.isRequestRead || request.isRequestReplied)">{{request.requestBody| limitTo:2 }}<button type="button" ng-click="expandView(request)" class="btn btn-link readmoreless">...Read More</button></p>
                                            <p class="requestBody" ng-if="request.isRequestRead || request.isRequestReplied">{{request.requestBody}}</p>

                                        </div>

                                        <div>
                                        </div>
                                        <br/><br/>
                                        <div class="collapse" ng-class="{'show':request.isRequestReplied}" id="{{request.requestId}}" style="clear: right">
                                            <div class="replyCard">
                                                <textarea class="form-control" ng-model="replyBody" id="{{'reply' + request.requestId}}" ng-hide="request.isRequestReplied" rows="3" placeholder="Reply ...."></textarea>
                                                <br/>
                                                <hr class="dashed" ng-hide="!request.isRequestReplied"/>
                                                <h6 ng-hide="!request.isRequestReplied">Date : {{request.replyDateTime}}</h6>
                                                <p ng-hide="!request.isRequestReplied">{{request.requestReply}}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br/>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Request end-->

            </div>


            <!-- Helper Elements-->

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

            <div class="modal fade"  id="addHrUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header border-bottom-0">
                            <div class="col-sm-3 offset-sm-9">
                                <input class="form-control form-control-sm" type="text" placeholder="Search Employee"  ng-model="hrFilter" id="searchBar">
                            </div>
                        </div>
                        <div class="modal-body p-1 mb-2">
                            <table class="table table-striped text-center mb-0" >
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">NAME</th>
                                        <th scope="col">DEPARTMENT</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="empData in employeeData.employeeList| filter : hrFilter" ng-if="!empData.userHr">
                                        <th scope="row">{{empData.employeeId}}</th>
                                        <td>{{empData.name}}</td>
                                        <td>{{empData.departmentName?empData.departmentName:'-'}}</td>
                                        <td><button type="button" class="btn btn-info btn-sm" ng-click="addHrUser(empData)">Add</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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

            <div class="modal fade" ng-if="confirmationData" id="deleteconfirmationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                            <button type="button" class="btn btn-outline-danger" ng-click="deleteUserAttendence(confirmationData)" data-dismiss="modal">Delete Record</button>                        
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <script>
            const src1 = "Resources/expand-button.png";
            const src2 = "Resources/expand-arrow.png";
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

                $scope.loadEmployeesData = function () {
                    const request = {
                        method: 'GET',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        params: {task: GET_ALL_EMPLOYEES},
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
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {employeeId: deleteData.employeeId, task: DELETE_EMPLOYEE}
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
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
                    if (changes > 0) {
                        delete emp.$$hashKey;
                        delete emp.name;
                        emp.isUserHr = emp.userHr;
                        delete emp.userHr;
                        showLoader('body');
                        const request = {
                            method: 'POST',
                            url: 'AdminController',
                            headers: {"api_key": API_KEY},
                            timeout: 10000,
                            params: {employee: JSON.stringify(emp), task: EDIT_EMPLOYEE}
                        };
                        $http(request).then(function (response) {
                            if (response.data !== ERROR) {
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

                $scope.addHrUser = function (employee) {
                    showLoader('.modal');
                    const request = {
                        method: 'POST',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {employeeId: employee.employeeId, task: ADD_NEW_HR}
                    };
                    $http(request).then(function (response) {
                        if (response.data === OK) {
                            employee.userHr = true;
                            employee.hrEnabled = true;
                            $scope.alertCreator('Successfully delegated ' + employee.name + ' as HR, PS notify user to re-login to get its HR rights back', 'alert-success');
                        } else {
                            $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                        }
                        hideLoader('.modal');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('.modal');
                    });
                    $('#addHrUser').modal('hide')
                };

                $scope.delHrUser = function (employee) {
                    showLoader('body');
                    const request = {
                        method: 'POST',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {employeeId: employee.employeeId, task: DELETE_HR}
                    };
                    $http(request).then(function (response) {
                        if (response.data === OK) {
                            employee.userHr = false;
                            employee.hrEnabled = false;
                            $scope.alertCreator('Successfully removed ' + employee.name + ' from HR', 'alert-success');
                        } else {
                            $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.toggleHrUserStatus = function (employee) {
                    showLoader('body');
                    let task;
                    if (employee.hrEnabled) {
                        task = DISABLE_HR;
                    } else {
                        task = ENABLE_HR;
                    }
                    const request = {
                        method: 'POST',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {employeeId: employee.employeeId, task: task}
                    };
                    $http(request).then(function (response) {
                        if (response.data === OK) {
                            if (task === DISABLE_HR) {
                                employee.hrEnabled = false;
                                $scope.alertCreator('Successfully disabled ' + employee.name, 'alert-success');
                            } else {
                                employee.hrEnabled = true;
                                $scope.alertCreator('Successfully enabled ' + employee.name + ' PS notify user to re-login to get its HR rights back', 'alert-success');
                            }
                        } else {
                            $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.loadSmsData = function () {
                    showLoader('body');
                    const request = {
                        method: 'GET',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {task: GET_SMS}
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.smsData = JSON.parse(JSON.stringify(response.data));
                        } else {
                            $scope.alertCreator('Unable to get SMS Data', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.loadMailData = function () {
                    showLoader('body');
                    const request = {
                        method: 'GET',
                        url: 'AdminController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {task: GET_MAILS}
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.mailData = JSON.parse(JSON.stringify(response.data));
                        } else {
                            $scope.alertCreator('Unable to get Mail Data', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.loadCurrentCheckins = function () {
                    showLoader('body');
                    const request = {
                        method: 'GET',
                        url: 'AttendanceController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {task: GET_CURRENT_CHECKINS}
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.currentCheckins = JSON.parse(JSON.stringify(response.data));
                        } else {
                            $scope.alertCreator('Unable to get Current Checkins Data', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.deleteUserAttendanceConfirmation = function (attendance) {
                    $scope.confirmationData = attendance;
                    $('#deleteconfirmationModal').modal('show')
                };

                $scope.editRecordConfirmation = function (attendance) {
                    $scope.editAttendance = attendance;
                    $scope.checkIn = attendance.checkIn;
                    $scope.checkOut = attendance.checkOut;
                    $('#attendanceModal').modal('show')
                };

                $scope.deleteUserAttendence = function (deleteData) {
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

                $scope.loadRequestData = function () {
                    showLoader('body');
                    const request = {
                        method: 'GET',
                        url: 'RequestController',
                        headers: {"api_key": API_KEY},
                        timeout: 10000,
                        params: {task: GET_ADMIN_REQUEST}
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.requestsData = JSON.parse(JSON.stringify(response.data));
                        } else {
                            $scope.alertCreator('Unable to get Request Data', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
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
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
