<%-- 
    Document   : ViewCustomers
    Created on : Dec 20, 2023, 12:54:33 PM
    Author     : REDTECH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style.jsp" %>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    </head>
    <body>

        <%@include file="../navs/nav.jsp" %>
        <%@include file="../navs/sidebar.jsp" %>
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Unpaid Orders</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Unpaid Orders</li>
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
                                    <h3 class="card-title">Orders</h3>
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
                                                <th>Gender</th>
                                                <th>Status</th>
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
                                                <th>Gender</th>
                                                <th>Status</th>
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
        function loadCustomers() {
            fetch("${ADMIN_BASE_URL}Customer")
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-users');
                        orders = data.data;
                        table.innerHTML = "";
                        data.data.forEach(customer => {
                            console.log(customer);
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.innerHTML = customer.id;
                            cell = row.insertCell();
                            cell.innerHTML = customer.fname + ' ' + customer.lname;
                            cell = row.insertCell();
                            if(customer.mobile === null || customer.mobile === undefined){
                                cell.innerHTML ='Not Set';
                            }else{
                                cell.innerHTML = customer.mobile;
                            }
                            
                            cell = row.insertCell();
                            cell.innerHTML = customer.email;
                            cell = row.insertCell();
                            cell.innerHTML = customer.gender;
                            cell = row.insertCell();
                            cell.innerHTML = customer.status;
                            cell = row.insertCell();
                            if(customer.status == "Active"){
                                cell.innerHTML = '<a class="badge bg-danger" onclick="updateCustomer(`'+customer.id+'`)" href="javascript:;" >Block</a>';
                            }else if(customer.status == 'Blocked'){
                                cell.innerHTML = '<a class="badge bg-success" onclick="updateCustomer(`'+customer.id+'`)" href="javascript:;" >Avtivate</a>';
                            }else{
                                
                            }
                            
                        });
                    });
        }
        function updateCustomer(id){
            $.ajax({
                type: 'PUT',
                url: '${ADMIN_BASE_URL}Customer?id=' + id ,

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
                            window.location.reload();
                        });
                    } else {
                        Swal.fire({
                            title: 'Cannot Update',
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
                        title: 'Cannot Update',
                        showDenyButton: false,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        icon: 'error'
                    }).then((result) => {
                        
                    });
                }
            });
        }
        loadCustomers();
    </script>

</html>
