<%-- 
    Document   : editProduct
    Created on : Nov 17, 2023, 9:00:02 PM
    Author     : pasin
--%>


<%@page import="dto.TagDTO"%>
<%@page import="dto.BrandDTO"%>
<%@page import="dao.BrandDao"%>
<%@page import="dto.GalleryDTO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Tech</title>
        <%@include file="style.jsp" %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" integrity="sha512-xmGTNt20S0t62wHLmQec2DauG9T+owP9e6VU8GigI0anN7OXLip9i7IwEhelasml2osdxX71XcYm6BQunTQeQg==" crossorigin="anonymous" />
        <!-- summernote -->
        <link rel="stylesheet" href="../plugins/summernote/summernote-bs4.min.css">
        <style>
            .bootstrap-tagsinput{

                width: 100%;

            }

            .label-info{

                background-color: #4CA771;


            }

            .label {

                display: inline-block;

                padding: .25em .4em;

                font-size: 75%;

                font-weight: 700;

                line-height: 1;

                text-align: center;

                white-space: nowrap;

                vertical-align: baseline;

                border-radius: .25rem;

                transition: color .15s ease-in-out,background-color .15s ease-in-out,

                    border-color .15s ease-in-out,box-shadow .15s ease-in-out;

            }
            textarea {
                resize: none;
            }

            #count_message {
                background-color: smoke;
                margin-top: -20px;
                margin-right: 5px;
            }
        </style>
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
                            <h1 class="text-color">Update Product  </h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item "><a href="#">Home</a></li>
                                <li class="breadcrumb-item text-color ">Update Product</li>
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
                        <%                            ProductDAO productDAO = new ProductDAO();
                            try {
                                int id = Integer.parseInt(request.getParameter("id"));
                                ProductDTO productDTO = productDAO.getById(id);
                                GalleryDTO gallery = null;
                                if (productDTO != null) {
                                    List<GalleryDTO> galleryDTOs = productDTO.getGalleries();
                                    for (GalleryDTO galleryDTO : galleryDTOs) {
                                        if (galleryDTO.getThumbnail()) {
                                            gallery = galleryDTO;
                                        }
                                    }
                                    List<TagDTO>  tagDTOs = productDTO.getTags();
                                    String tags = "";
                                    for(TagDTO tagDTO : tagDTOs){
                                        tags += tagDTO.getTagName()+",";
                                    }
                        %>
                        <form id="addProductForm">
                            <input type="hidden" class="form-control" id="id" name="id" value="<%= productDTO.getId() %>" placeholder="Enter ...">

                            <div class="row justify-content-center">
                                <img src="<%= gallery.getImgPath()%>" class="card-img-top col" id="product_image" alt="brand image" style="max-height: 250px;max-width: 250px">
                            </div>
                            <div class="row justify-content-center">
                                <div class="custom-file mt-3 mb-3 col-sm-6 form-group">
                                    <input type="file" class="custom-file-input" accept="image/png, image/gif, image/jpeg" name="productImage" id="productImage">
                                    <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Product Name</label>
                                        <input type="text" class="form-control" id="product_name" name="product_name" value="<%= productDTO.getProductName()%>" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">QTY</label>
                                        <input type="number" min="0" class="form-control" id="qty" value="<%= productDTO.getQty()%>" name="qty" placeholder="Enter ..." >
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Price</label>
                                        <input type="number" min="1" class="form-control" id="price" value="<%= productDTO.getProductPrice()%>" name="price" placeholder="Enter ...">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Discount Price</label>
                                        <input type="number" min="0" class="form-control" id="discount" name="discount" value="<%= productDTO.getDiscountPrice()%>" placeholder="Enter ...">
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Category</label>
                                        <select class="form-control" id="category" name="category">
                                            <option value="0" disabled selected>Select Category</option>
                                            <%
                                                List<Category> categorys = new CategoryDAO().getAllActiveCategoriess();
                                                if (categorys != null) {
                                                    for (Category categoryDTO : categorys) {
                                                        if (categoryDTO.getId() == productDTO.getBrand().getCategory().getId()) {
                                            %>
                                            <option value="<%= categoryDTO.getId()%>" selected><%= categoryDTO.getCategoryName()%></option>
                                            <%
                                            } else {
                                            %>
                                            <option value="<%= categoryDTO.getId()%>"><%= categoryDTO.getCategoryName()%></option>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label class="text-color">Sub Category / Brand</label>
                                        <select class="form-control" id="brand" name="brand">
                                            <%
                                                BrandDao brandDao = new BrandDao();
                                                List<BrandDTO> brandDTOs = brandDao.getByCategory(productDTO.getBrand().getCategory().getId());
                                                for(BrandDTO brandDTO : brandDTOs){
                                                    if(brandDTO.getId() == productDTO.getBrand().getId()){
                                                        %>
                                                        <option value="<%= brandDTO.getId() %>" selected><%= brandDTO.getBrandName() %></option>
                                            <%
                                                    }else{
                                                        %>
                                            <option value="<%= brandDTO.getId() %>"><%= brandDTO.getBrandName() %></option>
                                                        <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="text-color">Tags</label>
                                        <input type="text" data-role="tagsinput" name="tags" value="<%= tags %>" id="tags"  class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label>Published </label>
                                    <div class="row justify-content-center"> 
                                        <%
                                            if(productDTO.getPublished()){
                                                %>
                                        <div class="custom-control custom-radio mr-3">
                                            <input class="custom-control-input custom-control-input-danger custom-control-input-outline" type="radio" id="customRadio5"  value="0"  name="publish"   />
                                            <label for="customRadio5" class="custom-control-label font-weight-normal">Unpublished</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input class="custom-control-input custom-control-input-danger custom-control-input-outline" type="radio" value="1" id="published" name="publish" checked />
                                            <label for="published" class="custom-control-label font-weight-normal">Published</label>
                                        </div>
                                        <%
                                            }else{
                                                %>
                                        <div class="custom-control custom-radio mr-3">
                                            <input class="custom-control-input custom-control-input-danger custom-control-input-outline" type="radio" id="customRadio5"  value="0"  name="publish"  checked />
                                            <label for="customRadio5" class="custom-control-label font-weight-normal">Unpublished</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input class="custom-control-input custom-control-input-danger custom-control-input-outline" type="radio" value="1" id="published" name="publish"  />
                                            <label for="published" class="custom-control-label font-weight-normal">Published</label>
                                        </div>
                                        <%
                                            }
                                        %>
                                        
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <label>Short description</label>
                                    <textarea class="form-control"  id="short_desc" name="short_desc" 
                                              maxlength="200" placeholder="Type in your message" rows="5"> <%= productDTO.getShortDescription() %> </textarea>
                                    <span class="pull-right label label-default" id="count_message"></span>
                                    <!--<textarea class="form-control" rows="3" id="short_desc" name="short_desc" placeholder="Enter ..."></textarea>-->
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-outline card-success">
                                        <div class="card-header">
                                            <h3 class="card-title">
                                                Description
                                            </h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <textarea id="description" name="description">
                                                <%= productDTO.getDescription() %>
                                            </textarea>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.col-->
                            </div>

                            <br>


                            <div class="row justify-content-center ">
                                <button type="submit" id="save-user" class="btn btn-success bg-color" >Save Product</button>
                            </div>
                        </form>
                        <%
                                } else {

                                }
                            } catch (Exception e) {
                            }
                        %>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

            </section>
            <!-- /.content -->
        </div>
        <%@include file="../navs/footer.jsp" %>
        <%@include file="js.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.js" integrity="sha512-VvWznBcyBJK71YKEKDMpZ0pCVxjNuKwApp4zLF3ul+CiflQi6aIJR+aZCP/qWsoFBA28avL5T5HA+RE+zrGQYg==" crossorigin="anonymous"></script>
        <!-- Summernote -->
        <script src="../plugins/summernote/summernote-bs4.min.js"></script>
        <!-- /.content-wrapper -->
    </body>
    <script>

        var text_max = 200;
        $('#count_message').html('0 / ' + text_max);

        $('#short_desc').keyup(function () {
            var text_length = $('#short_desc').val().length;
            var text_remaining = text_max - text_length;

            $('#count_message').html(text_length + ' / ' + text_max);
        });

        $(function () {
            $.validator.setDefaults({
                submitHandler: function (form, event) {
                    event.preventDefault();
                    let id = document.getElementById('id').value;
                    let product_name = document.getElementById('product_name').value;
                    let discount = document.getElementById('discount').value;
                    let qty = document.getElementById('qty').value;
                    let Price = document.getElementById('price').value;
                    let category = document.getElementById('category').value;
                    let brand = document.getElementById('brand').value;
                    let tags = document.getElementById('tags').value;
                    let published = $('input[name=publish]:checked').val();
                    let short_desc = document.getElementById('short_desc').value;
                    let productDescription = $('#description').summernote('code');

                    var formData = new FormData();
                    formData.append('id', id);
                    formData.append('productImage', $('#productImage')[0].files[0]);
                    formData.append('product_name', product_name);
                    formData.append('discount', discount);
                    formData.append('qty', qty);
                    formData.append('price', Price);
                    formData.append('category', category);
                    formData.append('brand', brand);
                    formData.append('tags', tags);
                    formData.append('published', published);
                    formData.append('short_desc', short_desc);
                    formData.append('productDescription', productDescription);

                    if ($('#description').summernote('isEmpty'))
                    {
                        Swal.fire({
                            title: 'Add a description',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'error'
                        }).then((result) => {
                        });
                    } else {
                        $.ajax({
                            type: 'POST',
                            url: '${ADMIN_BASE_URL}UpdateProduct',
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
                                        window.location = 'viewProducts.jsp';
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
                                    title: 'Cannot Update try again',
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
            $('#addProductForm').validate({
                rules: {
                    product_name: {
                        required: true,
                    },
                    qty: {
                        required: true,
                    },
                    
                    price: {
                        required: true,
                    },
                    discount: {
                        required: true
                    },
                    brand: {
                        required: true
                    },
                    tags: {
                        required: true
                    },
                    short_desc: {
                        required: true
                    },
                    category: {
                        required: true,
                    }
                },
                messages: {
                    category: {
                        required: "Select a Category",
                    },
                    brand: {
                        required: "Select a brand",
                    }
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
            // Summernote
            $('#description').summernote()


        })

        document.getElementById('productImage').onchange = function (evt) {
            var tgt = evt.target || window.event.srcElement,
                    files = tgt.files;

            // FileReader support
            if (FileReader && files && files.length) {
                var fr = new FileReader();
                fr.onload = function () {
                    $('#product_image').attr("src", fr.result);
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
        // Get the select element of brand by its ID
        var selectElement = $("#brand");
        $("#category").on("change", function (event) {
            let category = document.getElementById('category').value;

            fetch('${ADMIN_BASE_URL}Brand?category=' + category)
                    .then(response => response.json())
                    .then(data => {
                        console.log(data)
                        selectElement.empty();
                        data.forEach(brand => {

                            console.log(brand.brandName);
                            var optionElement = $("<option>")
                                    .attr("value", brand.id)  // Set the ID as the value attribute
                                    .text(brand.brandName);

                            // Append the created <option> element to the select element
                            selectElement.append(optionElement);
                        });
                    })
                    .catch(error => {
                        // Handle any errors that occurred in the above promise chain
                        selectElement.empty();
                        Swal.fire({
                            title: 'Something went wrong try again',
                            showDenyButton: false,
                            showCancelButton: false,
                            confirmButtonText: 'OK',
                            icon: 'error'
                        }).then((result) => {
                        });
                    });
        });



    </script>
</html>
