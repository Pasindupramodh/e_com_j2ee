<%-- 
    Document   : cart
    Created on : Dec 13, 2023, 12:31:17 AM
    Author     : REDTECH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="UTF-8">
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="images/favicon.png" rel="shortcut icon">
        <title>Ludus - Electronics, Apparel, Computers, Books, DVDs & more</title>

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
                <div class="u-s-p-y-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="breadcrumb">
                                <div class="breadcrumb__wrap">
                                    <ul class="breadcrumb__list">
                                        <li class="has-separator">

                                            <a href="index.html">Home</a></li>
                                        <li class="is-marked">

                                            <a href="cart.html">Cart</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section 1 ======-->


                <!--====== Section 2 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Intro ======-->
                    <div class="section__intro u-s-m-b-60">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section__text-wrap">
                                        <h1 class="section__heading u-c-secondary">SHOPPING CART</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Intro ======-->


                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                                    <div class="table-responsive">
                                        <table class="table-p">
                                            <tbody id="tBody">




                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="route-box">
                                        <div class="route-box__g1">

                                            <a class="route-box__link" href="products.jsp"><i class="fas fa-long-arrow-alt-left"></i>

                                                <span>CONTINUE SHOPPING</span></a></div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 2 ======-->


                <!--====== Section 3 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                                    <form class="f-cart">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                                <div class="f-cart__pad-box">

                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 u-s-m-b-30">

                                            </div>
                                            <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                                <div class="f-cart__pad-box">
                                                    <div class="u-s-m-b-30">
                                                        <table class="f-cart__table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>SHIPPING</td>
                                                                    <td>300 LKR</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Total</td>
                                                                    <td id="total">00.00 LKR</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Discount</td>
                                                                    <td id="discount">00.00 LKR</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>SUBTOTAL</td>
                                                                    <td id="sub-total">00.00 LKR</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>GRAND TOTAL</td>
                                                                    <td id="grand-total">00.00 LKR</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div>

                                                        <button class="btn btn--e-brand-b-2" type="submit"> PROCEED TO CHECKOUT</button></div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 3 ======-->
            </div>
            <!--====== End - App Content ======-->


            <%@include file="customerNavs/footer.jsp" %>
        </div>
        <!--====== End - Main App ======-->


        <table id="cart-items" style="display: none">
            <!--====== Row ======-->
            <tr>
                <td>
                    <div class="table-p__box">
                        <div class="table-p__img-wrap">

                            <img class="u-img-fluid" id="image" src="images/product/electronic/product3.jpg" alt=""></div>
                        <div class="table-p__info">

                            <span class="table-p__name">

                                <a href="product-detail.html" id="product-name">Yellow Wireless Headphone</a></span>

                            <span class="table-p__category">

                                <a href="shop-side-version-2.html" id="product-category">Electronics</a></span>
<!--                            <ul class="table-p__variant-list">
                                <li>

                                    <span>Size: 22</span></li>
                                <li>

                                    <span>Color: Red</span></li>
                            </ul>-->
                        </div>
                    </div>
                </td>
                <td>

                    <span class="table-p__price" id="product-price" >$125.00</span></td>
                <td>
                    <div class="table-p__input-counter-wrap">

                        <!--====== Input Counter ======-->
                        <div class="input-counter">

                            <span class="input-counter__minus fas fa-minus"></span>

                            <input class="input-counter__text input-counter--text-primary-style" type="text" value="1" data-min="1" data-max="1000">

                            <span class="input-counter__plus fas fa-plus"></span></div>
                        <!--====== End - Input Counter ======-->
                    </div>
                </td>
                <td>
                    <div class="table-p__del-wrap">

                        <a class="far fa-trash-alt table-p__delete-link" href="#"></a></div>
                </td>
            </tr>
            <!--====== End - Row ======-->
        </table>

        <!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
        <%@include file="js.jsp" %>

        <script>
            function loadToCart() {
                fetch("${BASE_URL}/Cart")
                        .then(response => response.json())
                        .then(data => {

                            if (!data.isEmpty) {
                                var cartData = data.data;
                                let total = document.getElementById('total');
                                let discount = document.getElementById('discount');
                                let subTotal = document.getElementById('sub-total');
                                let grandTotal = document.getElementById('grand-total');

                                total.innerHTML = cartData.total + ' LKR';
                                discount.innerHTML = cartData.discount + ' LKR';
                                subTotal.innerHTML = (cartData.total - cartData.discount) + ' LKR';
                                grandTotal.innerHTML = ((cartData.total - cartData.discount) + 300) + ' LKR';
                                
                                let tbody = document.getElementById('tBody');
                                let tableContent = document.getElementById('cart-items');
                                let image = document.getElementById('image');
                                let productName = document.getElementById('product-name');
                                let productCategory = document.getElementById('product-category');
                                let productPrice = document.getElementById('product-price');
                                cartData.cartItemDTOs
                                        .forEach(cartItem => {
                                            let product = cartItem.productDTO;
                                             console.log(cartItem);
                                            product.galleries.forEach(gallery=>{
                                               if(gallery.thumbnail){
                                                   image.setAttribute("src",gallery.imgPath);
                                               }
                                            });
                                            productName.innerHTML = product.productName;
                                            productCategory.innerHTML = product.brand.category.categoryName;
                                            productPrice.innerHTML = cartItem.total+' LKR';

                                            console.log(product.productName)
                                            tbody.innerHTML += tableContent.innerHTML;
                                           
                                        });



                            }


                        });

            }
            loadToCart();
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