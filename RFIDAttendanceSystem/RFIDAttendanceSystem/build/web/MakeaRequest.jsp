<%-- 
    Document   : MakeaRequest
    Created on : 12 May, 2018, 11:35:48 AM
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

        <div ng-app="Request" ng-controller="RequestCtrl" ng-init="loadRequests(false)">

            <!-- Alert -->
            <div class="alert alert-dismissible fade show  animated {{alertData.className}}" style="position: absolute;display: block;width: 50%;left: 25%;"  ng-show="alertData" id="messageAlert" role="alert" >
                <center> {{alertData.message}} </center>
            </div>
            <!-- Alert End -->

            <div class="container-fluid">
                <div class="col-sm-1 offset-sm-11">
                    <button type="button" class="btn btn-outline-primary"  data-toggle="modal" data-target="#composeRequest"> Compose</button>
                </div>
                <br/><br/>
                <div class="clearfix">

                    <div class="float-left">

                        <div class="list-group bg-light shadow-nohover requestsList scrollStyle" id="list-tab" role="tablist">
                            <a ng-repeat="request in requestData" class="list-group-item list-group-item-action " id="list-home-list" data-toggle="list" href="{{'#' + request.requestId}}" role="tab" aria-controls="home">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">{{request.requestSubject}}</h5>
                                    <small>{{request.dateTime}}</small>
                                </div>
                                <p class="mb-1">{{request.requestBody| limitTo : 50}}....</p>
                                <small class="float-right">
                                    <div class="rounded-circle" ng-class="{'pending':request.flag === 'request_pending', 'read':request.flag === 'request_read', 'responded':request.flag === 'request_responded'}" style="width: 12px;height: 12px;"></div></small>
                            </a>
                        </div>
                    </div>
                    <div class="offset-sm-3">
                        <div class="tab-content" id="nav-tabContent">

                            <div ng-repeat="request in requestData" class="tab-pane fade show " id="{{request.requestId}}" role="tabpanel" aria-labelledby="list-home-list">

                                <div class="card requestCard shadow-nohover" style="clear: right">
                                    <div class="card-header" style="font-weight: 500 !important;" ng-class="{'pending':request.flag === 'request_pending', 'read':request.flag === 'request_read', 'responded':request.flag === 'request_responded'}">
                                        <span class="float-left">{{request.requestSubject}}</span> 
                                        <span class="float-right">Request Id : {{request.requestId}}</span>
                                    </div>
                                    <div class="card-body">
                                        <div class="float-right">
                                            <h6>Date : {{request.dateTime}}</h6>
                                        </div>
                                        <br/>
                                        <div style="clear: right">
                                            <p class="requestBody">
                                                {{request.requestBody}} 
                                            </p>
                                        </div>
                                        <div ng-show="request.isRequestReplied">
                                            <hr class="dashed"/>
                                            <div class="clearfix">
                                                <div class="float-left">
                                                    <h6>Replied By - HR</h6>
                                                </div>
                                                <div class="float-right">
                                                    <h6>Date : {{request.replyDateTime}}</h6>
                                                </div>
                                            </div>
                                            <div>
                                                <p class="requestBody">
                                                    {{request.requestReply}}    
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>

                </div>
            </div>




            <!-- Request Modal -->
            <div class="modal fade" id="composeRequest" tabindex="-1" role="dialog" aria-labelledby="composeRequestLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Compose Request</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="subject">Subject</label>
                                    <input type="text" ng-model="sendSubject" class="form-control" id="subject" aria-describedby="emailHelp" placeholder="Enter Subject">
                                </div>
                                <div class="form-group">
                                    <label for="message">Message</label>
                                    <textarea class="form-control" ng-model="sendMessage" id="message" rows="5" placeholder="Enter Message"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" ng-click="sendRequest()" ng-disabled="!(sendSubject && sendMessage)" class="btn btn-primary">Send</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>




        </div>

        <script>
            $(document).ready(function () {
                $('#composeRequest').on('hidden.bs.modal', function (e) {
                    $('#subject').val('');
                    $('#message').val('');
                });
            });
            var app = angular.module('Request', []);
            app.controller('RequestCtrl', function ($scope, $http, $interval) {
                $scope.response;
                $scope.loadRequests = function (alreadyExecuted) {

                    const request = {
                        method: 'GET',
                        url: 'RequestController',
                        headers: {"api_key": API_KEY},
                        params: {task: GET_REQUESTS},
                        timeout: 10000
                    };
                    $http(request).then(function (response) {
                        if (response.data !== ERROR && response.data !== 'invalidRequest' && response.data !== REQUESTS_NOT_FOUND) {
                            if (!(alreadyExecuted && ($scope.response === JSON.stringify(response.data)))) {
                                $scope.requestData = JSON.parse(JSON.stringify(response.data));
                                $scope.response = JSON.stringify(response.data);
                            }
                        } else if (response.data === REQUESTS_NOT_FOUND && !alreadyExecuted) {
                            $scope.alertCreator('No Request Made Till Now...', 'alert-info');
                        } else {
                            if (!alreadyExecuted) {
                                $scope.alertCreator('Error in Retriving Requests', 'alert-danger');
                            }
                        }
                        hideLoader('body');
                    }, function (response) {
                        $scope.alertCreator('Error in Retriving Requests', 'alert-danger');
                        console.log('Error ', response);
                        hideLoader('body');
                    });
                };
                $interval(function () {
                    $scope.loadRequests(true);
                }, 5000);

                $scope.sendRequest = function () {
                    if ($scope.sendSubject && $scope.sendMessage) {
                        showLoader('modal');
                        const request = {
                            method: 'POST',
                            url: 'RequestController',
                            headers: {"api_key": API_KEY},
                            params: {task: ADD_REQUEST, subject: $scope.sendSubject, message: $scope.sendMessage},
                            timeout: 10000
                        };
                        $http(request).then(function (response) {
                            if (response.data !== ERROR && response.data !== 'invalidRequest') {
                                $scope.sendRequestStatus = JSON.parse(JSON.stringify(response.data));
                                if ($scope.sendRequestStatus.status === OK) {
                                    $scope.alertCreator('Your request will be replied soon, your request id is ' + $scope.sendRequestStatus.id, 'alert-success');
                                } else {
                                    $scope.alertCreator($scope.sendRequestStatus.message, 'alert-danger');
                                }
                            } else {
                                $scope.alertCreator('Error in Sending Requests', 'alert-danger');
                            }
                            hideLoader('modal');
                        }, function (response) {
                            $scope.alertCreator('Error in Sending Requests', 'alert-danger');
                            console.log('Error ', response);
                            hideLoader('modal');
                        });
                    }
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
