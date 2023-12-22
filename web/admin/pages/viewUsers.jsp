<%-- 
    Document   : viewUsers
    Created on : Oct 27, 2023, 1:35:12 PM
    Author     : pasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Tech</title>
        <%@include file="style.jsp" %>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    </head>
    <body>
        
        <%@include file="../navs/nav.jsp" %>
        <%@include file="../navs/sidebar.jsp" %>
        <%
             if (userData.getUserType().equals("Admin")) {
                 %>
                 <script>
                     
                     window.location.href = '${BASE_URL}admin/pages/dashboard.jsp';
                     
                 </script>
        <%
             }
        %>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>System Users</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">System Users</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">System Users</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Mobile</th>
                                                <th>Email</th>
                                                <th>User Type</th>
                                                <th>Status</th>
                                                <th>Created</th>
                                                <th>Updated</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table-users">

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Mobile</th>
                                                <th>Email</th>
                                                <th>User Type</th>
                                                <th>Status</th>
                                                <th>Created</th>
                                                <th>Updated</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <%@include file="../navs/footer.jsp" %>
        <%@include file="js.jsp" %>
    </body>
    <script>
        $(function () {
//            $("#example1").DataTable({
//                "responsive": false, "lengthChange": false, "autoWidth": false, "ordering": false, "info": true,
////                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
//            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
            $('#example1').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": false,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
        fetch("${ADMIN_BASE_URL}SystemUser/update");
        function loadProducts() {
            fetch("${ADMIN_BASE_URL}/SystemUser")
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-users');
                        console.log(data)
                        table.innerHTML = "";
                        data.forEach(user => {
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.innerHTML = user.id;
                            cell = row.insertCell();
                            cell.innerHTML = user.fname + ' ' + user.lname;
                            cell = row.insertCell();
                            cell.innerHTML = user.mobile;
                            cell = row.insertCell();
                            cell.innerHTML = user.email;
                            cell = row.insertCell();
                            cell.innerHTML = user.userType;
                            cell = row.insertCell();
                            if (user.active) {
                                cell.innerHTML = '<span class="badge bg-success">Active</span>';
                            } else {
                                cell.innerHTML = '<span class="badge bg-danger">Inactive</span>';
                            }
                            cell = row.insertCell();
                            cell.innerHTML = user.createdAt + ' by ' + user.createdByName;
                            cell = row.insertCell();
                            cell.innerHTML = user.updatedAt + ' by ' + user.updatedByName;
                            cell = row.insertCell();
                            if (user.active) {
                                cell.innerHTML = '<a class="badge bg-primary bg-color mr-2" href="editUser.jsp?id='+user.id+'">Edit</a>' +
                                    '<a class="badge bg-danger" onclick="deleteUser(' + user.id + ',`' + user.fname + ' ' + user.lname + '`)"  href="javascript:;" >Deactivate</a>';
                            } else {
                                cell.innerHTML = '<a class="badge bg-primary bg-color mr-2" href="editUser.jsp?id='+user.id+'">Edit</a>' +
                                    '<a class="badge bg-danger" onclick="deleteUser(' + user.id + ',`' + user.fname + ' ' + user.lname + '`)"  href="javascript:;" >Activate</a>';
                            }
                            

                        });
                    })
        }

        function deleteUser(id, name) {
            Swal.fire({
                title: 'Do you want to delete ' + name + '?',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Save',
                denyButtonText: `Don't save`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {

                    $.ajax({
                        type: 'DELETE',
                        url: '${ADMIN_BASE_URL}SystemUser?id='+id,
                        
                        success: function (data) {
                            Swal.fire('Changes are saved', '', 'success');
                            loadProducts();
                        },
                        error: function () {

                        }
                    })


                } else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info')
                }
            })
        }
        loadProducts();
    </script>
    
</html>
