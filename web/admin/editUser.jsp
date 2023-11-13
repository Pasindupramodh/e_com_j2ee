<%-- 
    Document   : addUser
    Created on : Oct 25, 2023, 11:39:37 PM
    Author     : pasin
--%>

<%@page import="model.SystemUser"%>
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
                            <h1 class="text-color">Update System User</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item "><a href="#">Home</a></li>
                                <li class="breadcrumb-item text-color ">Update System User</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">
                <%                    String id = request.getParameter("id");
                    try {
                        int userId = Integer.parseInt(id);
                        SystemUser systemUser = new SystemUserDAO().getUserById(userId);
                        if (systemUser == null) {
                            response.sendRedirect("viewUsers.jsp");
                        } else {
                %>
                <!-- Default box -->
                <div class="card " >
                    <div class="card-header bg-color" style="">
                        <h3 class="card-title text-white" >System Users</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <form id="useEditForm">
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- text input -->
                                <input type="hidden" class="form-control" id="id" value="<%= systemUser.getId()%>" placeholder="Enter ...">
                                <div class="form-group">
                                    <label class="text-color">First Name</label>
                                    <input type="text" class="form-control" id="fname" name="fname" value="<%= systemUser.getFname()%>" placeholder="Enter ...">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="text-color">Last Name</label>
                                    <input type="text" class="form-control" id="lname" name="lname" value="<%= systemUser.getLname()%>" placeholder="Enter ..." >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- text input -->
                                <div class="form-group">
                                    <label class="text-color">Mobile Number</label>
                                    <input type="text" class="form-control" id="mobile" name="mobile" value="<%= systemUser.getMobile()%>" placeholder="Enter ...">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="text-color">Email</label>
                                    <input type="text" class="form-control" id="email" name="email" value="<%= systemUser.getEmail()%>" placeholder="Enter ..." >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <!-- text input -->
                                <div class="form-group">
                                    <label class="text-color">User Type</label>
                                    <select class="form-control" id="user_type">
                                        <%
                                            SystemUserDAO dAO = new SystemUserDAO();
                                            for (UserType type : dAO.getUserType()) {
                                                if (systemUser.getUserType().getId() == type.getId()) {
                                        %>
                                        <option value="<%= type.getId()%>" selected="true"><%= type.getUserType()%> </option>
                                        <%
                                        } else {
                                        %>
                                        <option value="<%= type.getId()%>" selected="false"><%= type.getUserType()%> </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-4">
                            <button type="submit" id="update-user" class="btn btn-success bg-color" >Update User</button>
                        </div>
                                     
                        </form>   
                        <div class="card-header bg-color" style="">
                            <h3 class="card-title text-white" >Login Details</h3>
                        </div>
                                    <form id="loginUpdateForm">
                                        
                                    
                        <div class="row mt-4">
                            <div class="col-sm-6">
                                <!-- text input -->
                                <input type="hidden" id="login-id" value="<%= systemUser.getLogin().getId()%>"/>
                                <div class="form-group">
                                    <label class="text-color">Username</label>
                                    <input type="text"  value="<%= systemUser.getLogin().getUsername()%>" name="username" id="username" class="form-control" placeholder="Enter ...">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="text-color">Password</label>
                                    <input type="password" id="password" class="form-control" name="password" placeholder="Enter ..." >
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row justify-content-center ">
                            <button type="submit" id="update-login" class="btn btn-success bg-color" >Update Login Details</button>
                        </div>
                        </form>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
                <%
                        }
                    } catch (Exception e) {
                        response.sendRedirect("viewUsers.jsp");
                    }
                %>
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
                    let id = document.getElementById('id').value;
            let fname = document.getElementById('fname').value;
            let lname = document.getElementById('lname').value;
            let mobile = document.getElementById('mobile').value;
            let email = document.getElementById('email').value;
            let user_type = document.getElementById('user_type').value;
            $.ajax({
                type: 'PUT',
                url: '${BASE_URL}SystemUser?' + 'id=' + id + '&fname=' + fname + '&lname=' + lname + '&mobile=' + mobile + '&email=' + email + '&user_type=' + user_type + '',
                success: function (data) {
                    if (data == "Success") {
                        Swal.fire({
                            title: 'Updated',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'success'
                        }).then((result) => {
                            window.location = 'viewUsers.jsp';

                        });
                    } else {
                        Swal.fire({
                            title: 'Cannot Update',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'error'
                        }).then((result) => {
                            window.location = 'viewUsers.jsp';

                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: 'Cannot Update',
                        showDenyButton: false,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        icon: 'error'
                    }).then((result) => {
                        window.location = 'viewUsers.jsp';
                    });
                }
            });

                }
            });
            $('#useEditForm').validate({
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
        
        
        

        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let id = document.getElementById('login-id').value;
            let username = document.getElementById('username').value;
            let password = document.getElementById('password').value;

            $.ajax({
                type: 'PUT',
                url: '${BASE_URL}Login?' + 'id=' + id + '&username=' + username + '&password=' + password + '',

                success: function (data) {
                    console.log(data);
                    if (data == "Success") {
                        Swal.fire({
                            title: 'Updated',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'success'
                        }).then((result) => {
                            window.location = 'viewUsers.jsp';

                        });
                    } else {
                        Swal.fire({
                            title: 'Cannot Update',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'error'
                        }).then((result) => {
                            window.location = 'viewUsers.jsp';
                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: 'Cannot Update',
                        showDenyButton: false,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        icon: 'error'
                    }).then((result) => {
                        window.location = 'viewUsers.jsp';
                    });
                }
            });

                }
            });
            $('#loginUpdateForm').validate({
                rules: {
                    
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