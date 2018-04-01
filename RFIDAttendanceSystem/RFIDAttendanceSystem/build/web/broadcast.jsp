<%-- 
    Document   : broadcast
    Created on : 26 Mar, 2018, 7:24:07 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Broadcast</title>

    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <br/><br/>
        <div class="container-fluid" >



            <div class="" style="margin-left: 5px;margin-right: 5px;">


                <div class="float-left bg-light shadow-nohover" >
                    <div style="margin-left: 10px">

                        <!-- Alert -->
                        <div class="alert alert-success alert-dismissible fade show" id="messageAlert"role="alert" >
                            <center> Message Sent Succesfully ! </center>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <!-- Alert End -->


                        <form>
                            <div class="form-group form-group-padding" >
                                <label>Message</label>
                                <textarea class="form-control" rows="5" ></textarea>
                            </div>


                            <center> <div class="form-check form-check-inline " style="font-size: 20px;">
                                    <input class="form-check-input"  type="radio" name="messageType" id="broadcast" value="0" >
                                    <label class="form-check-label" for="broadcast">Broadcast Message</label>
                                </div> 
                                <div class="form-check form-check-inline" style="font-size: 20px;">
                                    <input class="form-check-input" type="radio" name="messageType" id="individual"  value="1">
                                    <label class="form-check-label" for="individual">Individual Message</label>
                                </div>
                            </center>


                            <div class="form-group form-group-padding animated fadeIn" id="employeeSelector" style="display: none">
                                <label for="exampleInputPassword1">Receipt</label>
                                <select multiple class="form-control" id="exampleFormControlSelect2">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>

                            <div class="form-group form-group-padding">
                                <center> <button type="submit" class="btn btn-primary">Submit</button></center>
                            </div>

                        </form>
                    </div>
                </div>

                <div class="float-right col-sm-8">

                    <div class="alert alert-success alert-dismissible fade show" id="commonAlert"role="alert" >
                        <center> Message Deleted Succesfully! </center>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div style="overflow-y:auto;padding: 10px">
                        <div class="card">
                            <div class="card-header">
                                <h5>   Message Type : Broadcast
                                </h5>
                            </div>
                            <div class="card-body">

                                <p class="card-text">Office will be closed from 21st March till 25th March due to painting work</p>
                                <a href="#"  class="btn btn-danger  float-right  ">Delete</a>
                            </div>
                        </div>
                        <br/>
                        <div class="card">
                            <div class="card-header">
                                <h5>   Message Type : Individual [Rajesh Jain (0012548)] </h5>
                            </div>
                            <div class="card-body">

                                <p class="card-text">PLease meet Mr Dubey [HR Dept] to talk about salary issues</p>
                                <a href="#" class="btn btn-danger float-right">Delete</a>
                            </div>
                        </div>

                    </div>
                </div>




            </div>


        </div>




        <script>


            $("#messageAlert").fadeTo(2000, 500).slideUp(500, function () {
                $("#messageAlert").slideUp(500);
            });

            $("#commonAlert").fadeTo(2000, 500).slideUp(500, function () {
                $("#commonAlert").slideUp(500);
            });

            $(document).ready(function () {

                $('#individual').click(function () {
                    $('#employeeSelector').css('display', 'block');

                });

                $('#broadcast').click(function () {
                    $('#employeeSelector').css('display', 'none');

                });


            });
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
