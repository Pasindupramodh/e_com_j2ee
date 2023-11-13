<%-- 
    Document   : addUser
    Created on : Oct 25, 2023, 11:39:37 PM
    Author     : pasin
--%>

<%@page import="model.UserType"%>
<%@page import="dao.SystemUserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style.jsp" %>
    </head>
    <body>
        <%@include file="checkLogin.jsp" %>
        <%@include file="navs/nav.jsp" %>
        <%@include file="navs/sidebar.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="text-color">Add System User</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item "><a href="#">Home</a></li>
                                <li class="breadcrumb-item text-color ">Add System User</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card " >
                    <div class="card-header bg-color" style="">
                        <h3 class="card-title text-white" >System Users</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <form id="addUserForm">


                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">First Name</label>
                                        <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Last Name</label>
                                        <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter ..." >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Mobile Number</label>
                                        <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter ..." >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">User Type</label>
                                        <select class="form-control" id="user_type">
                                            <%                                            SystemUserDAO dAO = new SystemUserDAO();
                                                for (UserType type : dAO.getUserType()) {
                                            %>
                                            <option value="<%= type.getId()%>"><%= type.getUserType()%></option>
                                            <%
                                                }
                                            %>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card-header bg-color" style="">
                                <h3 class="card-title text-white" >Login Details</h3>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Username</label>
                                        <input type="text"  value="" id="username" name="username" class="form-control" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Password</label>
                                        <input type="password"  value="" id="password" name="password" class="form-control" placeholder="Enter ..." >
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row justify-content-center ">
                                <button type="submit" id="save-user" class="btn btn-success bg-color" >Save User</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

            </section>
            <!-- /.content -->
        </div>
        <%@include file="navs/footer.jsp" %>
        <%@include file="js.jsp" %>
        <!-- /.content-wrapper -->
    </body>
    <script>



        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let fname = document.getElementById('fname').value;
                    let lname = document.getElementById('lname').value;
                    let mobile = document.getElementById('mobile').value;
                    let email = document.getElementById('email').value;
                    let user_type = document.getElementById('user_type').value;
                    let username = document.getElementById('username').value;
                    let password = document.getElementById('password').value;
                    $.ajax({
                        type: 'POST',
                        url: '${BASE_URL}SystemUser',
                        data: {
                            fname: fname,
                            lname: lname,
                            mobile: mobile,
                            email: email,
                            user_type: user_type,
                            username: username,
                            password: password,
                        },
                        success: function (data) {
                            console.log(data);
                            if (data == "Success") {
                                Swal.fire({
                                    title: 'Saved',
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'success'
                                }).then((result) => {
                                    window.location = 'viewUsers.jsp';

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
                                title: 'Cannot add user try again',
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
            $('#addUserForm').validate({
                rules: {
                    fname: {
                        required: true,
                    },
                    lname: {
                        required: true,
                    },
                    mobile: {
                        required: true,
                    },
                    email: {
                        required: true,
                        email: true,
                    },
                    username: {
                        required: true,
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                },
                messages: {

                },
                errorElement: 'span',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
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
