<%-- 
    Document   : viewProduct
    Created on : Nov 19, 2023, 12:38:19 PM
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
                            <h1>View Product</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">View Product</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
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
                            List<TagDTO> tagDTOs = productDTO.getTags();

                %>
                <div class="card card-solid">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <h3 class="d-inline-block d-sm-none"><%= productDTO.getProductName()%></h3>
                                <div class="col-12">
                                    <img src="<%= gallery.getImgPath()%>" class="product-image" alt="Product Image">
                                </div>
                                <div class="col-12 product-image-thumbs">
                                    <div class="product-image-thumb active"><img src="<%= gallery.getImgPath()%>" alt="Product Image"></div>
<!--                                    <div class="product-image-thumb" ><img src="../dist/img/prod-2.jpg" alt="Product Image"></div>
                                    <div class="product-image-thumb" ><img src="../dist/img/prod-3.jpg" alt="Product Image"></div>
                                    <div class="product-image-thumb" ><img src="../dist/img/prod-4.jpg" alt="Product Image"></div>
                                    <div class="product-image-thumb" ><img src="../dist/img/prod-5.jpg" alt="Product Image"></div>-->
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <h3 class="my-3"><%= productDTO.getProductName()%></h3>
                                <p><%= productDTO.getShortDescription()%></p>

                                <hr>

                                <div class="row mt-3 g-4">
                                    <div class="col-4">
                                        <h4>Category</h4>
                                    </div>
                                    <div class="col-8">
                                        <h4 class=""> <small> <%= productDTO.getBrand().getCategory().getCategoryName()%></small></h4>
                                    </div>
                                    <div class="col-4">
                                        <h4>Brand</h4>
                                    </div>
                                    <div class="col-8">
                                        <h4 class=""> <small> <%= productDTO.getBrand().getBrandName()%></small></h4>
                                    </div>

                                    <div class="col-4">
                                        <h4>In Stock</h4>
                                    </div>
                                    <div class="col-8">
                                        <h4 class=""> <small> <%= productDTO.getQty()%></small></h4>
                                    </div>

                                    <div class="col-4">
                                        <h4>Tags</h4>
                                    </div>
                                    <div class="col-8">
                                        <h4 class=""> <small> 
                                                <%
                                                for (TagDTO tagDTO : tagDTOs) {
                                                %>
                                                <span class="badge badge-success"> <%= tagDTO.getTagName() %> </span>
                                                <%
                                                    }
                                                %>
                                            </small></h4>
                                    </div>
                                </div>
                                
                                            <div class="bg-color py-2 px-3 mt-4" >
                                    <h2 class="mb-0 text-white">
                                       <small>Product Price : <%= productDTO.getProductPrice()%> LKR </small>
                                    </h2>
                                    <h4 class="mt-0 text-white">
                                        <small>Discount : <%= productDTO.getDiscountPrice()%> LKR </small>
                                    </h4>
                                    <h2 class="mb-0 text-white">
                                       <small>Selling Price : <%= productDTO.getProductPrice()-productDTO.getDiscountPrice() %> LKR </small>
                                    </h2>
                                </div>

                                <div class="mt-4">

                                </div>

                                <div class="mt-4 product-share">

                                </div>

                            </div>
                        </div>
                        <div class="row mt-4">
                            <nav class="w-100">
                                <div class="nav nav-tabs" id="product-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                                    <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Reviews</a>
                                    <a class="nav-item nav-link" id="product-rating-tab" data-toggle="tab" href="#product-rating" role="tab" aria-controls="product-rating" aria-selected="false">Rating</a>
                                </div>
                            </nav>
                            <div class="tab-content p-3" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> <%= productDTO.getDescription()%> </div>
                                <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab"> No Reviews</div>
                                <div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab">  </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
                <%
                        } else {

                        }
                    } catch (Exception e) {
                    }
                %>

            </section>
            <!-- /.content -->
        </div>
        <%@include file="../navs/footer.jsp" %>
        <%@include file="js.jsp" %>
        <!-- Summernote -->
        <!-- /.content-wrapper -->
    </body>
    <script>

        $(document).ready(function () {
            $('.product-image-thumb').on('click', function () {
                var $image_element = $(this).find('img')
                $('.product-image').prop('src', $image_element.attr('src'))
                $('.product-image-thumb.active').removeClass('active')
                $(this).addClass('active')
            })
        })
    </script>
</html>

