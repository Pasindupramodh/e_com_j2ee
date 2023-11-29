<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Green Tech | Log in</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <%@include file="style.jsp" %>
    </head>
    <body class="hold-transition login-page">
        <%

            if (session.getAttribute("user") != null) {
                response.sendRedirect("pages/dashboard.jsp");
            }

        %>
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-success">
                <div class="card-header text-center bg-color">
                    <a href="../../index2.html" class="h1 text-white"><b>Green</b>Tech</a>
                </div>
                <div class="card-body">
                    <form id="loginForm">


                        <p class="login-box-msg">Sign in to start your session</p>

                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                            </div>
                            <!-- /.col -->
                            <div class="col-4" >
                                <button type="submit" id="sign-in" class="btn btn-success btn-block bg-color">Sign In</button>
                            </div>
                            <!-- /.col -->
                        </div>


                        <!-- /.social-auth-links -->

                        <p class="mb-1" >
                            <a href="forgotPassword.jsp" style="color: #4CA771 !important">I forgot my password</a>
                        </p>
                    </form>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.login-box -->

        <%@include file="js.jsp" %>
    </body>
    <script>
//        document.querySelector('#sign-in').addEventListener('click', (evt) => {
//
//            let username = document.getElementById('username').value;
//            let password = document.getElementById('password').value;
//
//            $.ajax({
//                type: 'POST',
//                url: '/e_com_j2ee/Login',
//                data: {
//                    username: username,
//                    password: password,
//                },
//                success: function (data) {
//                    if (data === "Sucess") {
//                        window.location = '/e_com_j2ee/admin/dashboard.jsp';
//                    } else {
//                        Swal.fire(
//                                data,
//                                'Try again !',
//                                'error'
//                                )
//                    }
//                },
//                error: function () {
//                    Swal.fire(
//                            'Something went wrong',
//                            'Try again later!',
//                            'error'
//                            )
//                }
//        })
//
//        })

        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let username = document.getElementById('username').value;
                    let password = document.getElementById('password').value;
                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}Login',
                        data: {
                            username: username,
                            password: password,
                        },
                        success: function (data) {
                            if (data === "Sucess") {
                                window.location = '/e_com_j2ee/admin/pages/dashboard.jsp';
                            } else {
                                Swal.fire(
                                        data,
                                        'Try again !',
                                        'error'
                                        )
                            }
                        },
                        error: function () {
                            Swal.fire(
                                    'Something went wrong',
                                    'Try again later!',
                                    'error'
                                    )
                        }
                    })
                }
            });
            $('#loginForm').validate({
                rules: {
                    username: {
                        required: true,
                    },
                    password: {
                        required: true,
                    },
                },
                messages: {
                    email: {
                        required: "Please enter your username",
                    },
                    password: {
                        required: "Please provide your password",
                    },
                },
                errorElement: 'span',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.input-group').append(error);
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });
    </script>
</html>
