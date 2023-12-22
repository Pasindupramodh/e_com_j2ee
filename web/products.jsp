<%-- 
    Document   : products
    Created on : Dec 1, 2023, 5:51:32 AM
    Author     : pasin
--%>

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
                <div class="u-s-p-y-90">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="shop-p">
                                    <div class="shop-p__toolbar u-s-m-b-30">

                                        <div class="shop-p__tool-style">
                                            <div class="tool-style__group u-s-m-b-8">


                                                <span class="js-shop-grid-target is-active">Grid</span>

                                                <span class="js-shop-list-target">List</span></div>
                                            <form>
                                                <div class="tool-style__form-wrap">

                                                    <div class="u-s-m-b-8">
                                                        <select class="select-box select-box--transparent-b-2" id="order" onchange="changeOrder()" >
                                                            <option selected value="createdAt">Sort By: Newest Items</option>
                                                            <option value="productPrice">Sort By: Lowest Price</option>
                                                            <option value="priceDesc">Sort By: Highest Price</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="shop-p__collection">
                                        <div class="row is-grid-active" id="products" style="">

                                        </div>
                                    </div>
                                    <div class="u-s-p-y-60">

                                        <!--====== Pagination ======-->
                                        <ul class="shop-p__pagination" id="links">

                                        </ul>
                                        <!--====== End - Pagination ======-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

                                    <!--====== Product Breadcrumb ======-->
                                    <div class="pd-breadcrumb u-s-m-b-30">
                                        <ul class="pd-breadcrumb__list">
                                            <li class="has-separator">

                                                <a href="index.hml">Home</a></li>
                                            <li class="has-separator">

                                                <a href="shop-side-version-2.html">Electronics</a></li>
                                            <li class="has-separator">

                                                <a href="shop-side-version-2.html">DSLR Cameras</a></li>
                                            <li class="is-marked">

                                                <a href="shop-side-version-2.html">Nikon Cameras</a></li>
                                        </ul>
                                    </div>
                                    <!--====== End - Product Breadcrumb ======-->


                                    <!--====== Product Detail ======-->
                                    <div class="pd u-s-m-b-30">
                                        <div class="pd-wrap">
                                            <div id="js-product-detail-modal">
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-1.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-2.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-3.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-4.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-5.jpg" alt=""></div>
                                            </div>
                                        </div>
                                        <div class="u-s-m-t-15">
                                            <div id="js-product-detail-modal-thumbnail">
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-1.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-2.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-3.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-4.jpg" alt=""></div>
                                                <div>

                                                    <img class="u-img-fluid" src="images/product/product-d-5.jpg" alt=""></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--====== End - Product Detail ======-->
                                </div>
                                <div class="col-lg-7">

                                    <!--====== Product Right Side Details ======-->
                                    <div class="pd-detail">
                                        <div>

                                            <span class="pd-detail__name">Nikon Camera 4k Lens Zoom Pro</span></div>
                                        <div>
                                            <div class="pd-detail__inline">

                                                <span class="pd-detail__price">$6.99</span>

                                                <span class="pd-detail__discount">(76% OFF)</span><del class="pd-detail__del">$28.97</del></div>
                                        </div>
                                        <div class="u-s-m-b-15">
                                            <div class="pd-detail__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>

                                                <span class="pd-detail__review u-s-m-l-4">

                                                    <a href="product-detail.html">23 Reviews</a></span></div>
                                        </div>
                                        <div class="u-s-m-b-15">
                                            <div class="pd-detail__inline">

                                                <span class="pd-detail__stock">200 in stock</span>

                                                <span class="pd-detail__left">Only 2 left</span></div>
                                        </div>
                                        <div class="u-s-m-b-15">

                                            <span class="pd-detail__preview-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></div>
                                        <div class="u-s-m-b-15">
                                            <div class="pd-detail__inline">

                                                <span class="pd-detail__click-wrap"><i class="far fa-heart u-s-m-r-6"></i>

                                                    <a href="signin.html">Add to Wishlist</a>

                                                    <span class="pd-detail__click-count">(222)</span></span></div>
                                        </div>
                                        <div class="u-s-m-b-15">
                                            <div class="pd-detail__inline">

                                                <span class="pd-detail__click-wrap"><i class="far fa-envelope u-s-m-r-6"></i>

                                                    <a href="signin.html">Email me When the price drops</a>

                                                    <span class="pd-detail__click-count">(20)</span></span></div>
                                        </div>
                                        <div class="u-s-m-b-15">
                                            <ul class="pd-social-list">
                                                <li>

                                                    <a class="s-fb--color-hover" href="#"><i class="fab fa-facebook-f"></i></a></li>
                                                <li>

                                                    <a class="s-tw--color-hover" href="#"><i class="fab fa-twitter"></i></a></li>
                                                <li>

                                                    <a class="s-insta--color-hover" href="#"><i class="fab fa-instagram"></i></a></li>
                                                <li>

                                                    <a class="s-wa--color-hover" href="#"><i class="fab fa-whatsapp"></i></a></li>
                                                <li>

                                                    <a class="s-gplus--color-hover" href="#"><i class="fab fa-google-plus-g"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="u-s-m-b-15">
                                            <form class="pd-detail__form">
                                                <div class="pd-detail-inline-2">
                                                    <div class="u-s-m-b-15">

                                                        <!--====== Input Counter ======-->
                                                        <div class="input-counter">

                                                            <span class="input-counter__minus fas fa-minus"></span>

                                                            <input class="input-counter__text input-counter--text-primary-style" type="text" value="1" data-min="1" data-max="1000">

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
        <script>
            function loadProducts(id) {
//                var anchors = document.querySelectorAll('.pagination a');
//                anchors.forEach(function (anchor) {
//                    anchor.classList.remove('active');
//                })
//                event.currentTarget.classList.add('active');
                fetch("${BASE_URL}GetProducts?id="+id)
                        .then(response => response.json())
                        .then(data => {
                            document.getElementById('products').innerHTML = data.content;
                            document.getElementById("links").innerHTML = data.links;
                        })
            }        
            
            function changeOrder(){
                var order = document.getElementById('order').value;
                console.log(order)
                fetch("${BASE_URL}GetProducts?id=0&order="+order)
                        .then(response => response.json())
                        .then(data => {
                            document.getElementById('products').innerHTML = data.content;
                            document.getElementById("links").innerHTML = data.links;
                        });
            }
            
            loadProducts(0);
        </script>
        <!--====== Noscript ======-->
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
    </body>
</html>
