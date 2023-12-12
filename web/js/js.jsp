<%-- 
    Document   : js
    Created on : Dec 12, 2023, 12:15:27 PM
    Author     : REDTECH
--%>

<script>
    function setDataToQuickLook(imagepath, name, discount, price, qty, desc) {
        document.getElementById('js-product-detail-modal').innerHTML = '<div><img class="u-img-fluid" src="' + imagepath + '" alt=""></div>';
        document.getElementById('discount').innerHTML = discount + ' LKR';
        document.getElementById('product-name').innerHTML = name;
        document.getElementById('product-price').innerHTML = price + ' LKR';
        document.getElementById('afterDiscount').innerHTML = (price - discount) + ' LKR';
        document.getElementById('qty').innerHTML = qty + ' In Stock';
        document.getElementById('product_desc').innerHTML = desc;
        document.getElementById("max_qty").value = 1;
        document.getElementById("max_qty").setAttribute("data-max", qty);
    }
    function setDataToAddToCart(id, name, price, image) {
        document.getElementById("cart_image").innerHTML = ' <img class="u-img-fluid" src="' + image + '" alt="">';
        document.getElementById("cart_name").innerHTML = name;
        document.getElementById("cart_price").innerHTML = price;

        $.ajax({
            type: 'POST',
            url: '${BASE_URL}Cart',
            data: {
                id: id,
            },
            success: function (data) {
                console.log(data);
                if (data === "Success") {
                    $('#add-to-cart').modal('show');
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
                    title: 'Cannot add try again',
                    showDenyButton: false,
                    showCancelButton: false,
                    confirmButtonText: 'OK',
                    icon: 'error'
                }).then((result) => {
                });
            }
        });
        $('#add-to-cart').on('hidden.bs.modal', function () {
            window.location.reload();
        });

    }



    function validateMax(qty) {
        if (document.getElementById('max_qty').value > qty) {
            document.getElementById('max_qty').value = qty;
        }
    }
    function deleteFromCart(id){
        $.ajax({
            type: 'DELETE',
            url: '${BASE_URL}Cart?id='+id,
            
            success: function (data) {
                console.log(data);
                if (data === "Success") {
                    window.location.reload();
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
                    title: 'Cannot delete try again',
                    showDenyButton: false,
                    showCancelButton: false,
                    confirmButtonText: 'OK',
                    icon: 'error'
                }).then((result) => {
                });
            }
        });
    }

</script>