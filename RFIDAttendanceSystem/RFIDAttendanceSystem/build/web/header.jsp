
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

       
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <a class="navbar-brand text-white lead" href="#" style="font-weight: 400;">Symphid</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                </ul>
                <div class="without-login">
                    <button type="button" class="btn btn-sm btn-light mr-sm-2 "  data-toggle="modal" data-target="#loginModal">&nbsp;&nbsp;&nbsp;LOGIN&nbsp;&nbsp;&nbsp;</button>
                    <button type="button" class="btn btn-sm btn-light mr-sm-2" data-toggle="modal" data-target="#registrationModal">&nbsp;&nbsp;&nbsp;SIGNUP&nbsp;&nbsp;&nbsp;</button>
                </div>

                <div class="login">
                <!--    <img src="Resources/notificatonIcon.png" alt="notificatonIcon" style="margin-right: 50px"/>-->
                    <button type="button" class="btn btn-sm btn-light mr-sm-2 "  data-toggle="modal" >&nbsp;&nbsp;&nbsp;SIGNOUT&nbsp;&nbsp;&nbsp;</button>                 
                </div>



            </div>
        </nav>









        <!--  MODALS Below-->

        <!--Login Modal -->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"> Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                </div>
                            </div>


                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <center>  <button type="submit" class="btn btn-primary">Sign in</button></center>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--Login Model End -->


        <!--Regist Modal -->
        <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">SIGNUP</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>

                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">First Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="firstName" placeholder="First Name">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Last Name</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="lastName" placeholder="Last Name">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Gender</label>
                                <div class="col-sm-8">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"  value="male">
                                        <label class="form-check-label" for="male">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions"  value="female">
                                        <label class="form-check-label" for="female">Female</label>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Phone Number</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="phoneNumber" placeholder="Phone Number">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Date of Birth</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" id="dateOfBirth" placeholder="Date of Birth">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Email</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="email" placeholder="Email">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Password</label>
                                <div class="col-sm-8" >
                                    <input type="password" class="form-control" id="password" placeholder="Password">

                                </div>

                            </div>


                            <div class="form-group row">
                                <label  class="col-sm-4 col-form-label">Address</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" rows="4" id="comment"></textarea>
                                </div>
                            </div>

                            <div class="form-group row">                   
                                <div class="col-sm-12 offset-sm-4">
                                    <button type="submit" class="btn btn-primary">&nbsp;&nbsp; SignUp &nbsp;&nbsp;</button>
                                </div>

                            </div>



                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--Regist Model End -->



        <!-- hr signup -->
        <div class="modal fade" id="hrSignup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">HR SignUp</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!-- hr signup end-->




        <!-- emp signup -->
        <div class="modal fade" id="empSignup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Employee SignUp</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <!-- emp signup end-->





    </body>
</html>
