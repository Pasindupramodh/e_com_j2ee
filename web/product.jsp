<%-- 
    Document   : product
    Created on : Dec 22, 2023, 9:38:34 AM
    Author     : REDTECH
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
                                            
                                        </div>
                                    </div>
                                    <div class="shop-p__collection">
                                        <div class="row is-grid-active" id="products" style="">

                                        </div>
                                    </div>
                                    <div class="u-s-p-y-60">

                                        <!--====== Pagination ======-->
                                        
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
            function loadProducts() {
                fetch("${BASE_URL}GetSearchProducts?brand=<%= request.getParameter("brand") %>&tag=<%= request.getParameter("tag") %>&category=<%= request.getParameter("category") %>")
                        .then(response => response.json())
                        .then(data => {
                            document.getElementById('products').innerHTML = data.content;
                        })
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
