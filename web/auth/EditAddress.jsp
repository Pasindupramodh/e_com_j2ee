<%-- 
    Document   : EditAddress
    Created on : Dec 21, 2023, 5:25:00 PM
    Author     : REDTECH
--%>


<%@page import="model.Province"%>
<%@page import="model.Province"%>
<%@page import="dao.ProvinceDAO"%>
<%@page import="dto.AddressDTO"%>
<%@page import="dao.AddressDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                    <%                        CusLoginDTO cusLoginDTO = (CusLoginDTO) session.getAttribute("customer");
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

                                    <%
                                        try {
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            AddressDTO addressDTO = new AddressDAO().getByIdAndCustomer(id, customer);
                                            if (addressDTO != null) {
                                    %>

                                    <div class="col-lg-9 col-md-12">
                                        <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white">
                                            <div class="dash__pad-2">
                                                <h1 class="dash__h1 u-s-m-b-14">Add new Address</h1>

                                                <span class="dash__text u-s-m-b-30">We need an address where we could deliver products.</span>
                                                <form class="dash-address-manipulation" id="address-form">
                                                    <input type="hidden" value="<%= addressDTO.getId() %>" id="id" name="id"/>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-30">

                                                            <label class="gl-label" for="address-fname">FIRST NAME *</label>

                                                            <input class="input-text input-text--primary-style" value="<%= addressDTO.getFname()%>" type="text" name="fname" id="fname" data-bill=""></div>
                                                        <div class="u-s-m-b-30">

                                                            <label class="gl-label" for="address-lname">LAST NAME *</label>

                                                            <input class="input-text input-text--primary-style" value="<%= addressDTO.getLname()%>" type="text" name="lname" id="lname" data-bill=""></div>
                                                    </div>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-30">

                                                            <label class="gl-label" for="address-phone">PHONE *</label>

                                                            <input class="input-text input-text--primary-style" value="<%= addressDTO.getPhone()%>" type="text" id="phone" name="phone" data-bill=""></div>
                                                    </div>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-30">

                                                            <label class="gl-label" for="address-phone">STREET ADDRESS *</label>

                                                            <input class="input-text input-text--primary-style" value="<%= addressDTO.getAddressLine1()%>" type="text" id="street" name="street" placeholder="House name and street name" data-bill=""></div>
                                                        <div class="u-s-m-b-30">

                                                            <label class="gl-label" for="address-street">STREET ADDRESS 2</label>

                                                            <input class="input-text input-text--primary-style" value="<%= addressDTO.getAddressLine2()%>" type="text" id="street-optional" name="street-optional" placeholder="Apartment, suite unit etc. (optional)" data-bill=""></div>
                                                    </div>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-30">

                                                            <!--====== Select Box ======-->

                                                            <label class="gl-label" for="address-country">STATE/PROVINCE *</label>
                                                            <select class="select-box select-box--primary-style" id="state" name="state" data-bill="">

                                                                <%                                                            ProvinceDAO provinceDAO = new ProvinceDAO();
                                                                    List<Province> provinces = provinceDAO.getAllProvinces();
                                                                    for (Province province : provinces) {
                                                                        if (province.getId() == addressDTO.getCity().getProvinceDTO().getId()) {
                                                                %>
                                                                <option value="<%= province.getId()%>" selected><%= province.getName()%></option>
                                                                <%
                                                                } else {
                                                                %>
                                                                <option value="<%= province.getId()%>"><%= province.getName()%></option>
                                                                <%
                                                                        }

                                                                    }
                                                                %>
                                                            </select>
                                                            <!--====== End - Select Box ======-->
                                                        </div>
                                                        <div class="u-s-m-b-30">

                                                            <!--====== Select Box ======-->

                                                            <label class="gl-label" for="address-state">TOWN/CITY *</label>
                                                            <select class="select-box select-box--primary-style" id="city" name="city" data-bill="">
                                                                <option selected value="<%= addressDTO.getCity().getId() %>"><%= addressDTO.getCity().getName() %></option>
                                                            </select>
                                                            <!--====== End - Select Box ======-->
                                                        </div>
                                                    </div>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-30">

                                                            <label class="gl-label" for="address-street">ZIP/POSTAL CODE *</label>

                                                            <input class="input-text input-text--primary-style" value="<%= addressDTO.getZipcode() %>" type="text" name="zip" id="zip" placeholder="Zip/Postal Code" data-bill=""></div>
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

                                                    <button class="btn btn--e-brand-b-2" type="submit">UPDATE</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                    } else {
                                    %>
                                    <script>
                                        window.location.href = '${BASE_URL}auth/Address.jsp';
                                    </script>
                                    <%
                                        }
                                    } catch (Exception e) {
                                    %>
                                    <script>
                                        window.location.href = '${BASE_URL}auth/Address.jsp';
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

        <script>
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
                        let id = document.getElementById('id').value;
                        $.ajax({
                            type: 'PUT',
                            url: '${BASE_URL}auth/Address?id='+id+'&fname='+fname+'&lname='+lname+'&street='+street+'&streetOptional='+streetOptional+'&city='+city+'&state='+state+'&zip='+zip+'&phone='+phone+'&defaultAddress='+defaultAddress,
                            data: {
                                
                            },
                            success: function (data) {
                                if (data == "Success") {
                                    Swal.fire({
                                        title: 'Updated',
                                        showDenyButton: false,
                                        showCancelButton: false,
                                        confirmButtonText: 'OK',
                                        icon: 'success'
                                    }).then((result) => {
                                        window.location.href = '${BASE_URL}auth/Address.jsp';
                                    });
                                } else {
                                    Swal.fire({
                                        title: data,
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
                                    title: 'Cannot update try again',
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
                        },
                        id: {
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