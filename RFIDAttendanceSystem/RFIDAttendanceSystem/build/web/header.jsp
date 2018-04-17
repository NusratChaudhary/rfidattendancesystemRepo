
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <div class="notification-item">
                <a href="#">
                    <span class="notification-badge">5</span>
                    <img src="Resources/notificatonIcon.png" alt="notificatonIcon" />
                </a>
            </div>

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
                <form method="post" enctype="multipart/form-data" id="registrationForm">

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="firstName">First Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="lastName">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Gender</label>
                        <div class="col-sm-8">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="phoneNumber">Phone Number</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone Number">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="dateOfBirth">Date of Birth</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"  placeholder="Date of Birth">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="email">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="password">Password</label>
                        <div class="col-sm-8" >
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">

                        </div>

                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="comment">Address</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="4" id="comment" name="address"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Upload Picture</label>
                        <div class="col-sm-8">
                            <input type="file" class="form-control" id="inputGroupFile01" name="file" accept="image/jpg,image/jpeg,image/png" required>
                        </div>
                    </div>



                    <div class="form-group row">                   
                        <div class="col-sm-12 offset-sm-4">
                            <button type="submit" id="signUpButton" class="btn btn-primary">&nbsp;&nbsp; SignUp &nbsp;&nbsp;</button>
                        </div>

                    </div>



                </form>
            </div>

        </div>
    </div>
</div>

<!--Regist Model End -->


<script>

    $(document).ready(function () {

        $('#signUpButton').click(function (event) {
            //  $('#signUpButton').prop('disabled', true);
            // show loader
            event.preventDefault();

            var form = $('#registrationForm')[0];


            var data = new FormData(form);

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "Registration",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {

                    console.log(data + 'success');
                    $("#btnSubmit").prop("disabled", false);

                },
                error: function (e) {


                    console.log("ERROR : ", e);
                    $("#btnSubmit").prop("disabled", false);

                }
            });

        });






    });


</script>





