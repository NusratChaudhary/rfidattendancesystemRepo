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

                <div id="accordion">

                    <div class="employeeCard">

                        <div class="card" id="id-empId">
                            <div class="card-header "   id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-light collapsed" data-toggle="collapse" data-target="#empName" aria-expanded="true" aria-controls="empName">
                                        Employee 1
                                    </button>
                                    <div class="float-right">
                                        <button  class="btn collapsed" id="editForm" name="empId"  data-toggle="collapse" data-target="#empName" aria-expanded="true" aria-controls="empName" >
                                            <img src="Resources/edit.png"  alt="editButton"/>
                                        </button>

                                        <button  class="btn collapsed" >
                                            <img src="Resources/rubbish-bin.png" alt="deletebutton"/>
                                        </button>

                                        <button  class="btn collapsed"  data-toggle="collapse" data-target="#empName" aria-expanded="true" aria-controls="empName" >
                                            <img src="Resources/expand-button.png" id="empId-img"  alt="expandButton"/>
                                        </button>
                                    </div> 
                                </h5>
                            </div>

                            <div id="empName" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-sm-12 offset-sm-10" >
                                            <img class="employeeImage img-thumbnail img-fluid" src="nil" alt="employeeImage" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class=" col-sm-12" style="padding: 50px;">
                                            <form class="employeeDetails-NonEditable" id="empId-form">
                                                <div class="form-group row">
                                                    <label for="name" class="col-sm-2 col-form-label">Name</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="name" value="Mohnish Anjaria">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="email" class="col-sm-2 col-form-label">E-mail Id</label>
                                                    <div class="col-sm-10">
                                                        <input type="email" class="form-control" id="email" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="mobileNumber" class="col-sm-2 col-form-label">Mobile No</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="mobileNumber" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label  class="col-sm-2 col-form-label" style="padding-right: 0px;">Gender</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control ">
                                                            <option>Male</option>
                                                            <option>Female</option>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="Address" class="col-sm-2 col-form-label">Address</label>
                                                    <div class="col-sm-10">
                                                        <textarea class="form-control" id="Address" rows="3"></textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="DOB" class="col-sm-2 col-form-label">DOB</label>
                                                    <div class="col-sm-10">
                                                        <input type="date" class="form-control" id="DOB" value="2018-03-31" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="rfid" class="col-sm-2 col-form-label">RFID TAG</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="rfid" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="sal" class="col-sm-2 col-form-label">Salary</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="sal" >
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label  class="col-sm-2 col-form-label">Department</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control">
                                                            <option>deptID DeptName</option>
                                                            <option>deptID DeptName</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="form-group row">
                                                    <div class="col-sm-12">
                                                        <center>  <button type="button"  id="button-empId"  class="btn btn-primary submitForm">Save Changes</button></center>
                                                    </div>
                                                </div>
                                            </form> 
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="card" id="emp2">
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

        </div>






        <script>
            const src1 = "Resources/expand-button.png";
            const src2 = "Resources/expand-arrow.png";


            $(document).ready(function () {

                $('#editForm').click(function () {
                    $('#' + $(this).attr('name') + '-form').removeClass('employeeDetails-NonEditable');
                });

                $('.card').on('hidden.bs.collapse', function () {
                    var id = String(this.id).substr(3);
                    $('#' + id + '-img').attr('src', src1);
                    if (!$('#' + id + '-form').hasClass('employeeDetails-NonEditable')) {
                        $('#' + id + '-form').addClass('employeeDetails-NonEditable');
                    }
                });

                $('.card').on('shown.bs.collapse', function () {
                    var id = String(this.id).substr(3);
                    $('#' + id + '-img').attr('src', src2);
                });


                $('.submitForm').click(function () {
                    var id = String(this.id).substring(7);

                });


            });


        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
