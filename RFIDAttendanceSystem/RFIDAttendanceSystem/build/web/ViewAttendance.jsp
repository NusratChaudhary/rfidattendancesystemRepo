<%-- 
    Document   : ViewAttendance
    Created on : 1 Apr, 2018, 8:09:52 PM
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
        <title>JSP Page</title>
        
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br/><br/>




        <div class="container">

            <div class="row">
                <div class="col-sm-2 offset-sm-11" id="controlButton" >
                    <img src="Resources/printer.png"  onclick="window.print()" style="height: 40px;width: 40px;padding: 5px;cursor: pointer; "  alt="print"/>
                    <img src="Resources/email.png" style="height: 40px;width: 40px;padding: 5px;cursor: pointer;" data-toggle="modal" data-target="#exampleModalCenter" alt="email"/>
                </div>

            </div>

            <table class="table table-striped shadow-nohover employeeAttendance">
                <thead >
                <th>Date</th>
                <th >Check In</th>
                <th >Check Out</th>

                </tr>
                </thead>
                <tbody >
                    <tr>
                        <th >1</th>
                        <td>Mark</td>
                        <td>Otto</td>

                    </tr>
                    <tr>
                        <th >2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>

                    </tr>
                    <tr>
                        <th >3</th>
                        <td>Larry</td>
                        <td>the Bird</td>

                    </tr>
                </tbody>
            </table>

            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirmation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you want to send Email on abc@gmail.com ?


                            <center> <button type="button" class="btn btn-sm btn-primary">Send Report</button></center>
                        </div>

                    </div>
                </div>
            </div>

        </div>




        <script>

            $(document).ready(function () {




            });
        </script>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
