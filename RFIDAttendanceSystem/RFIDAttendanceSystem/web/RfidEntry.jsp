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
        <link rel="stylesheet" href="mystyle.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>RFID Attendance</title>
    </head>
    <body>

        <!-- Button trigger modal -->
        <button type="button"  id="modalTrigger" data-toggle="modal" style="display: none" data-target="#loginModal"></button>




        <!--Credential Modal -->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">RFID Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form  method="post" id="loginForm">

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Passcode</label>
                                <div class="col-sm-8">
                                    <input type="password" id="passcode" class="form-control" maxlength="6" style="text-transform: capitalize" id="passcode" placeholder="Passcode">
                                </div>
                            </div>
                            <!--   <div class="form-group row">
                                   <div class=" offset-sm-5">
                                       <button type="submit" class="btn btn-primary">&nbsp;&nbsp; Submit &nbsp;&nbsp;</button>
                                   </div>
                               </div>-->
                        </form>
                    </div>

                </div>
            </div>
        </div>




        <script>
            $(document).ready(function () {
                var counter = 0;
                $('#modalTrigger').click();

                $('#passcode').keypress(function () {
                    counter = counter + 1;
                    if (counter === 6) {

                      /*  $.post('#', {passcode: $(#passcode).val()},
                                function (data, status) {

                                });*/
                    }
                });

            });
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

    </body>
</html>
