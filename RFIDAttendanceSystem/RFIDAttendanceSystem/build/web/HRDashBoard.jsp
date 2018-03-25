<%-- 
    Document   : HRDashBoard
    Created on : 22 Mar, 2018, 3:51:11 PM
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
    </head>
    <body class="bg-light">
        <jsp:include page="header.jsp"/>
        <br/><br/>
        <div class="container ">


            <div class="row live-counter ">

                <div class="col-sm-6 " >
                    <center> <span class="lead">Attendance Entries </span><span class="live-counter-numbers animated fadeIn">50</span></center>
                </div>
                <!--<div class="col-sm-1 live-counter-divider">
                    
                </div>-->
                <div class="col-sm-6">
                    <center>  <span class="lead">Pending Requests </span><span class="live-counter-numbers animated fadeIn">62</span></center>
                </div>

            </div>




            <div class="row dashboard-card-row">
                <div class="col-sm-6 ">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 ">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div> 


            <div class="row dashboard-card">
                <div class="col-sm-6 ">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 ">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div> 


        </div>





        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
