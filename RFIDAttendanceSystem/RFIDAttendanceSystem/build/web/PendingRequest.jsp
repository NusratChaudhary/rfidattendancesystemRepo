<%-- 
    Document   : PendingRequest
    Created on : 1 Apr, 2018, 10:57:55 AM
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
        <div ng-app="Request" ng-controller="RequestCtrl" ng-init="loadRequestsData()">

            <!-- Alert -->
            <div class="alert alert-dismissible fade show  animated {{alertData.className}}" style="position: absolute;display: block;width: 50%;left: 25%;"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Alert End -->
            <div class="container-fluid">
                <div class="float-right">

                    <div class="float-right" style="margin-right: 10px">    
                        <center>  <div class="responded rounded-circle" style="width: 20px;height: 20px"></div></center>
                        <p  >Responded</p>
                    </div>
                    <div class="float-right" style="margin-right: 10px">
                        <center><div class="read rounded-circle" style="width: 20px;height: 20px"></div></center>
                        <p >Read</p>
                    </div>
                    <div class="float-right" style="margin-right: 10px">
                        <center> <div class="pending rounded-circle" style=" width: 20px;height: 20px;"></div></center>
                        <p >Pending</p>
                    </div>
                </div>
                <br/><br/>
            </div>
            <div class="container">

                <div  ng-repeat="request in requestsData" class="animated fadeInUp">
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
                                <p class="requestBody">{{request.requestBody}}</p>
                            </div>

                            <div>
                                <button class="btn btn-primary float-right" ng-hide="request.isRequestReplied" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" >
                                    Reply
                                </button>
                            </div>
                            <br/><br/>
                            <div class="collapse" id="collapseExample" style="clear: right">
                                <div class="replyCard">
                                    <textarea class="form-control" rows="3" placeholder="Reply ...."></textarea>
                                    <br/>
                                    <button class="btn btn-success float-right">Send</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {


            });

            var app = angular.module('Request', []);
            app.controller('RequestCtrl', function ($scope, $http, $interval) {

                $scope.loadRequestsData = function () {
                    const request = {
                        method: 'GET',
                        url: 'RequestController',
                        headers: {"api_key": API_KEY},
                        params: {task: GET_REQUESTS},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response !== ERROR) {
                            $scope.requestsData = JSON.parse(JSON.stringify(response.data));
                            console.log($scope.requestsData);
                        }
                        hideLoader('body');
                    }, function (response) {
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };


                $interval(function () {
                    if ($scope.requestsData) {
                        var requestIds = new Array();
                        angular.forEach($scope.requestsData, function (value) {
                            requestIds.push(value.requestId);
                        });
                        const request = {
                            method: 'GET',
                            url: 'RequestController',
                            headers: {"api_key": API_KEY},
                            params: {task: GET_REQUESTS, id: requestIds.toString()},
                            timeout: 10000
                        };
                        $http(request).then(function (response) {
                            console.log(response);
                            if (response.data !== ERROR && response.data !== REQUESTS_NOT_FOUND) {
                                angular.forEach(JSON.parse(JSON.stringify(response.data)), function (request) {
                                    $scope.requestsData.push(request);
                                });
                            }
                        }, function (response) {
                            console.log('Error ', response);
                        });
                    }
                }, 5000);

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
