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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
        <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">      
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br/>

        <div ng-app="Request" ng-controller="RequestCtrl">

            <div class="container-fluid">
                <div class="col-sm-1 offset-sm-11">
                    <button type="button" class="btn btn-outline-primary"  data-toggle="modal" data-target="#composeRequest"> Compose</button>
                </div>
                <br/><br/>
                <div class="clearfix">

                    <div class="float-left">

                        <div class="list-group bg-light shadow-nohover requestsList scrollStyle" id="list-tab" role="tablist">
                            <a class="list-group-item list-group-item-action " id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">Request Subject</h5>
                                    <small>3 days ago</small>
                                </div>
                                <p class="mb-1">Donec id elit non mi porta gravida at eget metus......</p>
                                <small class="float-right"><div class="pending rounded-circle" style="width: 12px;height: 12px;"></div></small>
                            </a>
                            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
                            <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>
                            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
                            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
                            <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>
                            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
                            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
                            <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>
                            <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
                        </div>

                    </div>
                    <div class="offset-sm-3">
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show " id="list-home" role="tabpanel" aria-labelledby="list-home-list">

                                <div class="card requestCard shadow-nohover" style="clear: right">
                                    <div class="card-header pending">
                                        <span class="float-left">request Subject</span> 
                                        <span class="float-right">Request Id : 1234</span>
                                    </div>
                                    <div class="card-body">
                                        <div class="float-right">
                                            <h6>Date : 01/04/2016</h6>
                                        </div>
                                        <br/>
                                        <div style="clear: right">
                                            <p class="requestBody">
                                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                            </p>
                                        </div>
                                        <hr class="dashed"/>
                                        <div class="clearfix">
                                            <div class="float-left">
                                                <h6>Replied By - abc</h6>
                                            </div>
                                            <div class="float-right">
                                                <h6>Date : 01/04/2016</h6>
                                            </div>
                                        </div>

                                        <div>
                                            <p class="requestBody">
                                                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                            </p>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...</div>
                            <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>
                            <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
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
                                    <input type="text" class="form-control" id="subject" aria-describedby="emailHelp" placeholder="Enter Subject">
                                </div>
                                <div class="form-group">
                                    <label for="message">Message</label>
                                    <textarea class="form-control" id="message" rows="5" placeholder="Enter Message"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Send</button>
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
            app.controller('RequestCtrl', function ($scope, $http) {


            });


            document.title = '<%=((Employee) session.getAttribute("userData")).getName()%>';
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>       
    </body>
</html>
