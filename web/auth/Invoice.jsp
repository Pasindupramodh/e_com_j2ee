<%-- 
    Document   : Invoice
    Created on : Dec 21, 2023, 6:55:03 PM
    Author     : REDTECH
--%>

<%@page import="dto.OrderItemDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page import="dto.CusLoginDTO"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>GreenTech</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${BASE_URL}/admin/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${BASE_URL}/admin/dist/css/adminlte.min.css">
    </head>
    <body>
        <div class="wrapper">
            <!-- Main content -->
            <%

                try {
                    CusLoginDTO cusLoginDTO = (CusLoginDTO) session.getAttribute("customer");
                    Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());
                    String id = request.getParameter("id");
                    OrderDTO orderDTO = new OrderDAO().getOrderDtoByCusomerAndId(customer, id);

                    if (orderDTO == null) {
            %>
            <script>
                Window.location.href = '${BASE_URL}';
            </script>
            <%
            } else {
            %>

            <section class="invoice">
                <!-- title row -->
                <div class="row">
                    <div class="col-12">
                        <h2 class="page-header">
                            <i class="fas fa-globe"></i> GreenTech.
                            <small class="float-right" id="date"></small>
                        </h2>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        From
                        <address>
                            <strong>GreenTech.</strong><br>
                            250 Yakkala, Gampaha<br>
                            Sri Lanka<br>
                            Phone: (+94) 77 899 36 30<br>
                            Email: contact@greentech.com
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                        To
                        <address>
                            <strong><%= orderDTO.getAddresss().getFname() + " " + orderDTO.getAddresss().getLname()%></strong><br>
                            <%= orderDTO.getAddresss().getAddressLine1() + " " + orderDTO.getAddresss().getAddressLine2() + " " + orderDTO.getAddresss().getCity().getName() + ", " + orderDTO.getAddresss().getCity().getProvinceDTO().getName()%><br>
                            Sri Lanka<br>
                            Phone: <%= orderDTO.getAddresss().getPhone()%><br>
                            Email: <%= orderDTO.getCustomer().getEmail()%>
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">

                        <br>
                        <b>Order ID :</b> <%= orderDTO.getOrderId()%><br>
                        <b>Payment date :</b> <%= orderDTO.getOrderDate()%><br>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Unit Price</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                    <th>Discount</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (OrderItemDTO itemDTO : orderDTO.getOrderItems()) {
                                %>
                                <tr>
                                    <td><%= itemDTO.getProduct().getProductName() %></td>
                                    <td><%= itemDTO.getUnitprice() %> LKR</td>
                                    <td><%= itemDTO.getQty() %></td>
                                    <td><%= itemDTO.getUnitprice()*itemDTO.getQty() %> LKR</td>
                                    <td><%= itemDTO.getTotaldiscount() %> LKR</td>
                                    <td><%=  (itemDTO.getUnitprice()*itemDTO.getQty()) - itemDTO.getTotaldiscount() %> LKR</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-6">
                        <p class="lead">Payment Methods:</p>
                        <img src="${BASE_URL}/admin/dist/img/credit/visa.png" alt="Visa">
                        <img src="${BASE_URL}/admin/dist/img/credit/mastercard.png" alt="Mastercard">
                        <img src="${BASE_URL}/admin/dist/img/credit/american-express.png" alt="American Express">
                        <img src="${BASE_URL}/admin/dist/img/credit/paypal2.png" alt="Paypal">

                        <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">

                        </p>
                    </div>
                    <!-- /.col -->
                    <div class="col-6">

                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width:50%">Subtotal:</th>
                                    <td><%= orderDTO.getTotal() %> LKR</td>
                                </tr>
                                <tr>
                                    <th>Shipping:</th>
                                    <td>300 LKR</td>
                                </tr>
                                <tr>
                                    <th>Total:</th>
                                    <td><%= (orderDTO.getTotal())+300 %> LKR</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->
            <%
                }

            } catch (Exception e) {
            %>
            <script>
                Window.location.href = '${BASE_URL}';
            </script>
            <%
                }
            %>
        </div>
        <!-- ./wrapper -->
        <!-- Page specific script -->
        <script>
            window.addEventListener("load", window.print());
            var todayDate = new Date().toISOString().slice(0, 10);
            document.getElementById('date').innerHTML = 'Date : ' + todayDate;
//            window.history.pushState({page: 1}, "", "");

            window.onpopstate = function (event) {
                window.location.href = 'https://www.google.com/';
                // Code to handle back button or prevent from navigation
            }
        </script>
    </body>
</html>
