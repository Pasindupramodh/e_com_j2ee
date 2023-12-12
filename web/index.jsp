<%@page import="model.Brand"%>
<%@page import="dao.BrandDao"%>
<%@page import="model.Gallery"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
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
        <div class="preloader is-active">
            <div class="preloader__wrap">

                <img class="preloader__img" src="images/preloader.png" alt=""></div>
        </div>

        <!--====== Main App ======-->
        <div id="app">

            <%@include file="customerNavs/homeHeader.jsp" %>


            <!--====== App Content ======-->
            <div class="app-content">

                <!--====== Primary Slider ======-->
                <div class="s-skeleton s-skeleton--h-640 s-skeleton--bg-grey">
                    <div class="owl-carousel primary-style-3" id="hero-slider">
                        <div class="hero-slide hero-slide--7">
                            <div class="primary-style-3-wrap">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="slider-content slider-content--animation">

                                                <span class="content-span-1 u-c-white">Update Your Fashion</span>

                                                <span class="content-span-2 u-c-white">10% Discount on Outwear</span>

                                                <span class="content-span-3 u-c-white">Find outwear on best prices</span>

                                                <span class="content-span-4 u-c-white">Starting At

                                                    <span class="u-c-brand">$100.00</span></span>

                                                <a class="shop-now-link btn--e-brand" href="shop-side-version-2.html">SHOP NOW</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hero-slide hero-slide--8">
                            <div class="primary-style-3-wrap">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="slider-content slider-content--animation">

                                                <span class="content-span-1 u-c-white">Open Your Eyes</span>

                                                <span class="content-span-2 u-c-white">10% Off On Intimates</span>

                                                <span class="content-span-3 u-c-white">Find intimates on best prices</span>

                                                <span class="content-span-4 u-c-white">Starting At

                                                    <span class="u-c-brand">$100.00</span></span>

                                                <a class="shop-now-link btn--e-brand" href="shop-side-version-2.html">SHOP NOW</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hero-slide hero-slide--9">
                            <div class="primary-style-3-wrap">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="slider-content slider-content--animation">

                                                <span class="content-span-1 u-c-white">Find Top Brands</span>

                                                <span class="content-span-2 u-c-white">10% Off On Outwear</span>

                                                <span class="content-span-3 u-c-white">Find outwear on best prices</span>

                                                <span class="content-span-4 u-c-white">Starting At

                                                    <span class="u-c-brand">$100.00</span></span>

                                                <a class="shop-now-link btn--e-brand" href="shop-side-version-2.html">SHOP NOW</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Primary Slider ======-->


                <!--====== Section 1 ======-->
                <div class="u-s-p-y-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">
                                    <div class="promotion-o">
                                        <div class="aspect aspect--bg-grey aspect--square">

                                            <img class="aspect__img" src="images/home/laptop.jpg" alt=""></div>
                                        <div class="promotion-o__content">

                                            <a class="promotion-o__link btn--e-white-brand" href="shop-side-version-2.html">Laptops</a></div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">
                                    <div class="promotion-o">
                                        <div class="aspect aspect--bg-grey aspect--square">

                                            <img class="aspect__img" src="images/home/mobile.jpg" alt=""></div>
                                        <div class="promotion-o__content">

                                            <a class="promotion-o__link btn--e-white-brand" href="shop-side-version-2.html">Mobile Phones</a></div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 u-s-m-b-30">
                                    <div class="promotion-o">
                                        <div class="aspect aspect--bg-grey aspect--square">

                                            <img class="aspect__img" src="images/home/parts.jpg" alt=""></div>
                                        <div class="promotion-o__content">

                                            <a class="promotion-o__link btn--e-white-brand" href="shop-side-version-2.html">Computer Parts</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 1 ======-->


                <!--====== Section 2 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12" style="justify-content: center;align-items: center">

                                        <a class="i3-banner" >
                                            <div class="aspect aspect--bg-grey-fb aspect--square">

                                                <img class="aspect__img i3-banner__img" src="images/home/best_price.jpg" alt=""></div>
                                        </a>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="row">
                                            <%                                                ProductDAO productDAO = new ProductDAO();
                                                List<Product> products = productDAO.getAllPublished("discountPrice", 2);
                                                if (products != null) {
                                                    for (Product product : products) {
//                                                        response.getWriter().write("asas");
                                                        String imgPath = "";

                                                        for (Gallery gallery : product.getGalleries()) {
                                                            if (gallery.getThumbnail()) {
                                                                imgPath = gallery.getImgPath();
                                                                break;
                                                            }
                                                        }
                                                        String href = "product_detail_v.jsp?id=" + product.getId();
                                                        if (product.getAttributeVariants().isEmpty()) {
                                                            href = "product_detail.jsp?id=" + product.getId();
                                                        }

                                            %>
                                            <div class="col-lg-6 col-md-6 col-sm-6 u-s-m-b-30">
                                                <div class="product-short product-r u-h-100 ">
                                                    <div class="product-short__container">
                                                        <div class="product-short__img-wrap">

                                                            <a class="aspect aspect--bg-grey-fb aspect--square u-d-block" href="<%= href%>">

                                                                <img class="aspect__img product-short__img" src="<%= imgPath%>" alt=""></a></div>
                                                        <div class="product-short__info">

                                                            <span class="product-short__price" style="text-decoration: line-through;"><%= product.getProductPrice()%> LKR</span>
                                                            <span class="product-short__price" style="font-weight: 700;color: red"><%= product.getProductPrice() - product.getDiscountPrice()%> LKR</span>
                                                            <span class="product-short__name">

                                                                <a href="<%= href%>"><%= product.getProductName()%></a></span>

                                                            <span class="product-short__category">

                                                                <%= product.getBrand().getCategory().getCategoryName()%></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                    }
                                                }
                                            %>

                                            <div class="col-lg-12">
                                                <div class="load-more">

                                                    <button class="btn btn--e-brand" type="button">Load More</button></div>
                                            </div>
                                        </div>
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

                    <!--====== Section Intro ======-->
                    <div class="section__intro u-s-m-b-46">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section__text-wrap">
                                        <h1 class="section__heading u-c-secondary u-s-m-b-12">RECENT PRODUCTS</h1>

                                        <span class="section__span u-c-silver">NEWLY ADDED PRODUCTS</span>
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
                                <%
                                    List<Product> recentProducts = productDAO.getAllPublished("createdAt", 8);
                                    if (recentProducts != null) {
                                        for (Product product : recentProducts) {
//                                                        response.getWriter().write("asas");
                                            String imgPath = "";
                                            for (Gallery gallery : product.getGalleries()) {
                                                if (gallery.getThumbnail()) {
                                                    imgPath = gallery.getImgPath();
                                                    break;
                                                }
                                            }
                                            String href = "product_detail_v.jsp?id="+product.getId();
                                                        if(product.getAttributeVariants().isEmpty()){
                                                            href = "product_detail.jsp?id="+product.getId();
                                                        }
                                %>
                                <div class="col-lg-3 col-md-4 col-sm-6 u-s-m-b-30">
                                    <div class="product-r u-h-100">
                                        <div class="product-r__container">

                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="<%= href %>">

                                                <img class="aspect__img" src="<%= imgPath%>" alt="">
                                            </a>
                                            <div class="product-r__action-wrap">
                                                <ul class="product-r__action-list">
                                                    <li>

                                                        <a data-modal="modal" onclick="setDataToQuickLook('<%= imgPath%>', '<%= product.getProductName()%>',<%= product.getDiscountPrice()%>,<%= product.getProductPrice()%>,<%= product.getQty()%>, '<%= product.getShortDescription()%>')" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                    <li>

                                                        <a  onclick="setDataToAddToCart('<%= product.getId()%>', '<%= product.getProductName()%>', '<%= product.getProductPrice() - product.getDiscountPrice()%> ', '<%= imgPath%>')"><i class="fas fa-plus-circle"></i></a></li>
                                                    <li>

                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-r__info-wrap">

                                            <span class="product-r__category">

                                                <a href="shop-side-version-2.html"><%= product.getBrand().getCategory().getCategoryName()%></a></span>
                                            <span class="product-r__price"><%= product.getProductPrice() - product.getDiscountPrice()%> LKR</span>
                                            <div class="product-r__n-p-wrap">

                                                <span class="product-r__name">

                                                    <a href="<%= href %>"><%= product.getProductName()%></a></span>


                                            </div>

                                            <span class="product-r__description"><%= product.getShortDescription()%></span>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <div class="col-lg-12">
                                    <div class="load-more">

                                        <button class="btn btn--e-brand" type="button">Load More</button></div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 3 ======-->


                <!--====== Section 4
                <div class="u-s-p-b-60">

                 
                    <div class="section__intro u-s-m-b-16">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section__text-wrap">
                                        <h1 class="section__heading u-c-secondary u-s-m-b-12">ALL PRODUCT</h1>

                                        <span class="section__span u-c-silver u-s-m-b-16">FIND PRODUCTS</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    


                  
                    <div class="section__content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                                                        <div class="filter-category-container">
                                                                            <div class="filter__category-wrapper">
                                    
                                                                                <button class="btn filter__btn filter__btn--style-2 js-checked" type="button" data-filter="*">ALL</button></div>
                                                                            <div class="filter__category-wrapper">
                                    
                                                                                <button class="btn filter__btn filter__btn--style-2" type="button" data-filter=".outwear">OUTWEAR</button></div>
                                                                            <div class="filter__category-wrapper">
                                    
                                                                                <button class="btn filter__btn filter__btn--style-2" type="button" data-filter=".bottom">BOTTOM</button></div>
                                                                            <div class="filter__category-wrapper">
                                    
                                                                                <button class="btn filter__btn filter__btn--style-2" type="button" data-filter=".footwear">FOOTWEAR</button></div>
                                                                            <div class="filter__category-wrapper">
                                    
                                                                                <button class="btn filter__btn filter__btn--style-2" type="button" data-filter=".accessories">ACCESSORIES</button></div>
                                                                        </div>
                                    <div class="filter__grid-wrapper u-s-m-t-30">
                                        <div class="row">
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item outwear">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/men/product11.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Men Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Black &amp; White Sweater</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item outwear">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/women/product15.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Women Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Color Yellow Modest A Fashion</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item bottom">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/men/product2.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Men Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">White Full Men Underwear</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item bottom">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/women/product3.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Women Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Color Yellow Modest B Fashion</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item accessories">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/men/product3.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Men Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Blown Sunglasses For Deux</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item accessories">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/women/product4.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Women Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Ladies Black Bag</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item footwear">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/men/product13.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Men Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Casual Shoes Independence</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item footwear">
                                                <div class="product-bs">
                                                    <div class="product-bs__container">
                                                        <div class="product-bs__wrap">

                                                            <a class="aspect aspect--bg-grey aspect--square u-d-block" href="product-detail.html">

                                                                <img class="aspect__img" src="images/product/men/product14.jpg" alt=""></a>
                                                            <div class="product-bs__action-wrap">
                                                                <ul class="product-bs__action-list">
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#quick-look"><i class="fas fa-search-plus"></i></a></li>
                                                                    <li>

                                                                        <a data-modal="modal" data-modal-id="#add-to-cart"><i class="fas fa-plus-circle"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-heart"></i></a></li>
                                                                    <li>

                                                                        <a href="signin.html"><i class="fas fa-envelope"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <span class="product-bs__category">

                                                            <a href="shop-side-version-2.html">Men Clothing</a></span>

                                                        <span class="product-bs__name">

                                                            <a href="product-detail.html">Men Casual Shoes Charcoal</a></span>
                                                        <div class="product-bs__rating gl-rating-style"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>

                                                            <span class="product-bs__review">(23)</span></div>

                                                        <span class="product-bs__price">$125.00

                                                            <span class="product-bs__discount">$160.00</span></span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    
                </div>
                <!--====== End - Section 4 ======-->







                <!--====== Section 7 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">

                            <!--====== Brand Slider ======-->
                            <div class="slider-fouc">
                                <div class="owl-carousel" id="brand-slider" data-item="5">
                                    <%                                 
                                        BrandDao brandDao = new BrandDao();
                                        List<Brand> brands = brandDao.getAllBrands();
                                        if (brands != null) {
                                            for (Brand brand : brands) {
                                    %>
                                    <div class="brand-slide">

                                        <a href="shop-side-version-2.html">

                                            <img src="<%= brand.getBrandImage()%>" alt=""></a></div>
                                            <%
                                                    }
                                                }
                                            %>

                                </div>
                            </div>
                            <!--====== End - Brand Slider ======-->
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 7 ======-->
            </div>
            <!--====== End - App Content ======-->


            <%@include file="customerNavs/footer.jsp" %>

            <%@include file="common_use/cart_add.jsp" %>
            
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
            <!--====== End - Main App ======-->


            <%@include file="js.jsp" %>

            <%@include file="js/js.jsp" %>
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