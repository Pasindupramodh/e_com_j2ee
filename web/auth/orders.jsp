<%-- 
    Document   : orders
    Created on : Dec 20, 2023, 2:06:29 PM
    Author     : REDTECH
--%>

<%@page import="dto.ProductDTO"%>
<%@page import="dto.OrderItemDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Gallery"%>
<%@page import="model.Product"%>
<%@page import="model.OrderItem"%>
<%@page import="model.Order"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page import="dto.CusLoginDTO"%>
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
        <title>GreenTech</title>

        <!--====== Google Font ======-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800" rel="stylesheet">

        <%@include file="../css.jsp" %>
    </head>
    <body class="config">
        <div class="preloader is-active">
            <div class="preloader__wrap">

                <img class="preloader__img" src="images/preloader.png" alt=""></div>
        </div>

        <!--====== Main App ======-->
        <div id="app">

            <!--====== Main Header ======-->
            <%@include file="../customerNavs/header.jsp" %>
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

                                            <a href="dash-my-order.html">My Account</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section 1 ======-->

                <%    CusLoginDTO cusLoginDTO = (CusLoginDTO) session.getAttribute("customer");
                    Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());
                %>
                <!--====== Section 2 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="dash">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-12">

                                        <!--====== Dashboard Features ======-->
                                        <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30">
                                            <div class="dash__pad-1">

                                                <span class="dash__text u-s-m-b-16">Hello, <%= customer.getFname() + " " + customer.getLname()%></span>
                                                <ul class="dash__f-list">
                                                    <li>
                                                        <a  href="profile.jsp">My Profile</a></li>
                                                    <li>

                                                        <a href="Address.jsp">Address Book</a></li>

                                                    <li>

                                                        <a class="dash-active" href="orders.jsp">My Orders</a></li>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="dash__box dash__box--bg-white dash__box--shadow dash__box--w">
                                            <div class="dash__pad-1">

                                            </div>
                                        </div>
                                        <!--====== End - Dashboard Features ======-->
                                    </div>
                                    <div class="col-lg-9 col-md-12">
                                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                            <div class="dash__pad-2">
                                                <h1 class="dash__h1 u-s-m-b-14">My Orders</h1>

                                                <span class="dash__text u-s-m-b-30">Here you can see all products that have been Ordered.</span>

                                                <div class="m-order__list">
                                                    <%
                                                        List<OrderDTO> orderDTOs = new OrderDAO().getOrdersByCustomer(customer);
                                                        for (OrderDTO order : orderDTOs) {


                                                    %>
                                                    <div class="m-order__get">
                                                        <div class="manage-o__header u-s-m-b-30">
                                                            <div class="dash-l-r">
                                                                <div>
                                                                    <div class="manage-o__text-2 u-c-secondary">Order id : <%= order.getOrderId()%>&emsp; 

                                                                    </div>
                                                                    <div class="manage-o__text u-c-silver">Placed on <%= order.getOrderDate()%></div>
                                                                </div>
                                                                <div>
                                                                    <div class="dash__link dash__link--brand">
                                                                        <a target="_blank" rel="noopener noreferrer"  href="Invoice.jsp?id=<%= order.getOrderId()%>"> <i class="fas fa-print"></i>  Invoice</a>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <%
                                                            for (OrderItemDTO orderItem : order.getOrderItems()) {
                                                                ProductDTO product = orderItem.getProduct();

                                                                String img = "";

                                                                for (GalleryDTO gallery : product.getGalleries()) {
                                                                    if (gallery.getThumbnail()) {
                                                                        img = gallery.getImgPath();
                                                                    }
                                                                }
                                                        %>

                                                        <div class="dash__link dash__link--brand" style="background-color:rgba(0,0,0,0.05);padding: 5px;">

                                                            <a href="manageOrder.jsp?id=<%= orderItem.getId()%>">MANAGE</a></div>
                                                            <div class="manage-o__description " style="background-color:rgba(0,0,0,0.05);padding: 5px;">

                                                            <div class="description__container">
                                                                <div class="description__img-wrap">

                                                                    <img class="u-img-fluid" src="<%= img%>" alt=""></div>
                                                                <div class="description-title"><%= product.getProductName()%></div>
                                                            </div>
                                                            <div class="description__info-wrap">
                                                                <div>
                                                                    <%
                                                                        String badge = "";
                                                                        if (order.getLastStatus().equals("Delivered")) {
                                                                            badge = "badge--warning";
                                                                        } else if (order.getLastStatus().equals("Pending") || order.getLastStatus().equals("Confirmed")) {
                                                                            badge = "badge--shipped";
                                                                        } else if (order.getLastStatus().equals("Out For Delivery")) {
                                                                            badge = "badge--processing";
                                                                        } else if (order.getLastStatus().equals("Rejected")) {
                                                                            badge = "badge--delivered";
                                                                        }
                                                                    %>
                                                                    <span class="manage-o__badge <%= badge%>"><%= order.getLastStatus()%></span></div>
                                                                <div>

                                                                    <span class="manage-o__text-2 u-c-silver">Quantity:

                                                                        <span class="manage-o__text-2 u-c-secondary"><%= orderItem.getQty()%></span></span></div>
                                                                <div>

                                                                    <span class="manage-o__text-2 u-c-silver">Total:

                                                                        <span class="manage-o__text-2 u-c-secondary"><%= (orderItem.getUnitprice() * orderItem.getQty()) - (orderItem.getTotaldiscount())%> LKR</span></span></div>
                                                            </div>
                                                        </div>
                                                    
                                                    <%
                                                            }
%>
                                                    </div>
                                                        <%
                                                        }
                                                    %>

                                                </div>
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
            </div>
            <!--====== End - App Content ======-->


            <!--====== Main Footer ======-->
            <%@include file="../customerNavs/footer.jsp" %>
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
        <script src="https://www.google-analytics.com/analytics.js" async defer></script>
        <%@include file="../js.jsp" %>

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