/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import dao.AddressDAO;
import dao.CartDAO;
import dao.ProductDAO;
import dto.AddressDTO;
import dto.CartDTO;
import dto.CartItemDTO;
import dto.CusLoginDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "OrderController", urlPatterns = {"/auth/Order"})
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();

        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();

        try {

            int productId = Integer.parseInt(req.getParameter("product"));
            int addressId = Integer.parseInt(req.getParameter("address"));

            Double total = 0.0;
            String itemName = "";

            boolean isProductsAvailable = true;
            ProductDTO product;
            if (productId == 0) {
                CartDTO cartDTO = new CartDAO().getCart(req.getSession());
                total = ((cartDTO.getTotal() - cartDTO.getDiscount())+300) * 100;
                for (CartItemDTO cartItemDTO : cartDTO.getCartItemDTOs()) {

                    product = new ProductDAO().getById(cartItemDTO.getProductDTO().getId());
                    if (product.getQty() < cartItemDTO.getQty()) {
                        isProductsAvailable = false;
                    }

                    itemName += cartItemDTO.getProductDTO().getProductName() + " ";
                }
            } else {
                product = new ProductDAO().getById(productId);
                int productQTY = Integer.parseInt(req.getParameter("productQTY"));
                if (product == null || product.getQty() < productQTY) {
                    isProductsAvailable = false;
                }else{
                    total = (((product.getProductPrice()-product.getDiscountPrice()) * productQTY)+300)*100;
                    itemName = product.getProductName();
                }
            }
            
            if (isProductsAvailable) {
                AddressDTO addressDTO = new AddressDAO().getById(addressId);
                CusLoginDTO cusLoginDTO = (CusLoginDTO) req.getSession().getAttribute("customer");
                if (addressDTO != null) {
                    RazorpayClient razorpay = new RazorpayClient("rzp_test_n8CzHm5PubcRlA", "J10aqKZq5QYNQudoCdQxl2Xi");

                    JSONObject orderRequest = new JSONObject();
                    orderRequest.put("amount", total);
                    orderRequest.put("currency", "LKR");
                    orderRequest.put("receipt", "receipt#1");
                    JSONObject notes = new JSONObject();
                    notes.put("notes_key_1", itemName);
                    orderRequest.put("notes", notes);

                    Order order = razorpay.orders.create(orderRequest);
                    map.put("message", "Success");
                    map.put("order", order.toJson());
                    map.put("address", addressDTO);
                    map.put("email", cusLoginDTO.getEmail());
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                } else {
                    map.put("message", "Something went wrong..");
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                }
            } else {
                map.put("message", "Product is not available or out of stocks");
                JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                out.print(res);
            }

        } catch (RazorpayException | NumberFormatException | JSONException e) {
            e.printStackTrace();
            map.put("message", e.getLocalizedMessage());
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }

    }

}
