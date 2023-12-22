<%-- 
    Document   : ResetPassword
    Created on : Dec 22, 2023, 1:35:11 PM
    Author     : REDTECH
--%>

<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="images/favicon.png" rel="shortcut icon">
        <title>GreenTech</title>

        <!--====== Google Font ======-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">

        <%@include file="css.jsp" %>
    </head>
    <body class="config">
        <%
            if (session.getAttribute("customer") != null) {
        %>
        <script>
            window.location.href = '${BASE_URL}'
        </script>
        <%
            }
        %>

        <!--====== Main App ======-->
        <div id="app">

            <%@include file="customerNavs/header.jsp" %>


            <!--====== App Content ======-->
            <div class="app-content">

                <!--====== Section 1 ======-->
                <div class="u-s-p-y-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="breadcrumb">
                                <div class="breadcrumb__wrap">
                                    <ul class="breadcrumb__list">
                                        <li class="has-separator">

                                            <a href="index.jsp">Home</a></li>
                                        <li class="is-marked">

                                            <a href="">Reset Password</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section 1 ======-->


                <!--====== Section 2 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Intro ======-->
                    <div class="section__intro u-s-m-b-60">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section__text-wrap">
                                        <h1 class="section__heading u-c-secondary">Reset Password?</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Intro ======-->

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="row row--center">
                                <div class="col-lg-6 col-md-8 u-s-m-b-30">
                                    <div class="l-f-o">
                                        <div class="l-f-o__pad-box">
                                            <h1 class="gl-h1"></h1>

                                            <span class="gl-text u-s-m-b-30"></span>

                                            <form class="l-f-o__form" id="login_form">

                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="login_email">NEW PASSWORD *</label>
                                                    <input type="hidden" value="<%= request.getParameter("token")%>" id="token"/>
                                                    <input class="input-text input-text--primary-style" type="password" id="new_password"  name="new_password" placeholder="Enter E-mail"></div>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="login_password">PASSWORD *</label>

                                                    <input class="input-text input-text--primary-style" type="password" id="repassword" name="repassword" placeholder="Enter Password"></div>
                                                <div class="gl-inline">
                                                    <div class="u-s-m-b-30">

                                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">Reset Password</button></div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 2 ======-->
            </div>
            <!--====== End - App Content ======-->


            <!--====== Main Footer ======-->
            <%@include file="customerNavs/footer.jsp" %>


        </div>
        <!--====== End - Main App ======-->


        <%@include file="js.jsp" %>

        <!--====== Noscript ======-->
        <noscript>
        <div class="app-setting">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="app-setting__wrap">
                            <h1 class="app-setting__h1">JavaScript is disabled in your browser.</h1>

                            <span class="app-setting__text">Please enable JavaScript in your browser or upgrade to a JavaScript-capable browser.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </noscript>
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
                        url: '${BASE_URL}ResetCusPassword',
                        data: {
                            new_password: new_password,
                            repassword: repassword,
                            token: token
                        },
                        success: function (data) {
                            if (data === "Success") {
                                Swal.fire({
                                    title: 'Updated',
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'success'
                                }).then((result) => {
                                    window.location = '${BASE_URL}signin.jsp';
                                });
                            } else {
                                Swal.fire({
                                    title: data,
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'error'
                                }).then((result) => {

                                });
                            }
                        },
                        error: function () {
                            Swal.fire({
                                title: 'Cannot Reset try again',
                                showDenyButton: false,
                                showCancelButton: false,
                                confirmButtonText: 'OK',
                                icon: 'error'
                            }).then((result) => {
                            });
                        }
                    })
                }
            });
            $('#login_form').validate({
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
                    login_email: {
                        required: "Please enter your Email",
                    },
                    login_password: {
                        required: "Please provide a password",
                    },
                },
                errorElement: 'span',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.u-s-m-b-30').append(error);
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