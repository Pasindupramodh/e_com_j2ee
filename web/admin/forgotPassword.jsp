<%-- 
    Document   : fogotPassword
    Created on : Nov 28, 2023, 9:24:54 PM
    Author     : pasin
--%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Green Tech | Forgot </title>

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


                        <p class="login-box-msg">Add username to receive password reset mail.</p>

                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-12" >
                                <button type="submit" id="sign-in" class="btn btn-success btn-block bg-color">Send Password Reset Mail</button>
                            </div>
                            <!-- /.col -->
                        </div>


                        <!-- /.social-auth-links -->

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

//        let token = localStorage.getItem('accessToken');
        
        
        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let username = document.getElementById('username').value;
                    let token = localStorage.getItem('vtoken');
                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}ForgotPassword',
                        data: {
                            username: username,
                            token: token
                        },
                        success: function (responseText) {
                            var data = JSON.parse(responseText);
                            console.log(data);
                            if (data.status === "Success") {
                                Swal.fire(
                                        data.status,
                                        'Check Your email',
                                        'success'
                                        )
                                localStorage.setItem("vtoken", data.accessToken);
                                localStorage.setItem("expireIn", data.expireIn);
//                                window.location = '/e_com_j2ee/admin/pages/dashboard.jsp';
                            } else {
                                Swal.fire(
                                        data.status,
                                        'Try again !',
                                        'error'
                                        )
                            }
                        },
                        error: function (error) {
                            console.log(error)
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

                },
                messages: {
                    username: {
                        required: "Please enter your username",
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
