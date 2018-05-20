<%-- 
    Document   : RfidEntry
    Created on : 22 Mar, 2018, 3:57:18 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
        <script src="CSS/jquery.loading.js"></script>
        <link href="CSS/jquery.loading.css" rel="stylesheet">
        <title>RFID Attendance</title>
    </head>
    <body class="bg-secondary">
        <div class="container" >
            <div class="center-div">
                <div class="bg-light shadow-nohover" >
                    <div id="main" style="margin-left: 10px">
                        <div id="rfidForm" class="form-group form-group-padding" >
                            <label ><h3>Card Number</h3></label>
                            <input type="password"  id="rfidNumber"  readonly autofocus class="form-control">
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <script>

            $('html').on('keyup', function (e) {
                if (e.keyCode === 8 || e.keyCode === 46 || e.keyCode === 27) {
                    $('#rfidNumber').val('');
                }
                
                if ($('#rfidNumber').val().length <= 10) {
                    if (e.keyCode >= 48 && e.keyCode <= 57 || e.keyCode >= 96 && e.keyCode <= 105) { // 46 -57 is for keypress[rfid] and 96-105 for keyup[keyboard]            
                        $('#rfidNumber').val($('#rfidNumber').val() + e.key);
                    }
                    if (e.keyCode === 13) {
                        showLoader('body');
                        $.ajax({
                            type: "POST",
                            headers: {"api_key": API_KEY},
                            url: "AttendanceController",
                            timeout: 5000,
                            data: {'rfid': $('#rfidNumber').val()},
                            success: function (data) {
                                let alertData = null;
                                hideLoader('body');
                                $('#rfidNumber').val('');
                                if (data === ATTENDANCE_IN) {
                                    alertData = {classType: 'alert-success', message: 'Checkin Success'}
                                } else if (data === ATTENDANCE_OUT) {
                                    alertData = {classType: 'alert-success', message: 'CheckOut Success'}
                                } else if (data === ATTENDANCE_ALREADY_COMPLETED) {
                                    alertData = {classType: 'alert-info', message: 'Your Attendance is already done'}
                                } else if (data === USER_HOLIDAY) {
                                    alertData = {classType: 'alert-warning', message: 'Sorry Cant Checkin You are on Holiday'}
                                } else if (data === USER_INACTIVE) {
                                    alertData = {classType: 'alert-warning', message: 'Sorry Cant Checkin You are disabled'}
                                } else if (data === USER_VERIFY) {
                                    alertData = {classType: 'alert-warning', message: 'Sorry Cant Checkin Please Complete Verification'}
                                } else if (data === RFID_CARD_NOT_AVAILABLE) {
                                    alertData = {classType: 'alert-warning', message: 'No such card found or Card is invalid'}
                                } else {
                                    alertData = {classType: 'alert-danger', message: 'Error Occured Please Contact Administrator'}
                                }
                                showAlert(alertData);
                            },
                            error: function (e) {
                                console.log(e);
                                let alertData = {classType: 'alert-danger', message: 'API Error'};
                                hideLoader('body');
                                $('#rfidNumber').val('');
                                showAlert(alertData);
                            }
                        });
                    }
                }
            });

            function  showAlert(data) {
                var template = "<div class='alert " + data.classType + " alert-dismissible fade show' role='alert' ><center id='message'>" + data.message + "</center><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                $('#rfidForm').before(template);
                hideAlert();
                setTimeout(function () {
                    $('.alert').remove();
                }, 2500);
            }
            function hideAlert() {
                $('.alert').fadeTo(1000, 500).slideUp(500);
            }

        </script>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

    </body>
</html>
