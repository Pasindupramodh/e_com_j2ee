<%-- 
    Document   : subCategory
    Created on : Nov 5, 2023, 11:53:04 PM
    Author     : pasin
--%>

<%@page import="model.Brand"%>
<%@page import="dao.BrandDao"%>
<%@page import="dto.CategoryDTO"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%-- 
    Document   : category
    Created on : Oct 30, 2023, 11:47:51 PM
    Author     : pasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <h1 class="text-color">Category</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item "><a href="#">Home</a></li>
                                <li class="breadcrumb-item text-color ">Category</li>
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
                        <h3 class="card-title text-white" >Add Category</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#brand" data-toggle="tab">Sub Category</a></li>
                                    <!--<li class="nav-item"><a class="nav-link" href="#sub" data-toggle="tab">Sub Category</a></li>-->
                                </ul>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="active tab-pane" id="brand">



                                        <form class="form-horizontal" id="brandSave" enctype="multipart/form-data">
                                            <div class="form-group row">
                                                <label for="brand-name" class="col-sm-2 col-form-label">Brand Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="brand_name" name="brand_name" placeholder="Enter...">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="brand-desc" class="col-sm-2 col-form-label">Brand Description</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="brand_desc" name="brand_desc" placeholder="Enter...">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="brand-img" class="col-sm-2 col-form-label">Brand Image</label>
                                                <div class="col-sm-10">
                                                    <input type="file"  accept="image/png, image/gif, image/jpeg" class="form-control" id="brand_img" name="brand_img" placeholder="">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="category" class="col-sm-2 col-form-label">Brand Image</label>
                                                <div class="col-sm-10">
                                                    <select class=" form-control" id="category" name="category" style="width: 100%">
                                                        <option value="">Select Category</option>
                                                        <%                                                            List<Category> categorys = new CategoryDAO().getAllActiveCategoriess();
                                                            if (categorys != null) {
                                                                for (Category categoryDTO : categorys) {
                                                        %>
                                                        <option value="<%= categoryDTO.getId()%>"><%= categoryDTO.getCategoryName()%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="offset-sm-2 col-sm-10">
                                                    <button type="submit" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="card " >
                                            <div class="card-header bg-color" style="">
                                                <h3 class="card-title text-white" >Categories</h3>
                                            </div>
                                            <div class="row row-cols-1 row-cols-md-3  m-4">
                                                <%
                                                    List<Brand> brands = new BrandDao().getAllBrands();
                                                    if (brands != null) {
                                                        for (Brand brand : brands) {
                                                %>
                                                <div class="col mb-4">
                                                    <div class="card">
                                                        <img src="<%= brand.getBrandImage()%>" class="card-img-top" alt="...">
                                                        <div class="card-title mt-2 text-center">
                                                            <h5 class="font-weight-bold text-color"><%= brand.getBrandName()%></h5>
                                                        </div>
                                                        <div class="card-body">

                                                            <p class="card-text"><%= brand.getBrandDesc()%></p>
                                                            <hr>
                                                            <p class="card-text" > <strong>Category : </strong><%= brand.getCategory().getCategoryName()%> </p>
                                                            <%
                                                                if (brand.getIsActive()) {
                                                            %>
                                                            <span class="badge bg-success">Active</span>
                                                            <%
                                                            } else {
                                                            %>
                                                            <span class="badge bg-danger">Inactive</span>
                                                            <%
                                                                }
                                                            %>

                                                        </div>
                                                        <div class="card-footer text-center" style="background-color: #91A3B0">
                                                            <a type="button" class="badge bg-success mr-3" onclick="updateBrand('<%= brand.getId()%>', '<%= brand.getBrandName()%>', '<%= brand.getBrandDesc()%>', '<%= brand.getBrandImage()%>', '<%= brand.getCategory().getId()%>')" data-toggle="modal" data-target="#modal-lg" style="font-size: 16px">Edit</a>
                                                            <%
                                                                if (brand.getIsActive()) {
                                                            %>
                                                            <a class="badge bg-danger" onclick="statusBrand('<%= brand.getId()%>')"  href="javascript:;" style="font-size: 16px">Deactivate</a>
                                                            <%
                                                            } else {
                                                            %>
                                                            <a class="badge bg-danger" onclick="statusBrand('<%= brand.getId()%>')"  href="javascript:;"style="font-size: 16px" >Activate</a>
                                                            <%
                                                                }
                                                            %>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                        }
                                                    }
                                                %>


                                            </div>
                                        </div>
                                        <!-- /.post -->
                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="sub">
                                        <form class="form-horizontal" id="subCategory">

                                            <div class="form-group row">
                                                <label for="sub-name" class="col-sm-2 col-form-label">Sub Category Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="sub_name" name="sub_name" placeholder="Enter...">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="sub-desc" class="col-sm-2 col-form-label">Sub Category Desc</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="sub_desc" name="sub_desc" placeholder="Enter...">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="category" class="col-sm-2 col-form-label">Brand Image</label>
                                                <div class="col-sm-10">
                                                    <select class=" form-control" id="subcategory" name="subcategory" style="width: 100%">
                                                        <option value="">Select Category</option>
                                                        <%
                                                            if (categorys != null) {
                                                                for (Category categoryDTO : categorys) {
                                                        %>
                                                        <option value="<%= categoryDTO.getId()%>"><%= categoryDTO.getCategoryName()%></option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="offset-sm-2 col-sm-10">
                                                    <button type="submit" class="btn btn-success">Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                        <div class="card " >
                                            <div class="card-header bg-color" style="">
                                                <h3 class="card-title text-white" >Categories</h3>
                                            </div>
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Sub Category Name</th>
                                                        <th>Sub Category Description</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="table-sub-categories">

                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Sub Category Name</th>
                                                        <th>Sub Category Description</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->



            </section>
            <!-- /.content -->
        </div>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->

        <%@include file="../navs/footer.jsp" %>
        <%@include file="js.jsp" %>
        <div class="modal fade" id="modal-lg">
            <div class="modal-dialog modal-lg">
                <form id="updateBrand" enctype="multipart/form-data" method="put" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Update Brand</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">



                            <div class="row">
                                <div class="col-12 text-center mb-3">
                                    <img src="" class="card-img-top" id="update_image" alt="brand image" style="max-height: 200px;max-width: 300px">

                                </div>
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <input type="hidden" class="form-control" id="update_brnad_id" name="update_brnad_id" placeholder="Enter ...">
                                    <div class="form-group">
                                        <label class="text-color">Brand Name</label>
                                        <input type="text" class="form-control" id="update_brand_name" name="update_brand_name" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Brand Description</label>
                                        <input type="text" class="form-control" id="update_brand_desc" name="update_brand_desc" placeholder="Enter ...">

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Brand Image</label>
                                        <input type="file"  accept="image/png, image/gif, image/jpeg" class="form-control" id="update_brand_image" name="update_brand_image" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label  class="text-color">Brand Category</label>
                                    <select class=" form-control" id="update_brand_category" name="update_brand_category" style="width: 100%">
                                        <option value="">Select Category</option>
                                        <%
                                            if (categorys != null) {
                                                for (Category categoryDTO : categorys) {
                                        %>
                                        <option value="<%= categoryDTO.getId()%>"><%= categoryDTO.getCategoryName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
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
        <!-- /.content-wrapper -->
    </body>

    <script>
        document.getElementById('update_brand_image').onchange = function (evt) {
            var tgt = evt.target || window.event.srcElement,
                    files = tgt.files;

            // FileReader support
            if (FileReader && files && files.length) {
                var fr = new FileReader();
                fr.onload = function () {
                    $('#update_image').attr("src", fr.result);
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
        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let brand_name = document.getElementById('update_brand_name').value;
                    let brand_id = document.getElementById('update_brnad_id').value;
                    let brand_desc = document.getElementById('update_brand_desc').value;
                    let category = document.getElementById('update_brand_category').value;
//                    let brand_img = $('#brand_img')[0].files[0];

                    var formData = new FormData();
                    formData.append('brand_img', $('#update_brand_image')[0].files[0]);
                    formData.append('brand_name', brand_name);
                    formData.append('brand_id', brand_id);
                    formData.append('brand_desc', brand_desc);
                    formData.append('category', category);
                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}UpdateBrand',
                        processData: false,
                        contentType: false,
                        cache: false,
                        data: formData,
                        enctype: 'multipart/form-data',
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
                                title: 'Cannot update try again',
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
            $('#updateBrand').validate({
                rules: {
                    update_brand_name: {
                        required: true,
                    },
                    update_brand_desc: {
                        required: true,
                    },

                    update_brand_category: {
                        required: true,
                    }
                },
                messages: {
                    category: {
                        required: "Select a Category",
                    }
                },
                errorElement: 'span',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.col-sm-10').append(error);
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });


        function updateBrand(id, name, desc, image, category) {
            $('#update_image').attr("src", image);
            document.getElementById('update_brnad_id').value = id;
            document.getElementById('update_brand_name').value = name;
            document.getElementById('update_brand_desc').value = desc;
            document.getElementById('update_brand_category').value = category;
        }

        function statusBrand(id) {
            $.ajax({
                type: 'DELETE',
                url: '${ADMIN_BASE_URL}Brand?id=' + id,
                success: function (data) {
                    console.log(data);
                    if (data == "success") {
                        Swal.fire({
                            title: 'Changes Saved',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'success'
                        }).then((result) => {
                            window.location.reload();
                        });
                    } else {
                        Swal.fire({
                            title: 'Cannot Delete Brand try again',
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
                        title: 'Cannot Delete try again',
                        showDenyButton: false,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        icon: 'error'
                    }).then((result) => {
                    });
                }
            })
        }

        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let brand_name = document.getElementById('brand_name').value;
//                    let brand_img = document.getElementById('brand_img').value;
                    let brand_desc = document.getElementById('brand_desc').value;
                    let category = document.getElementById('category').value;
//                    let brand_img = $('#brand_img')[0].files[0];

                    var formData = new FormData();
                    formData.append('brand_img', $('#brand_img')[0].files[0]);
                    formData.append('brand_name', brand_name);
                    formData.append('brand_desc', brand_desc);
                    formData.append('category', category);
                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}Brand',
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
                                    title: 'Cannot Save Brand try again',
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
            $('#brandSave').validate({
                rules: {
                    brand_name: {
                        required: true,
                    },
                    brand_desc: {
                        required: true,
                    },
                    brand_img: {
                        required: true,
                    },
                    category: {
                        required: true,
                    }
                },
                messages: {
                    category: {
                        required: "Select a Category",
                    }
                },
                errorElement: 'span',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.col-sm-10').append(error);
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
                    let brand_name = document.getElementById('brand_name').value;
//                    let brand_img = document.getElementById('brand_img').value;
                    let brand_desc = document.getElementById('brand_desc').value;
                    let category = document.getElementById('category').value;
//                    let brand_img = $('#brand_img')[0].files[0];

                    var formData = new FormData();
                    formData.append('brand_img', $('#brand_img')[0].files[0]);
                    formData.append('brand_name', brand_name);
                    formData.append('brand_desc', brand_desc);
                    formData.append('category', category);
                    $.ajax({
                        type: 'POST',
                        url: '${ADMIN_BASE_URL}Brand',
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

                                });
                            } else {
                                Swal.fire({
                                    title: 'Cannot Save Brand try again',
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
            $('#subCategory').validate({
                rules: {
                    brand_name: {
                        required: true,
                    },
                    brand_desc: {
                        required: true,
                    },

                    subcategory: {
                        required: true,
                    }
                },
                messages: {
                    subcategory: {
                        required: "Select a Category",
                    }
                },
                errorElement: 'span',
                errorPlacement: function (error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.col-sm-10').append(error);
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

