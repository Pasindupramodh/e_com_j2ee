<%-- 
    Document   : dashboard
    Created on : Oct 25, 2023, 5:31:37 PM
    Author     : pasin
--%>

<%@page import="dao.SystemUserDAO"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="java.util.Map"%>
<%@page import="dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Green Tech | Dashboard</title>

        <!-- Google Font: Source Sans Pro -->
        <%@include file="style.jsp" %>
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="../dist/img/logo.jpg" alt="AdminLTELogo" height="60" width="60">
            </div>

            <%@include file="../navs/nav.jsp" %>

            <%@include file="../navs/sidebar.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">Dashboard</h1>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->
                <%
                    Map<String,Object> map = new OrderDAO().getTotal();
                %>
                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-info">
                                    <div class="inner">
                                        <h3><%= map.get("count") %></h3>

                                        <p>Orders</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-success">
                                    <div class="inner">
                                        <h3><%= map.get("ammount") %><sup style="font-size: 20px"> LKR</sup></h3>

                                        <p>Total Income</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-warning">
                                    <div class="inner">
                                        <h3><%= new CustomerDAO().getCount() %></h3>

                                        <p>Customers</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-danger">
                                    <div class="inner">
                                        <h3><%= new SystemUserDAO().getCount() %></h3>

                                        <p>System Users</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fas fa-users-cog"></i>
                                    </div>
                                </div>
                            </div>
                            <!-- ./col -->
                        </div>
                        <!-- /.row -->
                        <!-- Main row -->
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
                                                <th>Status</th>
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
                                                <th>Status</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        </div>
                        <!-- /.row (main row) -->
                    </div><!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <%@include file="../navs/footer.jsp" %>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->
        <div class="modal fade" id="customer_details">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Customer Address</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <thead>

                            </thead>
                            <tbody id="table-address">
                                <tr>
                                    <td>Address Line 1</td>
                                    <td id="address_line1"></td>
                                </tr>
                                <tr>
                                    <td>Address Line 2</td>
                                    <td id="address_line2"></td>
                                </tr>
                                <tr>
                                    <td>City</td>
                                    <td id="address_city"></td>
                                </tr>
                                <tr>
                                    <td>Province</td>
                                    <td id="address_province"> </td>
                                </tr>
                                <tr>
                                    <td>ZIP Code</td>
                                    <td id="address_zip"></td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td id="address_mobile"></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <!-- Order products view modal -->

        <div class="modal fade" id="order_product_details">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Customer Address</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <thead>
                            <th>Product Name</th>
                            <th>QTY</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                            <th>Discount</th>
                            <th>Sub Total</th>
                            </thead>
                            <tbody id="table-order-product">


                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <%@include file="js.jsp" %>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button)
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
            fetch("${ADMIN_BASE_URL}Orders?type=finished")
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
                            cell.innerHTML = order.customer.fname + ' ' + order.customer.lname;
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" onclick="viewCustomer(' + order.addresss.id + ')"  href="javascript:;" >View Address</a>';
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" onclick="viewOrderProducts(`' + order.orderId + '`)"  href="javascript:;" >View Order Items</a>'
                            cell = row.insertCell();
                            cell.innerHTML = order.total + ' LKR';
                            cell = row.insertCell();
                            cell.innerHTML = order.discount + ' LKR';
                            cell = row.insertCell();
                            cell.innerHTML = (order.total - order.discount) + ' LKR';
                            cell = row.insertCell();
                            cell.innerHTML = order.orderDate;
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success" href="javascript:;" >Delivered</a>';
                        });
                    })
        }

        function viewOrderProducts(id) {
            let table = document.querySelector('#table-order-product');
            table.innerHTML = "";
            orders.forEach(order => {
                if (order.orderId == id) {
                    order.orderItems.forEach(orderItem => {
                        let row = table.insertRow();
                        let cell = row.insertCell();
                        cell.innerHTML = orderItem.product.productName;
                        cell = row.insertCell();
                        cell.innerHTML = orderItem.qty;
                        cell = row.insertCell();
                        cell.innerHTML = orderItem.unitprice +' LKR';
                        cell = row.insertCell();
                        cell.innerHTML = (orderItem.unitprice*orderItem.qty) +' LKR';
                        cell = row.insertCell();
                        cell.innerHTML = orderItem.totaldiscount+' LKR';
                        cell = row.insertCell();
                        cell.innerHTML = ((orderItem.unitprice*orderItem.qty)-orderItem.totaldiscount) +' LKR';
                    });

                }
            });
            $('#order_product_details').modal('show');
        }
        function viewCustomer(id) {

            orders.forEach(order => {
                if (order.addresss.id == id) {
                    
                    document.getElementById('address_line1').innerHTML = order.addresss.addressLine1;
                    document.getElementById('address_line2').innerHTML = order.addresss.addressLine2;
                    document.getElementById('address_city').innerHTML = order.addresss.city.name;
                    document.getElementById('address_province').innerHTML = order.addresss.city.provinceDTO.name;
                    document.getElementById('address_zip').innerHTML = order.addresss.zipcode;
                    document.getElementById('address_mobile').innerHTML = order.addresss.phone;
                }
            });
            $('#customer_details').modal('show');
        }
        loadOrders();
        </script>
        <!-- Bootstrap 4 -->

    </body>
</html>
