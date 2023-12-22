<%-- 
    Document   : viewProducts
    Created on : Nov 16, 2023, 10:54:31 PM
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
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Products</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Products</li>
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
                                    <h3 class="card-title">Products</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Product Name</th>
                                                <th>Brand</th>
                                                <th>In Stock</th>
                                                <th>Price</th>
                                                <th>Discount</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table-products">

                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Product Name</th>
                                                <th>Brand</th>
                                                <th>In Stock</th>
                                                <th>Price</th>
                                                <th>Discount</th>
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
//        fetch("/e_com_j2ee/SystemUser/update");
        function loadProducts() {
            fetch("${ADMIN_BASE_URL}Product")
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-products');
                        console.log(data)
                        table.innerHTML = "";
                        data.forEach(product => {
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.innerHTML = product.id;
                            cell = row.insertCell();
                            cell.innerHTML = product.productName;
                            cell = row.insertCell();
                            cell.innerHTML = product.brand.brandName;
                            cell = row.insertCell();
                            cell.innerHTML = product.qty;
                            cell = row.insertCell();
                            cell.innerHTML = product.productPrice;
                            cell = row.insertCell();
                            cell.innerHTML = product.discountPrice;
                            cell = row.insertCell();
                            if (product.published) {
                                cell.innerHTML = '<span class="badge bg-success">Published</span>';
                            } else {
                                cell.innerHTML = '<span class="badge bg-danger">Unpublished</span>';
                            }
                            cell = row.insertCell();
                            cell.innerHTML = '<a class="badge bg-success bg-color mr-2" style="font-size:14px" href="editProduct.jsp?id='+product.id+'" >Update</a>' +
                                    '<a class="badge bg-warning  mr-2" style="font-size:14px" href="viewProduct.jsp?id='+product.id+'" >View Details</a>'+
                                    '<a class="badge bg-primary" style="font-size:14px" href="productVariants.jsp?id='+product.id+'&productName='+product.productName+'" >Variants</a>';
                            
//                            cell = row.insertCell();
//                            cell.innerHTML = user.createdAt + ' by ' + user.createdByName;
//                            cell = row.insertCell();
//                            cell.innerHTML = user.updatedAt + ' by ' + user.updatedByName;
//                            cell = row.insertCell();
//                            if (user.active) {
//                                cell.innerHTML = '<a class="badge bg-primary bg-color mr-2" href="editUser.jsp?id='+user.id+'">Edit</a>' +
//                                    '<a class="badge bg-danger" onclick="deleteUser(' + user.id + ',`' + user.fname + ' ' + user.lname + '`)"  href="javascript:;" >Deactivate</a>';
//                            } else {
//                                cell.innerHTML = '<a class="badge bg-primary bg-color mr-2" href="editUser.jsp?id='+user.id+'">Edit</a>' +
//                                    '<a class="badge bg-danger" onclick="deleteUser(' + user.id + ',`' + user.fname + ' ' + user.lname + '`)"  href="javascript:;" >Activate</a>';
//                            }
//                            

                        });
                    })
                    .catch(error => {
                        // Handle any errors that occurred in the above promise chain
                        console.log(error);
                    });
            

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
                        url: '${ADMIN_BASE_URL}SystemUser?id=' + id,

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

