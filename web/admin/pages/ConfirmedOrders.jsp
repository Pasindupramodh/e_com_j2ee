<%-- 
    Document   : ConfirmedOrders
    Created on : Dec 20, 2023, 7:29:19 AM
    Author     : REDTECH
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
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Confirmed Orders</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Confirmed Orders</li>
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

        <!-- Customer details view modal -->

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

        <!-- Tracking number modal  -->
        <div class="modal fade" id="updateTrackingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Tracking Number</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Tracking Number</label>
                                <input type="text" class="form-control" id="trackingNumber">
                                <input type="hidden" class="form-control" id="updateOrderId">
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" id="update-tracking">Update</button>
                    </div>
                </div>
            </div>
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
        document.getElementById("update-tracking").addEventListener('click', () => {
            var id = document.getElementById('updateOrderId').value;
            var trackingNumber = document.getElementById('trackingNumber').value;
            if (trackingNumber != null && trackingNumber != '') {
                $.ajax({
                    type: 'PUT',
                    url: '${ADMIN_BASE_URL}Orders?' + 'id=' + id + '&type=tracking&trackingNumber=' + trackingNumber,

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
        });
        function loadOrders() {
            fetch("${ADMIN_BASE_URL}Orders?type=confirm")
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
                            cell.innerHTML = '<a class="badge bg-success" onclick="updateOrder(`' + order.orderId + '`,`tracking`)"  href="javascript:;" >Provide Tracking</a>';
                        });
                    })
        }




        function updateOrder(id, type) {
            console.log(id + ' ' + type);
            document.getElementById('updateOrderId').value = id;
            $('#updateTrackingModal').modal('show');
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
                        cell.innerHTML = orderItem.unitprice + ' LKR';
                        cell = row.insertCell();
                        cell.innerHTML = (orderItem.unitprice * orderItem.qty) + ' LKR';
                        cell = row.insertCell();
                        cell.innerHTML = orderItem.totaldiscount + ' LKR';
                        cell = row.insertCell();
                        cell.innerHTML = ((orderItem.unitprice * orderItem.qty) - orderItem.totaldiscount) + ' LKR';
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

</html>
