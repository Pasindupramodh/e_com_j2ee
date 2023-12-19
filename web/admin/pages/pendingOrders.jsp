<%-- 
    Document   : pendingOrders
    Created on : Dec 19, 2023, 9:18:28 AM
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
                            <h1>Pending Orders</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Pending Orders</li>
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
                                                <th>Customer</th>
                                                <th>Address</th>
                                                <th>Products</th>
                                                <th>Total</th>
                                                <th>Discount</th>
                                                <th>Subtotal</th>
                                                <th>Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table-users">

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Customer</th>
                                                <th>Address</th>
                                                <th>Products</th>
                                                <th>Total</th>
                                                <th>Discount</th>
                                                <th>Subtotal</th>
                                                <th>Date</th>
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
        var orders;
        function loadOrders() {
            fetch("${ADMIN_BASE_URL}Orders?type=pending")
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-users');
                        orders = data.data;
                        table.innerHTML = "";
                        data.data.forEach(order => {
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.innerHTML = order.orderId;
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" onclick="viewCustomer(' + order.customer.id + ')"  href="javascript:;" >' + order.customer.fname + ' ' + order.customer.lname + '</a>'
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" onclick="viewCustomer(' + order.customer.id + ')"  href="javascript:;" >View Address</a>';
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" onclick="viewCustomer(' + order.orderId + ')"  href="javascript:;" >View Order Items</a>'
                            cell = row.insertCell();
                            cell.innerHTML = order.total + ' LKR';
                            cell = row.insertCell();
                            cell.innerHTML = order.discount + ' LKR';
                            cell = row.insertCell();
                            cell.innerHTML = (order.total - order.discount) + ' LKR';
                            cell = row.insertCell();
                            cell.innerHTML = order.orderDate;
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" onclick="viewCustomer(' + order.orderId + ')"  href="javascript:;" >Confirm</a>' +
                                    '<a class="badge bg-danger ml-2" onclick="viewCustomer(' + order.orderId + ')"  href="javascript:;" >Reject</a>';
                        });
                    })
        }


        loadOrders();
        
        function viewCustomer(id){
            console.log(orders);
        }
    </script>

</html>
