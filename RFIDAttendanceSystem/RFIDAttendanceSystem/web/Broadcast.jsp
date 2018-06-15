<%-- 
    Document   : broadcast
    Created on : 26 Mar, 2018, 7:24:07 PM
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
        <br/><br/>
        <div class="container-fluid" ng-app="Broadcast" ng-controller="BroadcastCtrl" ng-init="loadBroadcasts()">

            <!-- Alert -->
            <div class="alert alert-dismissible fade show  animated {{alertData.className}}" style="position: absolute;display: block;width: 50%;left: 25%; z-index: 999"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>                
            </div>
            <!-- Alert End -->

            <div  style="margin-left: 5px;margin-right: 5px;">
                <div class="float-left bg-light shadow-nohover" >
                    <div style="margin-left: 10px">      
                        <div class="form-group form-group-padding" >
                            <label>Message</label>
                            <textarea class="form-control" ng-model="messageTextArea" rows="5" ></textarea>
                        </div>
                        <center> <div class="form-check form-check-inline " style="font-size: 20px;">
                                <input class="form-check-input" ng-model="messageType" type="radio" name="messageType" id="broadcast" value="0" >
                                <label class="form-check-label" for="broadcast">Broadcast Message</label>
                            </div> 
                            <div class="form-check form-check-inline" style="font-size: 20px;">
                                <input class="form-check-input" ng-model="messageType" type="radio" name="messageType" id="individual"  value="1">
                                <label class="form-check-label" for="individual">Individual Message</label>
                            </div>
                        </center>
                        <div class="form-group form-group-padding animated fadeIn" id="employeeSelector" style="display: none">
                            <label for="exampleInputPassword1" >Receipt</label>
                            <select multiple class="form-control" ng-model="employeesMultiselect" id="exampleFormControlSelect2">
                                <option ng-repeat="employee in broadcastData.employeesList" value="{{employee.employeeId}}">
                                    {{employee.firstName}} {{employee.lastName}} {{'[' + employee.employeeId + ']'}}
                                </option>

                            </select>
                        </div>
                        <div class="form-group form-group-padding">
                            <center> <button type="button" ng-click="postBroadcast()" ng-disabled="!(messageTextArea && employeesMultiselect || messageType === '0')" class="btn btn-primary">Submit</button></center>
                        </div>
                    </div>
                </div>

                <div class="float-right col-sm-8">
                    <div style="overflow-y:auto;padding: 10px">
                        <div ng-repeat="broadcast in broadcastData.broadcastList| reverse" ng-if="broadcastData">
                            <div class="card">
                                <div class="card-header clearfix">
                                    <h5 class="float-left">{{broadcast.broadcastType==='individual_mode'?'Individual':'Broadcast'}}</h5>
                                    <h6 class="float-right text-muted mb-0 mt-1" ng-hide="{{broadcast.flag === 'broadcast_active'}}">Deleted</h6>
                                </div>
                                <div class="card-body">
                                    <div class="clearfix">
                                        <p class="card-text float-left">{{broadcast.message}}</p>
                                        <ul ng-if="broadcast.employeesList" class="list-group float-right scrollStyle mb-5  p-2 broadcastEmployeeList">
                                            <li ng-repeat="employee in broadcast.employeesList" class="list-group-item">
                                                {{employee.firstName}} {{employee.lastName}} {{'[' + employee.employeeId + ']'}}
                                            </li>
                                        </ul>
                                    </div>
                                    <a href="#"  class="btn btn-danger  float-right" ng-click="deleteBroadcast(broadcast)" ng-hide="{{broadcast.flag !== 'broadcast_active'}}">Delete</a>
                                </div>
                            </div>
                            <br/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('#individual').click(function () {
                    $('#employeeSelector').css('display', 'block');
                });

                $('#broadcast').click(function () {
                    $('#employeeSelector').css('display', 'none');
                });
            });


            showLoader('body');
            var app = angular.module('Broadcast', []);
            app.filter('reverse', function () {
                return function (items) {
                    return items.slice().reverse();
                };
            });
            app.controller('BroadcastCtrl', function ($scope, $http) {
                $scope.loadBroadcasts = function () {
                    const request = {
                        method: 'GET',
                        url: 'BroadcastController',
                        headers: {"api_key": API_KEY},
                        params: {task: LOAD_BROADCASTDATA},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.broadcastData = JSON.parse(JSON.stringify(response.data));
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.postBroadcast = function () {
                    showLoader('body');
                    var multiselect = null;
                    if ($scope.employeesMultiselect !== null && $scope.messageType === "1") {
                        multiselect = $scope.employeesMultiselect.toString();
                    }
                    const request = {
                        method: 'POST',
                        url: 'BroadcastController',
                        headers: {"api_key": API_KEY},
                        params: {task: POST_BROADCAST, multiselect: multiselect, message: $scope.messageTextArea},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR) {
                            $scope.broadcastData.broadcastList.push(JSON.parse(JSON.stringify(response.data)));
                            $scope.alertCreator('Broadcast Posted Successfully', 'alert-success');
                        } else {
                            $scope.alertCreator('Unable to Contact Server', 'alert-danger');
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };

                $scope.deleteBroadcast = function (data) {
                    const request = {
                        method: 'POST',
                        url: 'BroadcastController',
                        headers: {"api_key": API_KEY},
                        params: {task: DELETE_BROADCAST, id: data.id},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response.data === OK) {
                            $scope.broadcastData.broadcastList.forEach(function (item, index, object) {
                                if (data.id === item.id) {
                                    object.splice(index, 1);
                                }
                            });
                            $scope.alertCreator('Broadcast Deleted Successfully', 'alert-success');
                        } else {
                            $scope.alertCreator('Unable to Contact Server', 'alert-danger');
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
                    $("html, body").animate({scrollTop: 0}, "fast");
                    setTimeout(function () {
                        var element, name, arr;
                        element = document.getElementById("messageAlert");
                        name = "fadeOut";
                        arr = element.className.split(" ");
                        if (arr.indexOf(name) == -1) {
                            element.className += " " + name;
                        }
                        $scope.alertData = null;
                    }, 2000);
                };

            });

            angular.bootstrap(document.getElementById('broadcastMarquee'), ['EmployeeBroadcast']);
            document.title = '<%=((Employee) session.getAttribute("userData")).getName()%>';
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
