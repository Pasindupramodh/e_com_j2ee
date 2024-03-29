<%-- 
    Document   : checkout
    Created on : Dec 14, 2023, 9:07:47 AM
    Author     : REDTECH
--%>

<%@page import="model.Province"%>
<%@page import="dao.ProvinceDAO"%>
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

                                            <a href="checkout.html">Checkout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====== End - Section 1 ======-->




                <!--====== Section 3 ======-->
                <div class="u-s-p-b-60">

                    <!--====== Section Content ======-->
                    <div class="section__content">
                        <div class="container">
                            <div class="checkout-f">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h1 class="checkout-f__h1">DELIVERY INFORMATION</h1>
                                        <form class="checkout-f__delivery" id="address-form">
                                            <div class="u-s-m-b-30">


                                                <!--====== First Name, Last Name ======-->
                                                <div class="gl-inline">
                                                    <div class="u-s-m-b-15">

                                                        <label class="gl-label" for="fname">FIRST NAME *</label>

                                                        <input class="input-text input-text--primary-style" type="text" name="fname" id="fname" data-bill=""></div>
                                                    <div class="u-s-m-b-15">

                                                        <label class="gl-label" for="billing-lname">LAST NAME *</label>

                                                        <input class="input-text input-text--primary-style" type="text" name="lname" id="lname" data-bill=""></div>
                                                </div>
                                                <!--====== End - First Name, Last Name ======-->

                                                <!--====== PHONE ======-->
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="billing-phone">PHONE *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="phone" name="phone" data-bill=""></div>
                                                <!--====== End - PHONE ======-->


                                                <!--====== Street Address ======-->
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="billing-street">STREET ADDRESS *</label>

                                                    <input class="input-text input-text--primary-style" type="text" id="street" name="street" placeholder="House name and street name" data-bill=""></div>
                                                <div class="u-s-m-b-15">

                                                    <label for="billing-street-optional"></label>

                                                    <input class="input-text input-text--primary-style" type="text" id="street-optional" name="street-optional" placeholder="Apartment, suite unit etc. (optional)" data-bill=""></div>
                                                <!--====== End - Street Address ======-->

                                                <!--====== STATE/PROVINCE ======-->
                                                <div class="u-s-m-b-15">

                                                    <!--====== Select Box ======-->

                                                    <label class="gl-label" for="billing-state">STATE/PROVINCE *</label>
                                                    <select class="select-box select-box--primary-style" id="state" name="state" data-bill="">
                                                        <option selected value="0">Choose State/Province</option>
                                                        <%                                                            ProvinceDAO provinceDAO = new ProvinceDAO();
                                                            List<Province> provinces = provinceDAO.getAllProvinces();
                                                            for (Province province : provinces) {
                                                        %>
                                                        <option value="<%= province.getId()%>"><%= province.getName()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                    <!--====== End - Select Box ======-->
                                                </div>
                                                <!--====== End - STATE/PROVINCE ======-->

                                                <!--====== Town / City ======-->
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="billing-town-city">TOWN/CITY *</label>
                                                    <select class="select-box select-box--primary-style" id="city" name="city" data-bill="">
                                                        <option selected value="0">Choose State/Province First</option>
                                                    </select>
                                                </div>
                                                <!--====== End - Town / City ======-->

                                                <!--====== ZIP/POSTAL ======-->
                                                <div class="u-s-m-b-15">

                                                    <label class="gl-label" for="billing-zip">ZIP/POSTAL CODE *</label>

                                                    <input class="input-text input-text--primary-style" type="text" name="zip" id="zip" placeholder="Zip/Postal Code" data-bill="">
                                                </div>
                                                <!--====== End - ZIP/POSTAL ======-->
                                                <div class="u-s-m-b-10">

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="default-address" value="default" data-bill="">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="make-default-address">Make default shipping and billing address</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->
                                                </div>

                                                <div>

                                                    <button class="btn btn--e-transparent-brand-b-2" type="submit">SAVE</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-lg-6">
                                        <h1 class="checkout-f__h1">ORDER SUMMARY</h1>

                                        <!--====== Order Summary ======-->
                                        <div class="o-summary">
                                            <div class="o-summary__section u-s-m-b-30">
                                                <div class="o-summary__item-wrap gl-scroll" id="order-summary">

                                                </div>
                                            </div>
                                            <div class="o-summary__section u-s-m-b-30">
                                                <div class="o-summary__box">
                                                    <h1 class="checkout-f__h1">DELIVERY ADDRESS</h1>
                                                    <div class="ship-b">
                                                        <span class="ship-b__text">Ship to:</span>
                                                        <div class="ship-b__box u-s-m-b-10">
                                                            <p class="ship-b__p" id="address" >Set an address first.</p>
                                                            <input type="hidden" value="" id="address-id" />
                                                            <input type="hidden" id="product-qty" value="<%= request.getParameter("qty")%>" />
                                                            <input type="hidden" id="product-id" value="<%= request.getParameter("product")%>" />
                                                            <a class="ship-b__edit btn--e-transparent-platinum-b-2" data-modal="modal" data-modal-id="#edit-ship-address">Edit</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="o-summary__section u-s-m-b-30">
                                                <div class="o-summary__box">
                                                    <table class="o-summary__table">
                                                        <tbody>
                                                            <tr>
                                                                <td>SHIPPING</td>
                                                                <td>300 LKR</td>
                                                            </tr>
                                                            <tr>
                                                                <td>TOTAL</td>
                                                                <td id="total">00.00 LKR</td>
                                                            </tr>
                                                            <tr>
                                                                <td>DISCOUNT</td>
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
                                            </div>
                                            <div class="o-summary__section u-s-m-b-30">
                                                <div class="o-summary__box">
                                                    <h1 class="checkout-f__h1">PAYMENT INFORMATION</h1>
                                                    <form class="checkout-f__payment">

                                                        <div>

                                                            <button class="btn btn--e-brand-b-2" type="button" id="pay-now">PLACE ORDER</button></div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!--====== End - Order Summary ======-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--====== End - Section Content ======-->
                </div>
                <!--====== End - Section 3 ======-->
            </div>
            <!--====== End - App Content ======-->


            <!--====== Main Footer ======-->
            <%@include file="../customerNavs/footer.jsp" %>
            <!--====== Modal Section ======-->


            <!--====== Shipping Address Add Modal ======-->
            <div class="modal fade" id="edit-ship-address">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="checkout-modal2">
                                <div class="u-s-m-b-30">
                                    <div class="dash-l-r">
                                        <h1 class="gl-modal-h1">Shipping Address</h1>

                                    </div>
                                </div>
                                <form class="checkout-modal2__form">
                                    <div class="dash__table-2-wrap u-s-m-b-30 gl-scroll">
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
                                            <tbody id="address-table-body">

                                                <tr>
                                                    <td>

                                                        <!--====== Radio Box ======-->
                                                        <div class="radio-box">

                                                            <input type="radio" id="address-2" name="default-address">
                                                            <div class="radio-box__state radio-box__state--primary">

                                                                <label class="radio-box__label" for="address-2"></label></div>
                                                        </div>
                                                        <!--====== End - Radio Box ======-->
                                                    </td>
                                                    <td>Doe John</td>
                                                    <td>1484 Abner Road</td>
                                                    <td>Eau Claire WI - Wisconsin</td>
                                                    <td>(+0) 7154419563</td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="gl-modal-btn-group">

                                        <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Shipping Address Add Modal ======-->

            <!--====== End - Modal Section ======-->
        </div>
        <!--====== End - Main App ======-->
        <table id="addtess-table-row" style="display: none">
            <tr>
                <td>

                    <!--====== Radio Box ======-->
                    <div class="radio-box">

                        <input type="radio" id="address-1" name="default-address" checked="">
                        <div class="radio-box__state radio-box__state--primary">

                            <label class="radio-box__label" for="address-1"></label></div>
                    </div>
                    <!--====== End - Radio Box ======-->
                </td>
                <td>John Doe</td>
                <td>4247 Ashford Drive Virginia VA-20006 USA</td>
                <td>Virginia VA-20006 USA</td>
                <td>(+0) 900901904</td>
                <td>
                    <div class="gl-text">Default Shipping Address</div>
                    <div class="gl-text">Default Billing Address</div>
                </td>
            </tr>
        </table>

        <div id="checkout_item" style="display: none" >
            <div class="o-card">
                <div class="o-card__flex">
                    <div class="o-card__img-wrap">
                        <img class="u-img-fluid" id="image" src="images/product/electronic/product3.jpg" alt="">
                    </div>
                    <div class="o-card__info-wrap">
                        <span class="o-card__name">
                            <a href="product-detail.html" id="product-name">Yellow Wireless Headphone</a>
                        </span>
                        <span class="o-card__quantity qty"> 1</span>

                        <span class="o-card__price product-price">00.00</span>
                    </div>
                </div>
                <a class="o-card__del far fa-trash-alt" id="delete"></a>
            </div>
        </div>

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
        <%@include file="../js/js.jsp" %>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>

            document.getElementById('pay-now').addEventListener('click', () => {
                let productId = document.getElementById('product-id').value;
                let addressId = document.getElementById('address-id').value;
                var productQTY = document.getElementById('product-qty').value;
                if (productId === null || productId === '') {
                    Swal.fire({
                        title: 'Something Went Wrong',
                        showDenyButton: false,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        icon: 'error'
                    }).then((result) => {
                    });
                } else if (addressId === null || addressId === '') {
                    Swal.fire({
                        title: 'Add an address',
                        showDenyButton: false,
                        showCancelButton: false,
                        confirmButtonText: 'OK',
                        icon: 'error'
                    }).then((result) => {
                    });
                } else {
                    $.ajax({
                        type: 'POST',
                        url: '${BASE_URL}auth/Order',
                        data: {
                            product: productId,
                            address: addressId,
                            productQTY: productQTY
                        },
                        success: function (data) {
                            data = JSON.parse(data);
                            console.log(data);
                            if (data.message === "Success") {
                                var options = {
                                    "key": 'rzp_test_n8CzHm5PubcRlA', // Enter the Key ID generated from the Dashboard
                                    "amount": data.order.map.amount, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                                    "currency": data.order.map.currency,
                                    "name": "GREENTECH",
                                    "description": "Test Transaction",
                                    "image": "${BASE_URL}images/logo/logo-1.png",
                                    "order_id": data.order.map.id, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                                    "handler": function (response) {

                                        $.ajax({
                                            type: 'POST',
                                            url: '${BASE_URL}auth/Payment',
                                            data: {
                                                orderId: response.razorpay_order_id,
                                                paymentId: response.razorpay_payment_id,
                                                productId: productId,
                                                addressId: addressId,
                                                paymentStatus: 'success',
                                                productQTY: productQTY
                                            },
                                            success: function (data) {
                                                if (data == "Success") {
                                                    Swal.fire({
                                                        title: "Pyment Success",
                                                        showDenyButton: false,
                                                        showCancelButton: false,
                                                        confirmButtonText: 'OK',
                                                        icon: 'success'
                                                    }).then((result) => {
                                                        window.location.href = ${BASE_URL};
                                                    });
                                                } else {
                                                    Swal.fire({
                                                        title: data,
                                                        showDenyButton: false,
                                                        showCancelButton: false,
                                                        confirmButtonText: 'OK',
                                                        icon: 'error'
                                                    }).then((result) => {
                                                        window.location.href = ${BASE_URL};
                                                    });
                                                }
                                            },
                                            error: function () {
                                                Swal.fire({
                                                    title: 'Something went wrong',
                                                    showDenyButton: false,
                                                    showCancelButton: false,
                                                    confirmButtonText: 'OK',
                                                    icon: 'error'
                                                }).then((result) => {
                                                });
                                            }
                                        })
                                    },
                                    "prefill": {
                                        "name": data.address.fname + ' ' + data.address.lname,
                                        "email": data.email,
                                        "contact": data.address.phone
                                    },
                                    "notes": {
                                        "address": '' + data.address.addressLine1 + ' ' + data.address.addressLine2 + ' ' + data.address.city.name + ' ' + data.address.city.provinceDTO.name
                                    },
                                    "theme": {
                                        "color": "#3d9970"
                                    }
                                };
                                var rzp1 = new Razorpay(options);
                                rzp1.on('payment.failed', function (response) {

                                    $.ajax({
                                        type: 'POST',
                                        url: '${BASE_URL}auth/Payment',
                                        data: {
                                            orderId: response.error.metadata.order_id,
                                            paymentId: response.error.metadata.payment_id,
                                            productId: productId,
                                            addressId: addressId,
                                            paymentStatus: 'error',
                                            reason: response.error.reason,
                                            errorCode: response.error.code,
                                            productQTY: productQTY
                                        },
                                        success: function (data) {
                                            if (data == "Success") {
                                                window.location = ${BASE_URL}
                                            } else {
                                                Swal.fire({
                                                    title: data,
                                                    showDenyButton: false,
                                                    showCancelButton: false,
                                                    confirmButtonText: 'OK',
                                                    icon: 'error'
                                                }).then((result) => {
                                                    window.location.href = ${BASE_URL};

                                                });
                                            }
                                        },
                                        error: function () {
                                            Swal.fire({
                                                title: 'Something went wrong',
                                                showDenyButton: false,
                                                showCancelButton: false,
                                                confirmButtonText: 'OK',
                                                icon: 'error'
                                            }).then((result) => {
                                            });
                                        }
                                    })
                                });

                                rzp1.open();
                            } else {
                                Swal.fire({
                                    title: data.message,
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'error'
                                }).then((result) => {

                                });
                            }
                        },
                        error: function () {
                            Swal.fire({
                                title: 'Something Unexpected happend tryagain shortly..',
                                showDenyButton: false,
                                showCancelButton: false,
                                confirmButtonText: 'OK',
                                icon: 'error'
                            }).then((result) => {
                            });
                        }
                    })
                }

            });

            function loadCartProducts() {
                fetch("${BASE_URL}/Cart")
                        .then(response => response.json())
                        .then(data => {
                            if (!data.isEmpty) {
                                var cartData = data.data;
                                var orderSummary = document.getElementById('order-summary');
                                var checkoutProduct = document.getElementById('checkout_item');

                                let total = document.getElementById('total');
                                let discount = document.getElementById('discount');
                                let subTotal = document.getElementById('sub-total');
                                let grandTotal = document.getElementById('grand-total');

                                total.innerHTML = cartData.total + ' LKR';
                                discount.innerHTML = cartData.discount + ' LKR';
                                subTotal.innerHTML = (cartData.total - cartData.discount) + ' LKR';
                                grandTotal.innerHTML = ((cartData.total - cartData.discount) + 300) + ' LKR';

                                let image = document.getElementById('image');
                                let productName = document.getElementById('product-name');
                                let productPrice = document.getElementsByClassName('product-price')[0];
                                let qty = document.getElementsByClassName('qty')[0];

                                let deletebtn = document.getElementById('delete');

                                cartData.cartItemDTOs
                                        .forEach(cartItem => {
                                            let product = cartItem.productDTO;

                                            product.galleries.forEach(gallery => {
                                                if (gallery.thumbnail) {
                                                    image.setAttribute("src", gallery.imgPath);
                                                }
                                            });
                                            productName.innerHTML = product.productName;
                                            productName.setAttribute("href", '${BASE_URL}product_detail.jsp?id=' + product.id);
                                            productPrice.innerHTML = (cartItem.total - cartItem.discount) + ' LKR';
                                            qty.innerHTML = cartItem.qty;

                                            productPrice.setAttribute("id", 'productprice' + cartItem.id);

                                            deletebtn.setAttribute('onclick', 'deleteFromCart(' + cartItem.id + ')');

                                            orderSummary.innerHTML += checkoutProduct.innerHTML;
                                        });
                            } else {
                                window.location.href = ${BASE_URL};
                            }

                        });
            }

            function loadProduct() {
                let productId = document.getElementById('product-id').value;
                let productQTY = document.getElementById('product-qty').value;
                fetch("${BASE_URL}/auth/GetSingleProduct?productId=" + productId + "&productQTY=" + productQTY)
                        .then(response => response.json())
                        .then(data => {
                            console.log();
                            if(data.message === "Success"){
                                var product = data.data;
                                var orderSummary = document.getElementById('order-summary');
                                var checkoutProduct = document.getElementById('checkout_item');

                                let total = document.getElementById('total');
                                let discount = document.getElementById('discount');
                                let subTotal = document.getElementById('sub-total');
                                let grandTotal = document.getElementById('grand-total');

                                total.innerHTML = product.productPrice * productQTY + ' LKR';
                                discount.innerHTML = product.discountPrice * productQTY + ' LKR';
                                subTotal.innerHTML = (product.productPrice * productQTY)-(product.discountPrice * productQTY) + ' LKR';
                                grandTotal.innerHTML = ((product.productPrice * productQTY)-(product.discountPrice * productQTY) + 300) + ' LKR';

                                let image = document.getElementById('image');
                                let productName = document.getElementById('product-name');
                                let productPrice = document.getElementsByClassName('product-price')[0];
                                let qty = document.getElementsByClassName('qty')[0];

                                document.getElementById('delete').setAttribute("style","display:none;");
//                                
//                                let product = cartItem.productDTO;

                                product.galleries.forEach(gallery => {
                                    if (gallery.thumbnail) {
                                        image.setAttribute("src", gallery.imgPath);
                                    }
                                });
                                productName.innerHTML = product.productName;
                                productName.setAttribute("href", '${BASE_URL}product_detail.jsp?id=' + product.id);
                                productPrice.innerHTML = (product.productPrice - product.discountPrice) + ' LKR';
                                qty.innerHTML = productQTY;
//
//                                productPrice.setAttribute("id", 'productprice' + cartItem.id);


                                orderSummary.innerHTML += checkoutProduct.innerHTML;
                            
                            }else{
                                Swal.fire({
                                    title: data.message,
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'error'
                                }).then((result) => {
                                    window.location.href = ${BASE_URL};
                                });
                            }
                            

                        });

            }

            function loadTo() {
                let productId = document.getElementById('product-id').value;
                if (productId === '0') {
                    loadCartProducts();
                } else {
                    loadProduct();
                }
            }
            loadTo();
            //            var selectElement = document.getElementById('city');
            var selectElement = $("#city");
            document.getElementById('state').addEventListener('change', () => {
                var state = document.getElementById('state').value;

                fetch('${BASE_URL}auth/City?state=' + state)
                        .then(response => response.json())
                        .then(data => {
                            selectElement.empty();
                            if (data.status === 'Success') {
                                data.data.forEach(city => {
                                    var optionElement = $("<option>")
                                            .attr("value", city.id)  // Set the ID as the value attribute
                                            .text(city.name);

                                    // Append the created <option> element to the select element
                                    selectElement.append(optionElement);
                                });
                            } else {
                                Swal.fire({
                                    title: data.status,
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'error'
                                }).then((result) => {
                                });
                            }
                        })
                        .catch(error => {
                            // Handle any errors that occurred in the above promise chain
                            selectElement.empty();
                            Swal.fire({
                                title: 'Something went wrong try again',
                                showDenyButton: false,
                                showCancelButton: false,
                                confirmButtonText: 'OK',
                                icon: 'error'
                            }).then((result) => {
                            });
                        });

            });


            $(function () {
                $.validator.setDefaults({
                    submitHandler: function (form, event) {
                        event.preventDefault();

                        let fname = document.getElementById('fname').value;
                        let lname = document.getElementById('lname').value;
                        let street = document.getElementById('street').value;
                        let streetOptional = document.getElementById('street-optional').value;
                        let city = document.getElementById('city').value;
                        let state = document.getElementById('state').value;
                        let zip = document.getElementById('zip').value;
                        let phone = document.getElementById('phone').value;
                        let defaultAddress = document.getElementById('default-address').checked;

                        $.ajax({
                            type: 'POST',
                            url: '${BASE_URL}auth/Address',
                            data: {
                                fname: fname,
                                lname: lname,
                                street: street,
                                streetOptional: streetOptional,
                                city: city,
                                state: state,
                                zip: zip,
                                phone: phone,
                                defaultAddress: defaultAddress
                            },
                            success: function (data) {
                                data = JSON.parse(data);
                                if (data.message == "Success") {
                                    Swal.fire({
                                        title: 'Saved',
                                        showDenyButton: false,
                                        showCancelButton: false,
                                        confirmButtonText: 'OK',
                                        icon: 'success'
                                    }).then((result) => {
                                        loadAdress(data.data)
                                    });
                                } else {
                                    Swal.fire({
                                        title: data.message,
                                        showDenyButton: false,
                                        showCancelButton: false,
                                        confirmButtonText: 'OK',
                                        icon: 'error'
                                    }).then((result) => {

                                    });
                                }
                            },
                            error: function () {
                                Swal.fire({
                                    title: 'Cannot save try again',
                                    showDenyButton: false,
                                    showCancelButton: false,
                                    confirmButtonText: 'OK',
                                    icon: 'error'
                                }).then((result) => {
                                });
                            }
                        })
                    }
                });
                $('#address-form').validate({
                    rules: {
                        fname: {
                            required: true
                        },
                        lname: {
                            required: true
                        },
                        phone: {
                            required: true,
                            minlength: 10
                        },
                        street: {
                            required: true
                        },
                        state: {
                            required: true
                        },
                        city: {
                            required: true
                        },
                        zip: {
                            required: true
                        }
                    },
                    messages: {
                        state: {
                            required: "Select a State"
                        },
                        city: {
                            required: "Select a City"
                        }
                    },
                    errorElement: 'span',
                    errorPlacement: function (error, element) {
                        error.addClass('invalid-feedback');
                        element.closest('.u-s-m-b-15').append(error);
                    },
                    highlight: function (element, errorClass, validClass) {
                        $(element).addClass('is-invalid');
                    },
                    unhighlight: function (element, errorClass, validClass) {
                        $(element).removeClass('is-invalid');
                    }
                });
            });

            function GetAddress() {
                fetch("${BASE_URL}/auth/Address")
                        .then(response => response.json())
                        .then(data => {
                            if (!data.isEmpty) {
                                loadAdress(data.data);
                            }

                        });
            }
            GetAddress();
            function loadAdress(addreses) {
                let table = document.querySelector('#address-table-body');
                table.innerHTML = "";
                addreses.forEach(address => {
                    var adressText = '<strong>' + address.fname + ' ' + address.lname + '</strong><br>' +
                            address.phone + '<br>' +
                            address.addressLine1 + ' ' + address.addressLine2 + ' ' + address.city.name + ' ' + address.city.provinceDTO.name;

                    let row = table.insertRow();
                    let cell = row.insertCell();
                    var isChecked = address.isDefault ? 'checked' : '';
                    cell.innerHTML = '<div class="radio-box"> <input data-dismiss="modal" type="radio" onclick="changeAddress(`' + adressText + '`,`' + address.id + '`)" id="address-1" name="default-address" ' + isChecked + ' >' +
                            '<div class="radio-box__state radio-box__state--primary">' + '<label class="radio-box__label" for="address-1"></label></div></div>';
                    cell = row.insertCell();
                    cell.innerHTML = address.fname + ' ' + address.lname;
                    cell = row.insertCell();
                    cell.innerHTML = address.addressLine1 + ' ' + address.addressLine2 + ' ' + address.city.name + ' ' + address.city.provinceDTO.name;
                    cell = row.insertCell();
                    cell.innerHTML = address.phone;
                    cell = row.insertCell();
                    cell.innerHTML = address.isDefault ? 'Default' : '';
                    if (address.isDefault) {
                        document.getElementById('address-id').value = address.id;
                        document.getElementById('address').innerHTML = adressText;
                    }

                });
            }
            function changeAddress(address, addressId) {
                $('#edit-ship-address').modal('hide');
                document.getElementById('address-id').value = addressId;
                document.getElementById('address').innerHTML = address;

            }
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