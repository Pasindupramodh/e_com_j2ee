<%-- 
    Document   : header
    Created on : Nov 24, 2023, 1:41:11 AM
    Author     : pasin
--%>

<%@page import="dto.GalleryDTO"%>
<%@page import="dto.CartItemDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Brand"%>
<%@page import="model.Category"%>
<!--====== Main Header ======-->
<header class="header--style-1 header--box-shadow">

    <!--====== Nav 1 ======-->
    <nav class="primary-nav primary-nav-wrapper--border">
        <div class="container">

            <!--====== Primary Nav ======-->
            <div class="primary-nav">

                <!--====== Main Logo ======-->

                <a class="main-logo" href="index.jsp">

                    <img src="images/logo/logo-1.png" alt=""></a>
                <!--====== End - Main Logo ======-->


                <!--====== Search Form ======-->
                <form class="main-form">

                    <label for="main-search"></label>

                    <input class="input-text input-text--border-radius input-text--style-1" type="text" id="main-search" placeholder="Search">

                    <button class="btn btn--icon fas fa-search main-search-button" type="submit"></button></form>
                <!--====== End - Search Form ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation">

                    <button class="btn btn--icon toggle-button fas fa-cogs" type="button"></button>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">? Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                            <li class="has-dropdown" data-tooltip="tooltip" data-placement="left" title="Account">

                                <a><i class="far fa-user-circle"></i></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <ul style="width:120px">
                                    <%
                                        if (session.getAttribute("customer") == null) {
                                    %>
                                    <li>
                                        <a href="signup.jsp"><i class="fas fa-user-plus u-s-m-r-6"></i>
                                            <span>Signup</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="signin.jsp"><i class="fas fa-lock u-s-m-r-6"></i>
                                            <span>Signin</span>
                                        </a>
                                    </li>
                                    <%
                                    } else {
                                    %>
                                    <li>
                                        <a href="dashboard.html"><i class="fas fa-user-circle u-s-m-r-6"></i>
                                            <span>Account</span>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="signup.html"><i class="fas fa-lock-open u-s-m-r-6"></i>
                                            <span>Signout</span>
                                        </a>
                                    </li>
                                    <%
                                        }
                                    %>

                                </ul>
                                <!--====== End - Dropdown ======-->
                            </li>

                            <li data-tooltip="tooltip" data-placement="left" title="Contact">

                                <a href="tel:+94772618203"><i class="fas fa-phone-volume"></i></a></li>
                            <li data-tooltip="tooltip" data-placement="left" title="Mail">

                                <a href="mailto:contact@greentech.com"><i class="far fa-envelope"></i></a></li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->
            </div>
            <!--====== End - Primary Nav ======-->
        </div>
    </nav>
    <!--====== End - Nav 1 ======-->


    <!--====== Nav 2 ======-->
    <nav class="secondary-nav-wrapper">
        <div class="container">

            <!--====== Secondary Nav ======-->
            <div class="secondary-nav">

                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation1">

                    <button class="btn btn--icon toggle-mega-text toggle-button" type="button">M</button>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">? Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list">
                            <li class="has-dropdown">

                                <span class="mega-text">M</span>

                                <!--====== Mega Menu ======-->

                                <span class="js-menu-toggle"></span>
                                <div class="mega-menu" style="background-color: #EAF9E7;">
                                    <div class="mega-menu-wrap">
                                        <div class="mega-menu-list">
                                            <ul>
                                                <%
                                                    CategoryDAO categoryDAO = new CategoryDAO();
                                                    List<Category> categorys = categoryDAO.getAllActiveCategoriess();
                                                    if (categorys != null) {
                                                        int count = 0;
                                                        for (Category category : categorys) {
                                                            if (count == 0) {
                                                %>
                                                <li class="js-active">

                                                    <a href="shop-side-version-2.html"><i class="<%= category.getCategoryIcon()%> u-s-m-r-6"></i>

                                                        <span><%= category.getCategoryName()%></span></a>

                                                    <span class="js-menu-toggle js-toggle-mark"></span>
                                                </li>
                                                <%
                                                } else {
                                                %>
                                                <li>

                                                    <a href="shop-side-version-2.html"><i class="<%= category.getCategoryIcon()%> u-s-m-r-6"></i>

                                                        <span><%= category.getCategoryName()%></span></a>

                                                    <span class="js-menu-toggle"></span>
                                                </li>
                                                <%
                                                            }
                                                            count++;
                                                        }
                                                    }
                                                %>



                                            </ul>
                                        </div>

                                        <%
                                            if (categorys != null) {
                                                int count = 0;
                                                for (Category category : categorys) {
                                                    if (count == 0) {
                                        %>
                                        <!--====== Men ======-->
                                        <div class="mega-menu-content js-active">

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">

                                                <%
                                                    if (category.getBrands().isEmpty()) {
                                                %>
                                                <h5>No Categories</h5>
                                                <%
                                                } else {
                                                    for (Brand brand : category.getBrands()) {
                                                        if (brand.getIsActive()) {
                                                %>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img class="u-img-fluid u-d-block" src="<%= brand.getBrandImage()%>" alt=""></a></div>
                                                    <div class="col-lg-12">
                                                        <div class="load-more" style="color: #3d9970;font-weight: 600;"><%= brand.getBrandName()%> </div>
                                                    </div>
                                                </div>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>


                                            </div>

                                        </div>
                                        <!--====== End - Men ======-->
                                        <%
                                        } else {
                                        %>
                                        <div class="mega-menu-content">

                                            <!--====== Mega Menu Row ======-->
                                            <div class="row">

                                                <%
                                                    if (category.getBrands().isEmpty()) {
                                                %>
                                                <h5>No Categories</h5>
                                                <%
                                                } else {
                                                    for (Brand brand : category.getBrands()) {
                                                        if (brand.getIsActive()) {
                                                %>
                                                <div class="col-lg-4 mega-image">
                                                    <div class="mega-banner">

                                                        <a class="u-d-block" href="shop-side-version-2.html">

                                                            <img class="u-img-fluid u-d-block" src="<%= brand.getBrandImage()%>" alt=""></a></div>
                                                    <div class="col-lg-12">
                                                        <div class="load-more" style="color: #3d9970;font-weight: 600"><%= brand.getBrandName()%> </div>
                                                    </div>
                                                </div>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>


                                            </div>

                                        </div>
                                        <%
                                            }
                                            count++;

                                        %>

                                        <%                                                    }
                                            }
                                        %>





                                    </div>
                                </div>
                                <!--====== End - Mega Menu ======-->
                            </li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation2">

                    <button class="btn btn--icon toggle-button fas fa-cog" type="button"></button>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">? Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design2 ah-list--link-color-secondary">
                            <li>
                                <a href="products.jsp">All Products</a>
                            </li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->


                <!--====== Dropdown Main plugin ======-->
                <div class="menu-init" id="navigation3">

                    <button class="btn btn--icon toggle-button fas fa-shopping-bag toggle-button-shop" type="button"></button>

                    <span class="total-item-round">2</span>

                    <!--====== Menu ======-->
                    <div class="ah-lg-mode">

                        <span class="ah-close">? Close</span>

                        <!--====== List ======-->
                        <ul class="ah-list ah-list--design1 ah-list--link-color-secondary">
                            <li>

                                <a href="index.html"><i class="fas fa-home"></i></a></li>
                            <li>

                                <a href="wishlist.html"><i class="far fa-heart"></i></a></li>
                            <li class="has-dropdown">

                                <a class="mini-cart-shop-link"><i class="fas fa-shopping-bag"></i>
                                    <%
                                    CartDAO cartDAO = new CartDAO();
                                    CartDTO cartDTO = cartDAO.getCart(session);
                                    %>
                                    <span class="total-item-round">
                                        <%
                                                if (cartDTO == null || cartDTO.getCartItemDTOs() == null) {
                                            %>
                                            0
                                            <%
                                            } else {

                                            %>
                                            <%= cartDTO.getCartItemDTOs().size()%>
                                            <%
                                                }
                                            %>
                                    </span></a>

                                <!--====== Dropdown ======-->

                                <span class="js-menu-toggle"></span>
                                <%
                                        
                                    if (cartDTO != null) {
                                %>
                                <div class="mini-cart">

                                    <!--====== Mini Product Container ======-->
                                    <div class="mini-product-container gl-scroll u-s-m-b-15">

                                        <!--====== Card for mini cart ======-->
                                        <%
                                            if (!cartDTO.getCartItemDTOs().isEmpty()) {
                                                for (CartItemDTO cartItemDTO : cartDTO.getCartItemDTOs()) {
                                                    String href = "product_detail_v.jsp?id=" + cartItemDTO.getProductDTO().getId();
                                                    if (cartItemDTO.getProductDTO().getProductAttributes()!=null && cartItemDTO.getProductDTO().getProductAttributes().isEmpty()) {
                                                        href = "product_detail.jsp?id=" + cartItemDTO.getProductDTO().getId();
                                                    }
                                                    String image = "";
                                                    for(GalleryDTO galleryDTO : cartItemDTO.getProductDTO().getGalleries()){
                                                        if(galleryDTO.getThumbnail()){
                                                            image = galleryDTO.getImgPath();
                                                        }
                                                    }
                                        %>
                                        <div class="card-mini-product">
                                            <div class="mini-product">
                                                <div class="mini-product__image-wrapper">

                                                    <a class="mini-product__link" href="<%= href %>">

                                                        <img class="u-img-fluid" src="<%= image %>" alt=""></a></div>
                                                <div class="mini-product__info-wrapper">

                                                    <span class="mini-product__category">

                                                        <a href=""><%= cartItemDTO.getProductDTO().getBrand().getCategory().getCategoryName() %></a></span>

                                                    <span class="mini-product__name">

                                                        <a href="<%= href %>"><%= cartItemDTO.getProductDTO().getProductName() %></a></span>

                                                    <span class="mini-product__quantity"><%= cartItemDTO.getQty() %></span>

                                                    <span class="mini-product__price"><%= cartItemDTO.getTotal() %></span></div>
                                            </div>

                                            <button class="mini-product__delete-link far fa-trash-alt" type="button" onclick="deleteFromCart(<%= cartItemDTO.getId() %>)"></button>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>
                                        <!--====== End - Card for mini cart ======-->

                                    </div>
                                    <!--====== End - Mini Product Container ======-->


                                    <!--====== Mini Product Statistics ======-->
                                    <div class="mini-product-stat">
                                        <div class="mini-total">

                                            <span class="subtotal-text">SUBTOTAL</span>

                                            <span class="subtotal-value"><%= cartDTO.getTotal() - cartDTO.getDiscount() %></span></div>
                                        <div class="mini-action">

                                            <a class="mini-link btn--e-brand-b-2" href="auth/checkout.jsp?product=0">PROCEED TO CHECKOUT</a>

                                            <a class="mini-link btn--e-transparent-secondary-b-2" href="cart.jsp">VIEW CART</a></div>
                                    </div>
                                    <!--====== End - Mini Product Statistics ======-->
                                </div>
                                <%
                                    }
                                %>

                                <!--====== End - Dropdown ======-->
                            </li>
                        </ul>
                        <!--====== End - List ======-->
                    </div>
                    <!--====== End - Menu ======-->
                </div>
                <!--====== End - Dropdown Main plugin ======-->
            </div>
            <!--====== End - Secondary Nav ======-->
        </div>
    </nav>
    <!--====== End - Nav 2 ======-->
</header>
<!--====== End - Main Header ======-->