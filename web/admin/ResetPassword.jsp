<%-- 
    Document   : ResetPassword
    Created on : Nov 29, 2023, 2:08:06 AM
    Author     : pasin
--%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Green Tech</title>

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


                        <p class="login-box-msg">Change Password</p>
                        <input type="hidden" value="<%= request.getParameter("token") %>" id="token"/>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" id="new_password" name="new_password" placeholder="New Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Repeat Password">
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
                                <button type="submit" id="sign-in" class="btn btn-success btn-block bg-color">Change</button>
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
        
        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let new_password = document.getElementById('new_password').value;
                    let repassword = document.getElementById('repassword').value;
                    let token = document.getElementById('token').value;
                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}ResetPassword',
                        data: {
                            new_password: new_password,
                            repassword: repassword,
                            token: token
                        },
                        success: function (data) {
                            if (data === "Updated") {
                                Swal.fire({
                                        title: data,
                                        showDenyButton: false,
                                        showCancelButton: false,
                                        confirmButtonText: 'OK',
                                        icon: 'success'
                                    }).then((result) => {
                                        window.location = 'index.jsp';
                                    });
//                                window.location = '/e_com_j2ee/admin/pages/dashboard.jsp';
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
                    new_password: {
                        required: true,
                        minlength: 5
                    },
                    repassword: {
                        required: true,
                        minlength: 5
                    },
                },
                messages: {
                   
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
