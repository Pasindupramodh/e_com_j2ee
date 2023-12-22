<%-- 
    Document   : addProductVarient
    Created on : Nov 14, 2023, 11:58:45 PM
    Author     : pasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Green Teche</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<div class="card-header bg-color" style="">
    <h3 class="card-title text-white" >Product Variant</h3>
</div>
<div class="card-body">
    <div class="row justify-content-center">
        <img src="images/product1.jpg" class="card-img-top col" id="update_image" alt="brand image" style="max-height: 250px;max-width: 250px">

        <!--<input type="file"  accept="image/png, image/gif, image/jpeg" class="form-control" id="brand_img" name="brand_img" >-->

    </div>
    <div class="row justify-content-center">
        <div class="custom-file mt-3 mb-3 col-sm-6">
            <input type="file" class="custom-file-input" accept="image/png, image/gif, image/jpeg" id="exampleInputFile">
            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
        </div>
    </div>
    <div class="row ">
        <div class="col-sm-6">
            <!-- text input -->
            <div class="form-group">
                <label class="text-color">Variant Type</label>
                <select class="form-control">
                    <option>Color</option>
                    <option>Length</option>
                    <option>Storage</option>
                    <option>Weight</option>
                </select>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label class="text-color">Variant</label>
                <input type="text"  value="" id="password" name="password" class="form-control" placeholder="Enter ..." >
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <!-- text input -->
            <div class="form-group">
                <label class="text-color">Price</label>
                <input type="text"  value="" id="password" name="password" class="form-control" placeholder="Enter ..." >

            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label class="text-color">Discount Price</label>
                <input type="text"  value="" id="password" name="password" class="form-control" placeholder="Enter ..." >
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <!-- text input -->
            <div class="form-group">
                <label class="text-color">QTY</label>
                <input type="text"  value="" id="password" name="password" class="form-control" placeholder="Enter ..." >
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label class="text-color">Action</label><br>
                <button class="btn btn-primary col-12" > <i class="fas fa-plus" ></i> &emsp; Add </button>
            </div>

        </div>
    </div>
</div>