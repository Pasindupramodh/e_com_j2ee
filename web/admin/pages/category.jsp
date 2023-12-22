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
                        <form id="addCategory">


                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Category Name</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Category ICON</label>
                                        <div class="row g-5">
                                            <div class="col-8 justify-content-center text-center">
                                                <button id="uip-select-btn" class="btn btn-success " title="Open the Icon Library">Click to open the Icon Library</button>
                                            </div>
                                            <div class=" col-2  justify-content-center text-center">
                                                <button id="uip-reset-btn" class="btn btn-danger" title="Reset">Reset</button>
                                            </div>

                                            <div class="demo-output-icon col-2  justify-content-center text-center" id="output-icon"></div>
                                            <!--<pre><code class="demo-output-json" id="output-json"></code></pre>-->
                                        </div>
                                        <input type="hidden" id="ico" name="ico"/>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Category Description</label>
                                        <input type="text " class="form-control" id="desc" name="desc" placeholder="Enter ...">
                                    </div>
                                </div>

                            </div>

                            <div class="row justify-content-center ">
                                <button type="submit" id="save-user" class="btn btn-success bg-color" >Save Category</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

                <div class="card " >
                    <div class="card-header bg-color" style="">
                        <h3 class="card-title text-white" >Categories</h3>
                    </div>
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Category Description</th>
                                <th>Category Icon</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="table-categories">

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Category Description</th>
                                <th>Category Icon</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </section>
            <!-- /.content -->
        </div>
        <div class="modal fade" id="modal-lg">
            <div class="modal-dialog modal-lg">
                <form id="updateCategory">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Update Category</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">



                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <input type="hidden" class="form-control" id="update-id" name="update-id" placeholder="Enter ...">
                                    <div class="form-group">
                                        <label class="text-color">Category Name</label>
                                        <input type="text" class="form-control" id="update-name" name="update_name" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Category ICON</label>
                                        <div class="row g-5">
                                            <div class="col-8 justify-content-center text-center">
                                                <button type="button" id="open-icon" class="btn btn-success " title="Open the Icon Library">Click to open the Icon Library</button>
                                            </div>
                                            <div class=" col-2  justify-content-center text-center">
                                                <button type="button" id="reset-icon" class="btn btn-danger" title="Reset">Reset</button>
                                            </div>

                                            <div class="demo-output-icon col-2  justify-content-center text-center" id="out-icon"></div>
                                            <!--<pre><code class="demo-output-json" id="output-json"></code></pre>-->
                                        </div>
                                        <input type="hidden" id="ico-update" name="ico"/>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Category Description</label>
                                        <input type="text " class="form-control" id="update-desc" name="update_desc" placeholder="Enter ...">
                                    </div>
                                </div>

                            </div>



                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success bg-color">Update Category</button>
                        </div>
                    </div>
                </form>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->s
        <%@include file="../navs/footer.jsp" %>
        <%@include file="js.jsp" %>
        <script src="../plugins/universal-icon-picker/assets/js/universal-icon-picker.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function (event) {
                const uip = new UniversalIconPicker('#uip-select-btn', {
                    iconLibraries: [
                        'font-awesome.min.json'
                    ],
                    iconLibrariesCss: [
                        'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css'
                    ],
                    resetSelector: '#uip-reset-btn',
                    onSelect: function (jsonIconData) {
                        console.log();
                        document.getElementById('ico').value = jsonIconData.iconClass;
                        document.getElementById('output-icon').innerHTML = jsonIconData.iconHtml;
                    },
                    onReset: function () {
                        document.getElementById('output-icon').innerHTML = '';
                    }
                });
                const uip1 = new UniversalIconPicker('#open-icon', {
                    iconLibraries: [
                        'font-awesome.min.json'
                    ],
                    iconLibrariesCss: [
                        'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css'
                    ],
                    resetSelector: '#reset-icon',
                    onSelect: function (jsonIconData) {
                        console.log();
                        document.getElementById('ico-update').value = jsonIconData.iconClass;
                        document.getElementById('out-icon').innerHTML = jsonIconData.iconHtml;
                    },
                    onReset: function () {
                        document.getElementById('out-icon').innerHTML = '';
                    }
                });
            });
        </script>
        <!-- /.content-wrapper -->
    </body>
    
    <script>



        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let ico = document.getElementById('ico').value;
                    let name = document.getElementById('name').value;
                    let desc = document.getElementById('desc').value;
                    if (ico == null || (typeof ico === "string" && ico.trim().length === 0)) {
                        Swal.fire({
                            title: "Select an icon",
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'warning'
                        }).then((result) => {

                        });
                    } else {
                        $.ajax({
                            type: 'POST',
                            url: '${ADMIN_BASE_URL}Category',
                            data: {
                                name: name,
                                desc: desc,
                                ico: ico,
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
                                        window.location = 'category.jsp';

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

                }
            });
            $('#addCategory').validate({
                rules: {
                    name: {
                        required: true,
                    },
                    desc: {
                        required: true,
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
        function loadCategories() {
            fetch("${ADMIN_BASE_URL}Category")
                    .then(response => response.json())
                    .then(data => {
                        let table = document.querySelector('#table-categories');
                        console.log(data)
                        table.innerHTML = "";
                        data.forEach(category => {
                            let row = table.insertRow();
                            let cell = row.insertCell();
                            cell.innerHTML = category.id;
                            cell = row.insertCell();
                            cell.innerHTML = category.categoryName;
                            cell = row.insertCell();
                            cell.innerHTML = category.categoryDesc;
                            cell = row.insertCell();
                            cell.innerHTML = "<i class= '" + category.categoryIcon + "' ></i>";

                            cell = row.insertCell();
                            if (category.status) {
                                cell.innerHTML = '<span class="badge bg-success">Active</span>';
                            } else {
                                cell.innerHTML = '<span class="badge bg-danger">Inactive</span>';
                            }

                            cell = row.insertCell();
                            if (category.status) {
                                cell.innerHTML = '<a type="button" class="badge bg-success mr-3" onclick="updateCategory(' + category.id + ',`' + category.categoryName + '`,`' + category.categoryDesc + '`,`' + category.categoryIcon + '`)" data-toggle="modal" data-target="#modal-lg">Edit</a>' +
                                        '<a class="badge bg-danger" onclick="deleteUser(' + category.id + ',`' + category.categoryName + '`)"  href="javascript:;" >Deactivate</a>';
                            } else {
                                cell.innerHTML = '<a type="button" class="badge bg-success mr-3" onclick="updateCategory(' + category.id + ',`' + category.categoryName + '`,`' + category.categoryDesc + '`,`' + category.categoryIcon + '`)" data-toggle="modal" data-target="#modal-lg">Edit</a>' +
                                        '<a class="badge bg-danger" onclick="deleteUser(' + category.id + ',`' + category.categoryName + '`)"  href="javascript:;" >Activate</a>';
                            }

                        });
                    })
        }
        function updateCategory(id, name, desc, icon) {
            var ico = document.getElementById('out-icon');
            ico.innerHTML = '';
            ico.innerHTML = "<i class= '" + icon + "' ></i>";
            document.getElementById('update-id').value = id;
            document.getElementById('update-name').value = name;
            document.getElementById('update-desc').value = desc;
            document.getElementById('ico-update').value = icon;
        }
        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let ico = document.getElementById('ico-update').value;
                    let name = document.getElementById('update-name').value;
                    let desc = document.getElementById('update-desc').value;
                    let id = document.getElementById('update-id').value;
                    if (ico == null || (typeof ico === "string" && ico.trim().length === 0)) {
                        Swal.fire({
                            title: "Select an icon",
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'warning'
                        }).then((result) => {

                        });
                    } else {
                        $.ajax({
                            type: 'PUT',
                            url: '${ADMIN_BASE_URL}Category?id=' + id + '&name=' + name + '&desc=' + desc + '&icon=' + ico,

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
                                        $('#modal-lg').modal('hide');
                                        loadCategories();
                                    });
                                } else {
                                    Swal.fire({
                                        title: 'Cannot Update Category try again',
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
                                    title: 'Cannot Update user try again',
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'error'
                                }).then((result) => {
                                });
                            }
                        })
                    }

                }
            });
            $('#updateCategory').validate({
                rules: {
                    update_name: {
                        required: true,
                    },
                    update_desc: {
                        required: true,
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


        function deleteUser(id, name) {
            Swal.fire({
                title: 'Do you want to delete ' + name + '?',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Save',
                denyButtonText: `Don't save`
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {

                    $.ajax({
                        type: 'DELETE',
                        url: '${ADMIN_BASE_URL}Category?id=' + id,

                        success: function (data) {
                            if (data == "success") {
                                Swal.fire('Changes are saved', '', 'success');
                            } else {
                                Swal.fire('Something went wrong', '', 'error');
                            }


                            loadCategories();
                        },
                        error: function () {
                            Swal.fire('Something went wrong', '', 'error');
                        }
                    });

                } else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info');
                }
            });
        }

        loadCategories();
    </script>
</html>
