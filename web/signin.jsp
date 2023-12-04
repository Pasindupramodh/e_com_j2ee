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

                                            <a href="signin.jsp">Signin</a></li>
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
                                        <h1 class="section__heading u-c-secondary">ALREADY REGISTERED?</h1>
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
                                            <h1 class="gl-h1">I'M NEW CUSTOMER</h1>

                                            <span class="gl-text u-s-m-b-30">By creating an account with our store, you will be able to move through the checkout process faster, store shipping addresses, view and track your orders in your account and more.</span>
                                            <div class="u-s-m-b-15">

                                                <a class="l-f-o__create-link btn--e-transparent-brand-b-2" href="signup.jsp">CREATE AN ACCOUNT</a></div>
                                            <h1 class="gl-h1">SIGNIN</h1>

                                            <span class="gl-text u-s-m-b-30">If you have an account with us, please log in.</span>
                                            <form class="l-f-o__form" id="login_form">
<!--                                                <div class="gl-s-api">
                                                    <div class="u-s-m-b-15">

                                                        <button class="gl-s-api__btn gl-s-api__btn--fb" type="button"><i class="fab fa-facebook-f"></i>

                                                            <span>Signin with Facebook</span></button></div>
                                                    <div class="u-s-m-b-15">

                                                        <button class="gl-s-api__btn gl-s-api__btn--gplus" type="button"><i class="fab fa-google"></i>

                                                            <span>Signin with Google</span></button></div>
                                                </div>-->
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="login_email">E-MAIL *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="login_email" name="login_email" placeholder="Enter E-mail"></div>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="login_password">PASSWORD *</label>

                                                    <input class="input-text input-text--primary-style" type="password" id="login_password" name="login_password" placeholder="Enter Password"></div>
                                                <div class="gl-inline">
                                                    <div class="u-s-m-b-30">

                                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">LOGIN</button></div>
                                                    <div class="u-s-m-b-30">

                                                        <a class="gl-link" href="lost-password.jsp">Lost Your Password?</a></div>
                                                </div>
<!--                                                <div class="u-s-m-b-30">

                                                    ====== Check Box ======
                                                    <div class="check-box">

                                                        <input type="checkbox" id="remember-me">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="remember-me">Remember Me</label></div>
                                                    </div>
                                                    ====== End - Check Box ======
                                                </div>-->
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
        <%
            if (request.getParameter("status")!=null && request.getParameter("status").equals("0")) {
        %>
        <script>
            Swal.fire({
                title: "Email has verified...",
                showDenyButton: false,
                showCancelButton: false,
                confirmButtonText: 'OK',
                icon: 'success'
            }).then((result) => {

            });
        </script>
        <%
            }
        %>
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
                    let email = document.getElementById('login_email').value;
                    let password = document.getElementById('login_password').value;
                    $.ajax({
                        type: 'POST',
                        url: '${BASE_URL}Login',
                        data: {
                            email: email,
                            password: password,
                        },
                        success: function (data) {
                            if (data === "Success") {
                                window.location = 'index.jsp';
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
                                title: 'Cannot Login try again',
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

                    login_email: {
                        required: true,
                        email: true
                    },
                    login_password: {
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