
<%@page import="Shared.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand text-white lead" href="welcome.jsp" style="font-weight: 400;">Symphid</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

        </ul>
        <%
            // Session COntroller 
            if (session.getAttribute("id") != null) {
        %>
        <div class="login" >
            <div class="notification-item">
                <a href="#">
                    <span class="notification-badge">5</span>
                    <img src="Resources/notificatonIcon.png" alt="notificatonIcon" />
                </a>
            </div>

            <button type="button" class="btn btn-sm btn-light mr-sm-2 " id="signoutButton"  data-toggle="modal" >&nbsp;&nbsp;&nbsp;SIGNOUT&nbsp;&nbsp;&nbsp;</button>                 
        </div>
        <%
        } else {
            String uri = request.getRequestURI();
            String currentPage = uri.substring(uri.lastIndexOf("/") + 1);
            if (Constants.FLAGGED_PAGES.contains(currentPage)) {
        %>
        <script>
            window.location.href = "welcome.jsp";
        </script>
        <%
            }

        %>
        <div class="without-login"  >
            <button type="button" class="btn btn-sm btn-light mr-sm-2 "  data-toggle="modal" data-target="#loginModal">&nbsp;&nbsp;&nbsp;LOGIN&nbsp;&nbsp;&nbsp;</button>
            <button type="button" class="btn btn-sm btn-light mr-sm-2" data-toggle="modal" data-target="#registrationModal">&nbsp;&nbsp;&nbsp;SIGNUP&nbsp;&nbsp;&nbsp;</button>
        </div>
        <%            }
        %>






    </div>
</nav>
<marquee  ng-app="EmployeeBroadcast" ng-controller="EmployeeBroadcastCtrl" ng-init="showBroadcast()">
    <p ng-repeat="data in employeeBroadcast">{{data.message}}</p>
</marquee>      

<script>
    var app = angular.module('EmployeeBroadcast', []);
    app.controller('BroadcastCtrl', function ($scope, $http) {

        $scope.showBroadcast = function () {
            const request = {
                method: 'GET',
                url: 'BroadcastController',
                headers: {"api_key": API_KEY},
                params: {task: LOAD_BROADCAST_EMPLOYEE},
                timeout: 10000
            };
            $http(request).then(function (response) {
                if (response.data !== ERROR) {
                    console.log(response.data);
                    $scope.employeeBroadcast = JSON.parse(JSON.stringify(response.data));
                }
            }, function (response) {
                console.log('Error ', response);
            });
        };
    });
</script>






<!--  MODALS Below-->

<!--Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"> Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="post" id="loginForm">
                    <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email" required autofocus>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword3" name="password"  placeholder="Password" required>
                        </div>
                    </div>


                    <div class="form-group row">
                        <div class="col-sm-12">
                            <center>  <button type="submit" id="signInButton" class="btn btn-primary">Sign in</button></center>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!--Login Model End -->


<!--Regist Modal -->
<div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">



            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">SIGNUP</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="registrationForm" enctype="multipart/form-data">

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="firstName">First Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="firstName" minlength="3" name="firstName"  placeholder="First Name" required autofocus>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="lastName">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="lastName" minlength="3" name="lastName" placeholder="Last Name" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Gender</label>
                        <div class="col-sm-8">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked="true">
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="phoneNumber">Phone Number</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phoneNumber" minlength="10" name="mobileNumber" placeholder="Phone Number" required>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="dateOfBirth">Date of Birth</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"  placeholder="Date of Birth" required >
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="email">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" minlength="6" name="email" placeholder="Email" required>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="password">Password</label>
                        <div class="col-sm-8" >
                            <input type="password" class="form-control" id="password" minlength="6" name="password" placeholder="Password" required>

                        </div>

                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="comment">Address</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="4" id="comment" name="address" minlength="10" required></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Upload Picture</label>
                        <div class="col-sm-8">
                            <input type="file"  class="form-control" id="profilePicture" name="file" accept="image/jpg,image/jpeg,image/png" required>
                        </div>
                    </div>



                    <div class="form-group row">                   
                        <div class="col-sm-12 offset-sm-4">
                            <button type="submit" id="signUpButton" class="btn btn-primary">&nbsp;&nbsp; SignUp &nbsp;&nbsp;</button>
                        </div>

                    </div>



                </form>
            </div>

        </div>
    </div>
</div>

<!--Regist Model End -->


<script>


    $(document).ready(function () {

        const BASE_URL = 'http://' + window.location.hostname + ':8080/RFIDAttendanceSystem/';
        // Registration Start
//
        $('#registrationForm').submit(function (event) {

            event.preventDefault();
            $('#signUpButton').prop('disabled', true);
            showLoader('.modal');
            if (!$.isNumeric($('#phoneNumber').val())) {
                $('#phoneNumber').val('');
                $('#phoneNumber').addClass('animated  pulse');
                $('#phoneNumber').attr('placeholder', 'Enter Valid Phone Number');
                return;
            }


            // Get form
            var form = document.getElementById('registrationForm');
            var fdata = new FormData(form);
            //   fdata.append({name: 'api_key', value: API_KEY});

            $.ajax({
                type: "POST",
                url: "Registration",
                headers: {"api_key": API_KEY},
                timeout: 100000,
                data: fdata,
                processData: false,
                contentType: false,
                cache: false,
                success: function (data) {
                    if (data === REGISTER_SUCCESS) {
                        hideLoader('.modal');
                        $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-success' id='modalAlert' role='alert'><center>Registration Successful...</center></div>");
                        $("#signUpButton").prop("disabled", false);
                        alertTimeout();
                        setTimeout(function () {
                            document.getElementById("registrationForm").reset();
                            $('#registrationModal').modal('toggle');
                            $('#loginModal').modal('toggle');
                        }, 1500);
                    } else if (data === RFID_CARD_NOT_AVAILABLE) {
                        hideLoader('.modal');
                        $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-warning' id='modalAlert' role='alert'><center>Unable to register RFID card is not available...</center></div>");
                        $("#signUpButton").prop("disabled", false);
                        alertTimeout();
                        document.getElementById("registrationForm").reset();
                    } else if (data === REGISTER_ALREADY) {
                        hideLoader('.modal');
                        $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-warning' id='modalAlert' role='alert'><center>You Have Already Registered You May Procced to Login...</center></div>");
                        $("#signUpButton").prop("disabled", false);
                        alertTimeout();
                        document.getElementById("registrationForm").reset();
                    } else {
                        hideLoader('.modal');
                        $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Unable To Register...</center></div>");
                        $("#signUpButton").prop("disabled", false);
                        alertTimeout();
                        document.getElementById("registrationForm").reset();
                    }

                },
                error: function (e) {
                    console.log(e);
                    hideLoader('.modal');
                    $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Unable To Register...</center></div>");
                    $("#signUpButton").prop("disabled", false);
                    alertTimeout();
                    document.getElementById("registrationForm").reset();
                }
            });
        });
        // Registration End



        // Login start

        $('#loginForm').submit(function (event) {
            event.preventDefault();
            showLoader('.modal');
            $('#signInButton').prop('disabled', true);
            var form = $(this).serializeArray();
            $.ajax({
                type: "POST",
                headers: {"api_key": API_KEY},
                url: "Login",
                timeout: 10000,
                data: form,
                success: function (data) {
                    if (data === LOGIN_SUCCESS) {
                        hideLoader('.modal');
                        window.location.replace(BASE_URL + 'EmployeeHome.jsp');
                    } else if (data === LOGIN_HOLIDAY) {
                        hideLoader('.modal');
                        $("#loginModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Login is disabled as user is on holiday !!!</center></div>");
                    } else if (data === USER_VERIFY) {
                        hideLoader('.modal');
                        $("#loginModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Please Verify your Email !!!</center></div>");
                    } else {
                        hideLoader('.modal');
                        $("#loginModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Email and Password is incorrect !!!</center></div>");
                    }
                    $("#signInButton").prop("disabled", false);
                    alertTimeout();
                    document.getElementById("loginForm").reset();
                },
                error: function (e) {
                    console.log(e);
                    hideLoader('.modal');
                    $("#loginModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Email and Password is incorrect !!!</center></div>");
                    $("#signInButton").prop("disabled", false);
                    alertTimeout();
                    document.getElementById("loginForm").reset();
                }
            });
        });
        // Login End



        $('#signoutButton').click(function (event) {
            showLoader('body');
            $('#signoutButton').prop('disabled', true);
            $.ajax({
                type: "GET",
                headers: {"api_key": API_KEY},
                url: "Signout",
                timeout: 10000,
                success: function (data) {
                    if (data === LOGGED_OUT) {
                        sessionStorage.removeItem('isConfirmed');
                        hideLoader('.modal');
                        window.location.replace(BASE_URL + '/welcome.jsp');
                    } else {
                        hideLoader('body');
                    }
                    $("#signoutButton").prop("disabled", false);
                },
                error: function (e) {
                    console.log(e);
                    hideLoader('body');
                }
            });
        });

// Helpers Below

        function alertTimeout() {
            $("#modalAlert").fadeTo(2000, 500).slideUp(500, function () {
                $("#modalAlert").slideUp(500);
                $("#modalAlert").remove();
            });
        }
    });
    var d = new Date();
    d.setFullYear(d.getFullYear() - 18);
    if (parseInt(d.getMonth() + 1) < 10) {
        var backDate = d.getFullYear() + '-0' + parseInt(d.getMonth() + 1) + '-' + d.getDate();
    } else {
        var backDate = d.getFullYear() + '-' + parseInt(d.getMonth() + 1) + '-' + d.getDate();
    }
    document.getElementById("dateOfBirth").max = backDate.trim();


</script>






