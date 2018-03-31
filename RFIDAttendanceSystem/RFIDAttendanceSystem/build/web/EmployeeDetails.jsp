<%-- 
    Document   : EmployeeDetails
    Created on : 31 Mar, 2018, 2:01:57 PM
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


            <div class="col-sm-2 offset-sm-10">
                <input class="form-control form-control-sm" type="text" placeholder="Search Employee" id="searchBar">
            </div>
            <br/>
            <div class="col-sm-3 statistics float-left bg-light shadow-nohover">
                <center><p class="lead">Statistics</p></center>
                <div class="dropdown-divider"></div>
                <table class="table  table-responsive">
                    <tbody>
                        <tr>

                            <td>Employees </td>
                            <td>:</td>
                            <td>5000</td>

                        </tr>
                        <tr>

                            <td>Disabled Employees</td>
                            <td>:</td>
                            <td>50</td>

                        </tr>
                        <tr>

                            <td>Larry</td>
                            <td>:</td>
                            <td>the Bird</td>

                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="col-sm-9 float-right">



                <div class="employeeCard">

                    <div class="card" id="id-empName">
                        <div class="card-header "  id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-light collapsed" data-toggle="collapse" data-target="#empName" aria-expanded="true" aria-controls="empName">
                                    Employee 1
                                </button>
                                <div class="float-right">
                                    <button  class="btn collapsed" >
                                        <img src="Resources/edit.png" alt="editButton"/>
                                    </button>

                                    <button  class="btn collapsed" >
                                        <img src="Resources/rubbish-bin.png" alt="deletebutton"/>
                                    </button>

                                    <button  class="btn collapsed"  data-toggle="collapse" data-target="#empName" aria-expanded="true" aria-controls="empName" >
                                        <img src="Resources/expand-button.png" onclick="" alt="expandButton"/>
                                    </button>
                                </div> 
                            </h5>
                        </div>

                        <div id="empName" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>



                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Employee 2
                                </button>


                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingThree">
                            <h5 class="mb-0">
                                <button class="btn btn-light collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Employee 3
                                </button>
                            </h5>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="card-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
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
