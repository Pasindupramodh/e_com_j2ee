<%-- 
    Document   : manageOrder
    Created on : Dec 20, 2023, 4:34:01 PM
    Author     : REDTECH
--%>

<%@page import="dto.AddressDTO"%>
<%@page import="dto.OrderItemDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : profile
    Created on : Dec 20, 2023, 2:01:33 PM
    Author     : REDTECH
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="dto.CusLoginDTO"%>
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

                                            <a href="dash-my-profile.html">My Account</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section 1 ======-->


                <!--====== Section 2 ======-->
                <div class="u-s-p-b-60">

                    <%                    CusLoginDTO cusLoginDTO = (CusLoginDTO) session.getAttribute("customer");
                        Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());
                    %>
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
                                                        <a class="dash-active" href="profile.jsp">My Profile</a></li>
                                                    <li>

                                                        <a href="Address.jsp">Address Book</a></li>

                                                    <li>

                                                        <a href="orders.jsp">My Orders</a></li>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="dash__box dash__box--bg-white dash__box--shadow dash__box--w">
                                            <div class="dash__pad-1">

                                            </div>
                                        </div>
                                        <!--====== End - Dashboard Features ======-->
                                    </div>
                                    <%
                                        try {
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            OrderItemDTO orderItemDTO = new OrderDAO().getOrderByIdAndCustomer(id, customer);
                                            if (orderItemDTO != null) {
                                    %>
                                    <div class="col-lg-9 col-md-12">
                                        <h1 class="dash__h1 u-s-m-b-30">Order Details</h1>
                                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                            <div class="dash__pad-2">
                                                <div class="dash-l-r">
                                                    <div>
                                                        <div class="manage-o__text-2 u-c-secondary">Order <%= orderItemDTO.getOrder().getOrderId()%></div>
                                                        <div class="manage-o__text u-c-silver">Placed on <%= orderItemDTO.getOrder().getOrderDate()%></div>
                                                    </div>
                                                    <div>
                                                        <div class="manage-o__text-2 u-c-silver">Total:

                                                            <span class="manage-o__text-2 u-c-secondary"><%= (orderItemDTO.getUnitprice() * orderItemDTO.getQty()) - orderItemDTO.getTotaldiscount()%> LKR</span></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                            <div class="dash__pad-2">
                                                <div class="manage-o">
                                                    <div class="manage-o__header u-s-m-b-30">
                                                        <div class="manage-o__icon"><i class="fas fa-box u-s-m-r-5"></i>

                                                            <span class="manage-o__text">Package 1</span></div>
                                                    </div>
                                                    <div class="dash-l-r">
                                                        <%
                                                            if (orderItemDTO.getOrder().getLastStatus().equals("Delivered")) {
                                                        %>
                                                        <div class="manage-o__text u-c-secondary">Delivered on <%= orderItemDTO.getOrder().getOrderStatus().get(orderItemDTO.getOrder().getOrderStatus().size() - 1).getDate()%></div>

                                                        <%
                                                            }
                                                        %>
                                                        <div class="manage-o__icon"><i class="fas fa-truck u-s-m-r-5"></i>

                                                            <span class="manage-o__text">Standard</span></div>
                                                    </div>
                                                    <div class="manage-o__timeline">
                                                        <div class="timeline-row">
                                                            <div class="col-lg-3 u-s-m-b-30">
                                                                <div class="timeline-step">
                                                                    <div class="timeline-l-i timeline-l-i--finish">

                                                                        <span class="timeline-circle"></span></div>

                                                                    <span class="timeline-text">Pending</span>
                                                                </div>
                                                            </div>
                                                            <%
                                                                if (orderItemDTO.getOrder().getLastStatus().equals("Rejected")) {
                                                            %>
                                                            <div class="col-lg-3 u-s-m-b-30">
                                                                <div class="timeline-step">
                                                                    <div class="timeline-l-i timeline-l-i--finish">

                                                                        <span class="timeline-circle"></span></div>

                                                                    <span class="timeline-text">Rejected</span>
                                                                </div>
                                                            </div>
                                                            <%
                                                            } else {
                                                                int size = orderItemDTO.getOrder().getOrderStatus().size();
                                                                String confirm = "";
                                                                String outfor = "";
                                                                String delivered = "";
                                                                if (size >= 2) {
                                                                    confirm = "timeline-l-i--finish";
                                                                }
                                                                if (size >= 3) {
                                                                    outfor = "timeline-l-i--finish";
                                                                }
                                                                if (size >= 4) {
                                                                    delivered = "timeline-l-i--finish";
                                                                }
                                                            %>
                                                            <div class="col-lg-3 u-s-m-b-30">
                                                                <div class="timeline-step">
                                                                    <div class="timeline-l-i <%= confirm%>">

                                                                        <span class="timeline-circle"></span></div>

                                                                    <span class="timeline-text">Confirmed</span>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 u-s-m-b-30">
                                                                <div class="timeline-step">
                                                                    <div class="timeline-l-i <%= outfor%>">

                                                                        <span class="timeline-circle"></span></div>

                                                                    <span class="timeline-text">Out For Delivery</span>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 u-s-m-b-30">
                                                                <div class="timeline-step">
                                                                    <div class="timeline-l-i <%= delivered%>">

                                                                        <span class="timeline-circle"></span></div>

                                                                    <span class="timeline-text">Delivered</span>
                                                                </div>
                                                            </div>
                                                            <%
                                                                }
                                                            %>

                                                        </div>
                                                    </div>
                                                    <div class="manage-o__description">
                                                        <div class="description__container">
                                                            <div class="description__img-wrap">

                                                                <img class="u-img-fluid" src="<%= orderItemDTO.getProduct().getGalleries().get(0).getImgPath() %>" alt=""></div>
                                                            <div class="description-title"><%= orderItemDTO.getProduct().getProductName() %></div>
                                                        </div>
                                                        <div class="description__info-wrap">
                                                            <div>

                                                                <span class="manage-o__text-2 u-c-silver">Quantity:

                                                                    <span class="manage-o__text-2 u-c-secondary"><%= orderItemDTO.getQty() %></span></span></div>
                                                            <div>

                                                                <span class="manage-o__text-2 u-c-silver">Total:

                                                                    <span class="manage-o__text-2 u-c-secondary"><%= (orderItemDTO.getUnitprice() * orderItemDTO.getQty()) - orderItemDTO.getTotaldiscount()%> LKR</span></span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30">
                                                    <div class="dash__pad-3">
                                                        <% 
                                                        AddressDTO addressDTO = orderItemDTO.getOrder().getAddresss();
                                                        %>
                                                        <h2 class="dash__h2 u-s-m-b-8">Shipping & Billing Address</h2>
                                                        <h2 class="dash__h2 u-s-m-b-8"><%= addressDTO.getFname()+" " + addressDTO.getLname() %></h2>

                                                        <span class="dash__text-2"><%= addressDTO.getAddressLine1()+" "+addressDTO.getAddressLine2()+" "+addressDTO.getCity().getName()+" "+addressDTO.getCity().getProvinceDTO().getName() %></span>

                                                        <span class="dash__text-2"><%= addressDTO.getPhone() %></span>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="col-lg-6">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                    } else {
                                    %>
                                    <script>
                                        window.location.href = '${BASE_URL}auth/orders.jsp'
                                    </script>
                                    <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    %>
                                    <script>
                                        window.location.href = '${BASE_URL}auth/orders.jsp'
                                    </script>
                                    <%
                                        }

                                    %>

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
            <!--====== Modal Section ======-->




            <!--====== Unsubscribe or Subscribe Newsletter ======-->
            <!--====== End - Modal Section ======-->
        </div>
        <!--====== End - Main App ======-->


        <!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
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