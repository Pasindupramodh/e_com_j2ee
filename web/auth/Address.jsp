<%-- 
    Document   : Address.jsp
    Created on : Dec 20, 2023, 9:39:36 PM
    Author     : REDTECH
--%>

<%@page import="dto.AddressDTO"%>
<%@page import="dao.AddressDAO"%>
<%-- 
    Document   : manageOrder
    Created on : Dec 20, 2023, 4:34:01 PM
    Author     : REDTECH
--%>

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
                                                        <a  href="profile.jsp">My Profile</a></li>
                                                    <li>

                                                        <a class="dash-active" href="Address.jsp">Address Book</a></li>

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
                                    <div class="col-lg-9 col-md-12">
                                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                            <div class="dash__pad-2">
                                                <div class="dash__address-header">
                                                    <h1 class="dash__h1">Address Book</h1>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="dash__box dash__box--shadow dash__box--bg-white dash__box--radius u-s-m-b-30">
                                            <div class="dash__table-2-wrap gl-scroll">
                                                <table class="dash__table-2">
                                                    <thead>
                                                        <tr>
                                                            <th>Action</th>
                                                            <th>Full Name</th>
                                                            <th>Address</th>
                                                            <th>Phone Number</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            List<AddressDTO> addressDTOs = new AddressDAO().getAllAddressByCustomer(customer, null);
                                                            if (addressDTOs != null) {
                                                                for (AddressDTO addressDTO : addressDTOs) {
                                                        %>
                                                        <tr>
                                                            <td>

                                                                <a class="address-book-edit btn--e-transparent-platinum-b-2" href="EditAddress.jsp?id=<%= addressDTO.getId() %>">Edit</a></td>
                                                            <td><%= addressDTO.getFname()+" "+addressDTO.getLname() %></td>
                                                            <td><%= addressDTO.getAddressLine1()+" "+addressDTO.getAddressLine2()+" "+addressDTO.getCity().getName()+" "+addressDTO.getCity().getProvinceDTO().getName() %></td>
                                                            <td><%= addressDTO.getPhone() %></td>
                                                            <td>
                                                                <%
                                                                    if(addressDTO.getIsDefault()){
                                                                        %>
                                                                <div class="gl-text">Default Address</div>
                                                                <%
                                                                    }
                                                                %>
                                                                
                                                            </td>
                                                        </tr>
                                                        <%
                                                                }
                                                            }
                                                        %>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>

                                            <a class="dash__custom-link btn--e-brand-b-2" href="AddAddress.jsp"><i class="fas fa-plus u-s-m-r-8"></i>

                                                <span>Add New Address</span></a></div>
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