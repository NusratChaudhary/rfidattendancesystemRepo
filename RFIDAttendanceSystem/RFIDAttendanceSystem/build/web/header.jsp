
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
                <form method="post"  id="registrationForm">

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="firstName">First Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="firstName" minlength="3" name="firstName"  placeholder="First Name" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="lastName">Last Name</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="lastName" minlength="3" name="lastName" placeholder="Last Name" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Gender</label>
                        <div class="col-sm-8">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked="true">
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
                            <input type="text" class="form-control" id="phoneNumber" minlength="10" name="phoneNumber" placeholder="Phone Number" required>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="dateOfBirth">Date of Birth</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"  placeholder="Date of Birth" required >
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="email">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" minlength="6" name="email" placeholder="Email" required>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="password">Password</label>
                        <div class="col-sm-8" >
                            <input type="password" class="form-control" id="password" minlength="6" name="password" placeholder="Password" required>

                        </div>

                    </div>


                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label" for="comment">Address</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="4" id="comment" name="address" minlength="10" required></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Upload Picture</label>
                        <div class="col-sm-8">
                            <input type="file"  class="form-control" id="profilePicture" name="file" accept="image/jpg,image/jpeg,image/png" required>
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



        var dataURL;

        $('#profilePicture').change(function () {
            var reader = new FileReader();
            reader.onload = function () {
                dataURL = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        });

        $('#registrationForm').submit(function (event) {

            event.preventDefault();
            $('#signUpButton').prop('disabled', true);
            showLoader('.modal');

            if (!$.isNumeric($('#phoneNumber').val())) {
                $('#phoneNumber').val('');
                $('#phoneNumber').addClass('animated  pulse');
                $('#phoneNumber').attr('placeholder', 'Enter Valid Phone Number');
                return;
            }
            var form = $(this).serializeArray();
            form.push({name: 'img', value: dataURL});
            $.ajax({
                type: "POST",
                url: "Registration",
                timeout: 6000,
                data: form,
                success: function (data) {
                    console.log(data + 'success');
                    $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-success' id='modalAlert' role='alert'><center>Registration Successful...</center></div>");
                    $("#signUpButton").prop("disabled", false);
                    alertTimeout();
                    document.getElementById("#registrationForm").reset();
                },
                error: function (e) {
                    console.log("ERROR : ", e);
                    hideLoader('.modal');
                    $("#registrationModal .modal-dialog .modal-content .modal-header").before("<div class='alert alert-danger' id='modalAlert' role='alert'><center>Unable To Register...</center></div>");
                    $("#signUpButton").prop("disabled", false);
                    alertTimeout();
                    document.getElementById("registrationForm").reset();

                }
            });

        });

        function alertTimeout() {
            $("#modalAlert").fadeTo(2000, 500).slideUp(500, function () {
                $("#modalAlert").slideUp(500);
            });
        }
    });


    var d = new Date();
    d.setFullYear(d.getFullYear() - 18);
    if (parseInt(d.getMonth() + 1) < 10) {
        var backDate = d.getFullYear() + '-0' + parseInt(d.getMonth() + 1) + '-' + d.getDate();
    } else {
        var backDate = d.getFullYear() + '-' + parseInt(d.getMonth() + 1) + '-' + d.getDate();
    }
    document.getElementById("dateOfBirth").max = backDate.trim();


</script>





