<%-- 
    Document   : productVariants
    Created on : Nov 21, 2023, 5:36:44 AM
    Author     : pasin
--%>


<%@page import="dao.VarientDAO"%>
<%@page import="model.AttributeVariant"%>
<%@page import="dao.BrandDao"%>
<%@page import="model.Brand"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Tech</title>
        <%@include file="style.jsp" %>

    </head>
    <body>
        <%@include file="../navs/nav.jsp" %>
        <%@include file="../navs/sidebar.jsp" %>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="text-color">Add variant for <strong style="color: #4CA771"> <%= request.getParameter("productName")%></strong> </h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item "><a href="#">Home</a></li>
                                <li class="breadcrumb-item text-color ">Add Product</li>
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
                        <h3 class="card-title text-white" >Product</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <form id="addVarientForm">
                            <input type="hidden" id="product_id" value="<%= request.getParameter("id")%>"/>

                            <div class="row justify-content-center">
                                <img src="../images/product1.jpg" class="card-img-top col" id="variant_image" alt="variant image" style="max-height: 250px;max-width: 250px"/>
                            </div>
                            <div class="row justify-content-center">
                                <div class="custom-file mt-3 mb-3 col-sm-6 form-group">
                                    <input type="file" class="custom-file-input" accept="image/png, image/gif, image/jpeg" name="varientImage" id="varientImage">
                                    <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Product variant Name</label>
                                        <input type="text" class="form-control" id="varient_name" name="varient_name" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">QTY</label>
                                        <input type="number" min="0" class="form-control" id="qty" name="qty" placeholder="Enter ..." >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Price</label>
                                        <input type="number" min="1" class="form-control" id="price" name="price" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Discount Price</label>
                                        <input type="number" min="0" class="form-control" id="discount" name="discount" placeholder="Enter ...">
                                    </div>
                                </div>
                            </div>

                            <br>


                            <div class="row justify-content-center ">
                                <button type="submit" id="save-varient" class="btn btn-success bg-color" >Save Product Variant</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

            </section>
            <section>
                <div class="card " >
                    <div class="card-header bg-color" style="">
                        <h3 class="card-title text-white" >Product Variants</h3>
                    </div>
                    <div class="card-deck  m-4">
                        <%
                            List<AttributeVariant> attributeVariants = new VarientDAO().getAll();
                            if (attributeVariants != null) {
                                for (AttributeVariant attributeVariant : attributeVariants) {
                        %>
                        <div class="card">
                            <img src="<%= attributeVariant.getGallery().getImgPath()%>" style="max-height: 300px;max-width: 300px" class="card-img-top" alt="variant image">
                            <div class="card-title mt-2 text-center">
                                <h4 class="font-weight-bold text-color"><%= attributeVariant.getProduct().getProductName()%></h4>
                                <h5 class="font-weight-bold text-color"><%= attributeVariant.getVariantName()%></h5>
                            </div>
                            <div class="card-body">

                                <!--<p class="card-text"><%= attributeVariant.getProduct().getProductName()%></p>-->
                                <hr>
                                <p class="card-text" > <strong>QTY : </strong><%= attributeVariant.getQty()%> </p>
                                <p class="card-text" > <strong>Price : </strong><%= attributeVariant.getPrice()%> </p>
                                <p class="card-text" > <strong>Discount : </strong><%= attributeVariant.getDiscountPrice()%> </p>

                            </div>
                            <div class="card-footer text-center" style="background-color: #91A3B0">
                                <a type="button" class="badge bg-success mr-3" onclick="updateVariant(<%= attributeVariant.getId()%>, '<%=attributeVariant.getGallery().getImgPath()%>', '<%= attributeVariant.getVariantName()%>', '<%= attributeVariant.getQty()%>', '<%= attributeVariant.getPrice()%>', '<%= attributeVariant.getDiscountPrice()%>')" data-toggle="modal" data-target="#modal-lg" style="font-size: 16px">Edit</a>

                            </div>
                        </div>
                        <%
                                }
                            }
                        %>


                    </div>
                </div>
                <!-- /.post -->
            </section>
            <!-- /.content -->
        </div>

        <div class="modal fade" id="modal-lg">
            <div class="modal-dialog modal-lg">
                <form id="updateVariant" enctype="multipart/form-data" method="put" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Update VARIANT</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">


                            <input type="hidden" id="variant_id" />
                            <div class="row justify-content-center">
                                <img src="../images/product1.jpg" class="card-img-top col" id="variant_update_image" alt="variant image" style="max-height: 250px;max-width: 250px"/>
                            </div>
                            <div class="row justify-content-center">
                                <div class="custom-file mt-3 mb-3 col-sm-6 form-group">
                                    <input type="file" class="custom-file-input" accept="image/png, image/gif, image/jpeg" name="varientUpdateImage" id="varientUpdateImage">
                                    <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Product variant Name</label>
                                        <input type="text" class="form-control" id="varient_update_name" name="varient_update_name" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">QTY</label>
                                        <input type="number" min="0" class="form-control" id="update_qty" name="update_qty" placeholder="Enter ..." >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Price</label>
                                        <input type="number" min="1" class="form-control" id="update_price" name="update_price" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Discount Price</label>
                                        <input type="number" min="0" class="form-control" id="update_discount" name="update_discount" placeholder="Enter ...">
                                    </div>
                                </div>
                            </div>





                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success bg-color">Update Brand</button>
                        </div>
                    </div>
                </form>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <%@include file="../navs/footer.jsp" %>
        <%@include file="js.jsp" %>
        <!-- /.content-wrapper -->
    </body>
    <script>

        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let id = document.getElementById('variant_id').value;
                    let varient_name = document.getElementById('varient_update_name').value;
                    let discount = document.getElementById('update_discount').value;
                    let qty = document.getElementById('update_qty').value;
                    let Price = document.getElementById('update_price').value;
                    var formData = new FormData();
                    formData.append('varientImage', $('#varientUpdateImage')[0].files[0]);
                    formData.append('varient_name', varient_name);
                    formData.append('discount', discount);
                    formData.append('qty', qty);
                    formData.append('price', Price);
                    formData.append('id', id);

                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}UpdateProductVarient',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: formData,
                        enctype: 'multipart/form-data',
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
                                    window.location.reload();
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
                                title: 'Cannot save try again',
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
            $('#updateVariant').validate({
                rules: {
                    varient_update_name: {
                        required: true,
                    },
                    update_qty: {
                        required: true,
                    },
                    update_price: {
                        required: true,
                    },
                    update_discount: {
                        required: true
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



        function updateVariant(id, image, name, qty, price, discount) {
            document.getElementById('variant_id').value = id;
            document.getElementById('varient_update_name').value = name;
            document.getElementById('update_discount').value = discount;
            document.getElementById('update_qty').value = qty;
            document.getElementById('update_price').value = price;
            $('#variant_update_image').attr("src", image);
        }


        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let varient_name = document.getElementById('varient_name').value;
                    let discount = document.getElementById('discount').value;
                    let qty = document.getElementById('qty').value;
                    let Price = document.getElementById('price').value;
                    let product_id = document.getElementById("product_id").value;
                    var formData = new FormData();
                    formData.append('varientImage', $('#varientImage')[0].files[0]);
                    formData.append('varient_name', varient_name);
                    formData.append('discount', discount);
                    formData.append('qty', qty);
                    formData.append('price', Price);
                    formData.append('product_id', product_id);

                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}ProductVarient',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: formData,
                        enctype: 'multipart/form-data',
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
                                    window.location.reload();
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
                                title: 'Cannot save try again',
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
            $('#addVarientForm').validate({
                rules: {
                    varient_name: {
                        required: true,
                    },
                    qty: {
                        required: true,
                    },
                    varientImage: {
                        required: true,
                    },
                    price: {
                        required: true,
                    },
                    discount: {
                        required: true
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





        document.getElementById('varientImage').onchange = function (evt) {
            var tgt = evt.target || window.event.srcElement,
                    files = tgt.files;

            // FileReader support
            if (FileReader && files && files.length) {
                var fr = new FileReader();
                fr.onload = function () {
                    $('#variant_image').attr("src", fr.result);
                    //            document.getElementById(update_image).src = fr.result;
                }
                fr.readAsDataURL(files[0]);
            }

            // Not supported
            else {
                // fallback -- perhaps submit the input to an iframe and temporarily store
                // them on the server until the user's session ends.
            }
        }

        document.getElementById('varientUpdateImage').onchange = function (evt) {
            var tgt = evt.target || window.event.srcElement,
                    files = tgt.files;

            // FileReader support
            if (FileReader && files && files.length) {
                var fr = new FileReader();
                fr.onload = function () {
                    $('#variant_update_image').attr("src", fr.result);
                    //            document.getElementById(update_image).src = fr.result;
                }
                fr.readAsDataURL(files[0]);
            }

            // Not supported
            else {
                // fallback -- perhaps submit the input to an iframe and temporarily store
                // them on the server until the user's session ends.
            }
        }

    </script>
</html>

