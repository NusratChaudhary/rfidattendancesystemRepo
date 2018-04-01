<%-- 
    Document   : AttendanceControl
    Created on : 1 Apr, 2018, 1:14:36 PM
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
        <br/>

        <div class="container-fluid">

            <div class="col-sm-3  float-left bg-light shadow-nohover">
                <center><p class="lead">Find Attendance</p></center>
                <div class="dropdown-divider"></div>
                <form>
                    <div class="form-group">
                        <label for="date1">From Date</label>
                        <input type="date" class="form-control" id="date1" >
                    </div>
                    <div class="form-group">
                        <label for="date2">To Date</label>
                        <input type="date" class="form-control" id="date2" >
                    </div>
                    <center><button type="submit" class="btn btn-primary">Submit</button></center><br/><br/>
                </form>
            </div>



            <div class="col-sm-9 float-right" >


                <div class="card shadow-nohover attendanceCard" >
                    <h5 class="card-header">21/01/2013</h5>
                    <div class="card-body">
                        <table class="col-sm-12 table table-hover  table-striped">
                            <thead>
                                <tr>
                                    <th >#</th>
                                    <th >Employee Id</th>
                                    <th >Employee Name</th>
                                    <th >Check In</th>
                                    <th >Check Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>0123456789</td>
                                    <td>Mohnish Anjaria</td>
                                    <td>8:55</td>
                                    <td>17:05</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div> 

                <br/>

                <div class="card shadow-nohover attendanceCard">
                    <h5 class="card-header">22/01/2013</h5>
                    <div class="card-body">
                        <table class="col-sm-12 table table-hover  table-striped">
                            <thead>
                                <tr>
                                    <th >#</th>
                                    <th >Employee Id</th>
                                    <th >Employee Name</th>
                                    <th >Check In</th>
                                    <th >Check Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>0123456789</td>
                                    <td>Mohnish Anjaria</td>
                                    <td>8:55</td>
                                    <td>17:05</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div> 

                <br/>

                <div class="card shadow-nohover attendanceCard">
                    <h5 class="card-header">23/01/2013</h5>
                    <div class="card-body">
                        <table class="col-sm-12 table table-hover  table-striped">
                            <thead>
                                <tr>
                                    <th >#</th>
                                    <th >Employee Id</th>
                                    <th >Employee Name</th>
                                    <th >Check In</th>
                                    <th >Check Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>0123456789</td>
                                    <td>Mohnish Anjaria</td>
                                    <td>8:55</td>
                                    <td>17:05</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div> 
                <br/>
                
                 <div class="card shadow-nohover attendanceCard">
                    <h5 class="card-header">23/01/2013</h5>
                    <div class="card-body">
                        <table class="col-sm-12 table table-hover  table-striped">
                            <thead>
                                <tr>
                                    <th >#</th>
                                    <th >Employee Id</th>
                                    <th >Employee Name</th>
                                    <th >Check In</th>
                                    <th >Check Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>0123456789</td>
                                    <td>Mohnish Anjaria</td>
                                    <td>8:55</td>
                                    <td>17:05</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div> 
                <br/>
                
                 <div class="card shadow-nohover attendanceCard">
                    <h5 class="card-header">23/01/2013</h5>
                    <div class="card-body">
                        <table class="col-sm-12 table table-hover  table-striped">
                            <thead>
                                <tr>
                                    <th >#</th>
                                    <th >Employee Id</th>
                                    <th >Employee Name</th>
                                    <th >Check In</th>
                                    <th >Check Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>0123456789</td>
                                    <td>Mohnish Anjaria</td>
                                    <td>8:55</td>
                                    <td>17:05</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div> 
                <br/>

            </div>




        </div>





        <script>
            $(document).ready(function () {


            });

            document.getElementById('date1').max = GetOneDayPrior();
            document.getElementById('date2').max = GetOneDayPrior();



            function GetOneDayPrior() {
                var d = new Date();
                d.setDate(d.getDate() - 1);
                var day, month, year;

                year = d.getFullYear();
                if (d.getDate() < 10) {
                    day = '0' + String(d.getDate());
                } else {
                    day = String(d.getDate());
                }
                if (d.getMonth() + 1 < 10) {
                    month = '0' + String(d.getMonth() + 1);
                } else {
                    month = String(d.getMonth() + 1);  //+1; //January is 0!
                }

                return year + '-' + month + '-' + day;
            }

        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
