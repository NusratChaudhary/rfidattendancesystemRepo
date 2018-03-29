<%-- 
    Document   : RfidEntry
    Created on : 22 Mar, 2018, 3:57:18 PM
    Author     : mohnish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="CSS/animate.css">
        <title>RFID Attendance</title>
    </head>
    <body class="bg-secondary">



        <div class="container">
            <div class="center-div">
                <div class="bg-light shadow-nohover" >
                    <div style="margin-left: 10px">

                        <!-- Alert -->
                        <div class="alert alert-success alert-dismissible fade show" role="alert" >
                            <center><strong> Successfully Checked In ! </strong></center>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        
                        
                        
                        <div class="alert alert-danger alert-dismissible fade show" role="alert" >
                            <center> <strong>Something Went Wrong Contact Administrator ! </strong></center>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <!-- Alert End -->


                        <form>
                            <div class="form-group form-group-padding" >
                                <label ><h3>Card Number</h3></label>
                                <input type="text" class="form-control" autofocus="true">
                            </div>




                        </form>
                    </div>
                </div>

            </div>

        </div>























        <!-- Button trigger modal 
        <button type="button"  id="modalTrigger" data-toggle="modal" style="display: none" data-target="#loginModal"></button>

        
        
        First check if any token is recd if yes then show rfis page else show passcode den get auth token and show page
        
        


     
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">RFID Login</h5>
                        <button type="button" class="close" onclick="javascript:window.history.back();" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form  method="post" id="loginForm">

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Passcode</label>
                                <div class="col-sm-8">
                                    <input type="password" required autofocus="true"id="passcode" class="form-control"  maxlength="6" style="text-transform: capitalize;" placeholder="Passcode">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-5" id="statusContainer">
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>




        <script>
            $(document).ready(function () {

                $('#modalTrigger').click(); // click if no seesion found

                $('#passcode').keyup(function () {

                    var data = $('#passcode').val();

                    if (data.length !== 6) {
                        $('#passcode').removeClass('wrongInput');
                        $('#status').remove();
                    }
                    if (data.length === 6) {
                        $('#passcode').blur();
                        $('#passcode').addClass('wrongInput');
                        //  $('#passcode').addClass('rightInput');
                        $("#statusContainer").after("<p id='status'  class='lead animated fadeIn'>Loading <span class='animated infinite fadeOutRight'>...</span></p>");
                        /*   $.post('#', {passcode: $(#passcode).val()},
                         function (data, status) {
                         
                         });*/
                    }
                });


                $('#loginModal').on('hidden.bs.modal', function () {
                    window.history.back();
                });

            });
        </script>-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

    </body>
</html>
