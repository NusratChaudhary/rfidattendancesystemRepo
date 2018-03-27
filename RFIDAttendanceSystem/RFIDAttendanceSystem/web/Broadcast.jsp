<%-- 
    Document   : broadcast
    Created on : 26 Mar, 2018, 7:24:07 PM
    Author     : mohnish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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



            <div class="row">


                <div class="col-sm-4 bg-light shadow-nohover" style="margin-left: 20px;" >


                    <!-- Alert -->
                    <div class="alert alert-success alert-dismissible fade show" role="alert" >
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
                                <input class="form-check-input" type="radio" name="messageType" id="broadcast" value="0" >
                                <label class="form-check-label" for="inlineRadio1">Broadcast Message</label>
                            </div> &nbsp;&nbsp;&nbsp;
                            <div class="form-check form-check-inline"style="font-size: 20px;">
                                <input class="form-check-input" type="radio" name="messageType" id="individual"  value="1">
                                <label class="form-check-label" for="inlineRadio2">Individual Message</label>
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

                <div class="col-sm-8">


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
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
