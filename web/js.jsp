<%-- 
    Document   : js
    Created on : Nov 24, 2023, 5:42:42 PM
    Author     : pasin
--%>

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

<!--====== Vendor Js ======-->
<script src="${BASE_URL}js/vendor.js"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="${BASE_URL}js/jquery.shopnav.js"></script>

<!--====== App ======-->
<script src="${BASE_URL}js/app.js"></script>

<!--====== Jquery ======-->
<script src="${BASE_URL}plugins/jquery/jquery.min.js"></script>
<script src="${BASE_URL}plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="${BASE_URL}plugins/jquery-validation/additional-methods.min.js"></script>
<script src="${BASE_URL}plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${BASE_URL}plugins/sweetalert2/sweetalert2.all.min.js"></script>
 <script src="${BASE_URL}plugins/universal-icon-picker/assets/js/universal-icon-picker.min.js"></script>
 <script src="${BASE_URL}admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
 