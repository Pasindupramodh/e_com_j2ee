<%-- 
    Document   : product_detail
    Created on : Nov 30, 2023, 7:23:12 AM
    Author     : pasin
--%>

<%@page import="model.Reviews"%>
<%@page import="model.Gallery"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="images/favicon.png" rel="shortcut icon">
        <title>GreenTech</title>

        <!--====== Google Font ======-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">

        <%@include file="css.jsp" %>
    </head>
    <body class="config">
        <%
            if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
                response.sendRedirect("index.jsp");
            } else {
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getById(request.getParameter("id"));
                if (product == null && product.getQty() == 0) {
                    response.sendRedirect("index.jsp");
                }


        %>
        <div class="preloader is-active">
            <div class="preloader__wrap">

                <img class="preloader__img" src="images/preloader.png" alt=""></div>
        </div>

        <!--====== Main App ======-->
        <div id="app">

            <!--====== Main Header ======-->
            <%@include file="customerNavs/header.jsp" %>
            <!--====== End - Main Header ======-->


            <!--====== App Content ======-->
            <div class="app-content">

                <!--====== Section 1 ======-->
                <div class="u-s-p-t-90">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">




                                <!--====== Product Detail Zoom ======-->
                                <div class="pd u-s-m-b-30">
                                    <div class="slider-fouc pd-wrap">
                                        <div id="pd-o-initiate">
                                            <%                                                for (Gallery gallery : product.getGalleries()) {
                                            %>
                                            <div class="pd-o-img-wrap" data-src="<%= gallery.getImgPath()%>">

                                                <img class="u-img-fluid" src="<%= gallery.getImgPath()%>" data-zoom-image="images/product/product-d-1.jpg" alt="">
                                            </div>
                                            <%
                                                }
                                            %>


                                        </div>

                                        <span class="pd-text">Click for larger zoom</span>
                                    </div>
                                    <div class="u-s-m-t-15">
                                        <div class="slider-fouc">
                                            <div id="pd-o-thumbnail">
                                                <%
                                                    String image = "";
                                                    for (Gallery gallery : product.getGalleries()) {
                                                        if (gallery.getThumbnail()) {
                                                            image = gallery.getImgPath();
                                                        }
                                                %>
                                                <div>

                                                    <img class="u-img-fluid" src="<%= gallery.getImgPath()%>" alt="">
                                                </div>
                                                <%
                                                    }
                                                %>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--====== End - Product Detail Zoom ======-->
                            </div>
                            <div class="col-lg-7">

                                <!--====== Product Right Side Details ======-->
                                <div class="pd-detail">
                                    <div>

                                        <span class="pd-detail__name"><%= product.getProductName()%></span></div>
                                    <div>
                                        <div class="pd-detail__inline">

                                            <span class="pd-detail__price"><%= product.getProductPrice() - product.getDiscountPrice()%></span>

                                            <span class="pd-detail__discount">(<%= product.getDiscountPrice()%> LKR off)</span><del class="pd-detail__del"><%= product.getProductPrice()%></del></div>
                                    </div>

                                    <div class="u-s-m-b-15">
                                        <div class="pd-detail__inline">

                                            <span class="pd-detail__stock"><%= product.getQty()%> in stock</span>

                                        </div>
                                    </div>
                                    <div class="u-s-m-b-15">

                                        <span class="pd-detail__preview-desc"><%= product.getShortDescription()%></span></div>
                                    <div class="u-s-m-b-15">
                                        <div class="pd-detail__inline">

                                            <span class="pd-detail__click-wrap"><i class="far fa-heart u-s-m-r-6"></i>

                                                <a href="signin.html">Add to Wishlist</a>

                                                <span class="pd-detail__click-count">(222)</span></span></div>
                                    </div>

                                    <div class="u-s-m-b-15">
                                        <form class="pd-detail__form">
                                            <div class="pd-detail-inline-2">
                                                <div class="u-s-m-b-15">

                                                    <!--====== Input Counter ======-->
                                                    <div class="input-counter">

                                                        <span class="input-counter__minus fas fa-minus"></span>

                                                        <input class="input-counter__text input-counter--text-primary-style" id="qty_product" type="text" value="1" data-min="1" data-max="<%= product.getQty()%>">

                                                        <span class="input-counter__plus fas fa-plus"></span></div>
                                                    <!--====== End - Input Counter ======-->
                                                </div>
                                                <div class="u-s-m-b-15">

                                                    <button class="btn btn--e-brand-b-2" type="button" onclick="setDataToAddToCart('<%= product.getId()%>', '<%= product.getProductName()%>', '<%= product.getProductPrice() - product.getDiscountPrice()%> ', '<%= image%>')">Add to Cart</button>
                                                    <button class="btn btn--e-brand-b-2" onclick="proceedToCheckout(<%= product.getId()%>)" type="button">Buy Now</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="u-s-m-b-15">

                                        <span class="pd-detail__label u-s-m-b-8">Product Policy:</span>
                                        <ul class="pd-detail__policy-list">
                                            <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                                <span>Buyer Protection.</span></li>
                                            <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                                <span>Full Refund if you don't receive your order.</span></li>
                                            <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                                <span>Returns accepted if product not as described.</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <!--====== End - Product Right Side Details ======-->
                            </div>
                        </div>
                    </div>
                </div>

                <!--====== Product Detail Tab ======-->
                <div class="u-s-p-y-90">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="pd-tab">
                                    <div class="u-s-m-b-30">
                                        <ul class="nav pd-tab__list">
                                            <li class="nav-item">

                                                <a class="nav-link active" data-toggle="tab" href="#pd-desc">DESCRIPTION</a></li>

                                            <li class="nav-item">

                                                <a class="nav-link" id="view-review" data-toggle="tab" href="#pd-rev">REVIEWS

                                                    <span>(<%= product.getReviewses().size()%>)</span></a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-content">

                                        <!--====== Tab 1 ======-->
                                        <div class="tab-pane fade show active" id="pd-desc">
                                            <div class="pd-tab__desc">
                                                <%= product.getDescription()%>
                                            </div>
                                        </div>
                                        <!--====== End - Tab 1 ======-->





                                        <!--====== Tab 3 ======-->
                                        <div class="tab-pane" id="pd-rev">
                                            <div class="pd-tab__rev">

                                                <div class="u-s-m-b-30">
                                                    <form class="pd-tab__rev-f1">

                                                        <%
                                                            if (product.getReviewses().isEmpty()) {
                                                        %>
                                                        <div class="rev-f1__review">
                                                            <div class="review-o u-s-m-b-15">
                                                                <div class="review-o__info u-s-m-b-8">

                                                                    <span class="review-o__name">No Reviews</span>

                                                                </div>

                                                            </div>
                                                        </div>
                                                        <%
                                                        } else {
                                                            for (Reviews reviews : product.getReviewses()) {
                                                        %>
                                                        <div class="rev-f1__review">
                                                            <div class="review-o u-s-m-b-15">
                                                                <div class="review-o__info u-s-m-b-8">

                                                                    <span class="review-o__name"><%= (reviews.getIsAnonymous())? "******":reviews.getCustomer().getFname()+" "+reviews.getCustomer().getLname() %></span>

                                                                    <span class="review-o__date"><%= reviews.getDate() %></span></div>
                                                                <div class="review-o__rating gl-rating-style u-s-m-b-8">
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="<%= (reviews.getStarCount()>=2)? "fas":"far" %> fa-star"></i>
                                                                    <i class="<%= (reviews.getStarCount()>=3)? "fas":"far" %> fa-star"></i>
                                                                    <i class="<%= (reviews.getStarCount()>=4)? "fas":"far" %> fa-star"></i>
                                                                    <i class="<%= (reviews.getStarCount()>=5)? "fas":"far" %> fa-star"></i>

                                                                    <span>(4)</span></div>
                                                                <p class="review-o__text"><%= reviews.getReview() %></p>
                                                            </div>
                                                        </div>
                                                        <%
                                                                }
                                                            }
                                                        %>


                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <!--====== End - Tab 3 ======-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Product Detail Tab ======-->
                <div class="u-s-p-b-90">

                    <!--====== Section Intro ======-->
                    <div class="section__intro u-s-m-b-46">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section__text-wrap">
                                        <h1 class="section__heading u-c-secondary u-s-m-b-12">Related Products</h1>

                                        <span class="section__span u-c-grey">You may also like</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Intro ======-->


                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="slider-fouc">
                                <div class="owl-carousel product-slider" data-item="4">
                                    <%
                                        for (Brand brand : product.getBrand().getCategory().getBrands()) {
                                            for (Product productRelated : brand.getProducts()) {
                                                if (productRelated.getPublished() && productRelated.getQty() > 0) {
                                                    String imagepath = "";
                                                    for (Gallery gallery : productRelated.getGalleries()) {
                                                        if (gallery.getThumbnail()) {
                                                            imagepath = gallery.getImgPath();
                                                            break;
                                                        }
                                                    }
                                    %>
                                    <div class="u-s-m-b-30">
                                        <div class="product-o product-o--hover-on">
                                            <div class="product-o__wrap">

                                                <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product_detail.jsp?id=<%= productRelated.getId()%>">

                                                    <img class="aspect__img" src="<%= imagepath%>" alt=""></a>
                                                <div class="product-o__action-wrap">
                                                    <ul class="product-o__action-list">
                                                        <li>

                                                            <a data-modal="modal" onclick="setDataToQuickLook('<%= imagepath%>', '<%= productRelated.getProductName()%>',<%= productRelated.getDiscountPrice()%>,<%= productRelated.getProductPrice()%>,<%= productRelated.getQty()%>, '<%= productRelated.getShortDescription()%>')" data-modal-id="#quick-look" data-tooltip="tooltip" data-placement="top" title="Quick View"><i class="fas fa-search-plus"></i></a>
                                                        </li>
                                                        <li>

                                                            <a  onclick="setDataToAddToCart('<%= productRelated.getId()%>', '<%= productRelated.getProductName()%>', '<%= productRelated.getProductPrice() - productRelated.getDiscountPrice()%> ', '<%= imagepath%>')"  data-tooltip="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-plus-circle"></i></a>
                                                        </li>
                                                        <li>

                                                            <a href="signin.html" data-tooltip="tooltip" data-placement="top" title="Add to Wishlist"><i class="fas fa-heart"></i></a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>

                                            <span class="product-o__category">

                                                <a href="shop-side-version-2.html"><%= productRelated.getBrand().getCategory().getCategoryName()%></a></span>

                                            <span class="product-o__name">

                                                <a href="product_detail.jsp?id=<%= productRelated.getId()%>"><%= productRelated.getProductName()%></a></span>


                                            <span class="product-o__price"><%= productRelated.getProductPrice() - productRelated.getDiscountPrice()%> LKR

                                                <span class="product-o__discount"><%= productRelated.getProductPrice()%></span></span>
                                        </div>
                                    </div>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 1 ======-->
            </div>
            <!--====== End - App Content ======-->


            <!--====== Main Footer ======-->
            <%@include file="customerNavs/footer.jsp" %>
            <!--====== Modal Section ======-->


            <!--====== Quick Look Modal ======-->
            <div class="modal fade" id="quick-look">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content modal--shadow">

                        <button class="btn dismiss-button fas fa-times" type="button" data-dismiss="modal"></button>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-5">


                                    <!--====== Product Detail ======-->
                                    <div class="pd u-s-m-b-30">
                                        <div class="pd-wrap">
                                            <div id="js-product-detail-modal">
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-1.jpg" alt="">
                                                </div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-2.jpg" alt="">
                                                </div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-3.jpg" alt="">
                                                </div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-4.jpg" alt="">
                                                </div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-5.jpg" alt="">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!--====== End - Product Detail ======-->
                                </div>
                                <div class="col-lg-7">

                                    <!--====== Product Right Side Details ======-->
                                    <div class="pd-detail">
                                        <div>

                                            <span class="pd-detail__name" id="product-name">Product</span></div>
                                        <div>
                                            <div class="pd-detail__inline">

                                                <span class="pd-detail__price"id="product-price">price</span>

                                                <span class="pd-detail__discount" id="discount">discount</span><del class="pd-detail__del" id="afterDiscount">afterdis</del></div>
                                        </div>

                                        <div class="u-s-m-b-15">
                                            <div class="pd-detail__inline">

                                                <span class="pd-detail__stock" id="qty"> in stock</span>

                                                <!--<span class="pd-detail__left">Only 2 left</span></div>-->
                                            </div>
                                            <div class="u-s-m-b-15">

                                                <span class="pd-detail__preview-desc" id="product_desc">desc</span></div>
                                            <div class="u-s-m-b-15">
                                                <div class="pd-detail__inline">

                                                    <span class="pd-detail__click-wrap"><i class="far fa-heart u-s-m-r-6"></i>

                                                        <a href="signin.html">Add to Wishlist</a>

                                                        <span class="pd-detail__click-count">(222)</span></span></div>
                                            </div>


                                            <div class="u-s-m-b-15">
                                                <form class="pd-detail__form">
                                                    <div class="pd-detail-inline-2">
                                                        <div class="u-s-m-b-15">

                                                            <!--====== Input Counter ======-->
                                                            <div class="input-counter">

                                                                <span class="input-counter__minus fas fa-minus"></span>

                                                                <input class="input-counter__text input-counter--text-primary-style" type="text" id="max_qty" value="1" data-min="1" data-max="3">

                                                                <span class="input-counter__plus fas fa-plus"></span></div>
                                                            <!--====== End - Input Counter ======-->
                                                        </div>
                                                        <div class="u-s-m-b-15">

                                                            <button class="btn btn--e-brand-b-2" type="submit">Add to Cart</button></div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="u-s-m-b-15">

                                                <span class="pd-detail__label u-s-m-b-8">Product Policy:</span>
                                                <ul class="pd-detail__policy-list">
                                                    <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                                        <span>Buyer Protection.</span></li>
                                                    <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                                        <span>Full Refund if you don't receive your order.</span></li>
                                                    <li><i class="fas fa-check-circle u-s-m-r-8"></i>

                                                        <span>Returns accepted if product not as described.</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--====== End - Product Right Side Details ======-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Quick Look Modal ======-->


                <!--====== End - Add to Cart Modal ======-->

            </div>
            <!--====== End - Quick Look Modal ======-->


            <!--====== Add to Cart Modal ======-->
            <%@include file="common_use/cart_add.jsp" %>
            <!--====== End - Add to Cart Modal ======-->
            <!--====== End - Modal Section ======-->
        </div>
        <!--====== End - Main App ======-->


        <!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
        <script>
            window.ga = function () {
                ga.q.push(arguments)
            };
            ga.q = [];
            ga.l = +new Date;
            ga('create', 'UA-XXXXX-Y', 'auto');
            ga('send', 'pageview')
        </script>
        <%@include file="js.jsp" %>

        <%@include file="js/js.jsp" %>
        <!--====== Noscript ======-->
        <script>
            function proceedToCheckout(id) {
                var qty = document.getElementById('qty_product').value;
                window.location.href = '${BASE_URL}/auth/checkout.jsp?product=' + id + '&qty=' + qty;
            }
        </script>
        <noscript>
        <div class="app-setting">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="app-setting__wrap">
                            <h1 class="app-setting__h1">JavaScript is disabled in your browser.</h1>

                            <span class="app-setting__text">Please enable JavaScript in your browser or upgrade to a JavaScript-capable browser.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </noscript>
        <%        }
        %>
    </body>
</html>
