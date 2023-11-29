<%-- 
    Document   : signup
    Created on : Nov 24, 2023, 1:42:01 AM
    Author     : pasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="preloader is-active">
            <div class="preloader__wrap">

                <img class="preloader__img" src="images/preloader.png" alt=""></div>
        </div>

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

                                            <a href="signup.jsp">Signup</a></li>
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
                                        <h1 class="section__heading u-c-secondary">CREATE AN ACCOUNT</h1>
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
                                            <h1 class="gl-h1">PERSONAL INFORMATION</h1>
                                            <form class="l-f-o__form" id="register">
                                                <!--<div class="gl-s-api">
                                                    <div class="u-s-m-b-15">
                                                <button class="gl-s-api__btn gl-s-api__btn--fb" type="button"><i class="fab fa-facebook-f"></i>
                                                <span>Signup with Facebook</span></button></div>
                                                    <div class="u-s-m-b-30">
                                                <button class="gl-s-api__btn gl-s-api__btn--gplus" type="button"><i class="fab fa-google"></i>
                                                <span>Signup with Google</span></button></div>
                                                </div>-->
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="reg_fname">FIRST NAME *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="reg_fname" name="reg_fname" placeholder="First Name"></div>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="reg_lname">LAST NAME *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="reg_lname" name="reg_lname" placeholder="Last Name"></div>
                                                <div class="gl-inline">

                                                    <div class="u-s-m-b-30">

                                                        <label class="gl-label" for="gender">GENDER</label>
                                                        <select class="select-box select-box--primary-style u-w-100" id="gender" name="gender">
                                                            <option value="" selected>Select</option>
                                                            <option value="male">Male</option>
                                                            <option value="male">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="reg_email"  >E-MAIL *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="reg_email" name="reg_email" placeholder="Enter E-mail">
                                                </div>
                                                <div class="u-s-m-b-30">

                                                    <label class="gl-label" for="reg_password">PASSWORD *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="reg_password" name="reg_password" placeholder="Enter Password">
                                                </div>
                                                <div class="u-s-m-b-15">

                                                    <button class="btn btn--e-transparent-brand-b-2" type="submit">CREATE</button></div>

                                                <!--<a class="gl-link" href="#">Return to Store</a>-->
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
                    let fname = document.getElementById('reg_fname').value;
                    let lname = document.getElementById('reg_lname').value;
                    let email = document.getElementById('reg_email').value;
                    let password = document.getElementById('reg_password').value;
                    let gender = document.getElementById('gender').value;
                    $.ajax({
                        type: 'POST',
                        url: '${BASE_URL}Register',
                        data: {
                            fname: fname,
                            lname: lname,
                            email: email,
                            gender: gender,
                            password: password,
                        },
                        success: function (data) {
                            if (data === "Sucess") {
                                window.location = 'verify.jsp';
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
                                title: 'Cannot Register try again',
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
            $('#register').validate({
                rules: {
                    reg_fname: {
                        required: true,
                    },
                    reg_lname: {
                        required: true,
                    },
                    reg_email: {
                        required: true,
                        email: true
                    },
                    reg_password: {
                        required: true,
                        minlength: 5
                    },
                },
                messages: {
                    reg_email: {
                        required: "Please enter your Email",
                    },
                    reg_password: {
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
