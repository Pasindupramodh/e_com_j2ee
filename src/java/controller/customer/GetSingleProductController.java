/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.ProductDAO;
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
import model.Product;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "GetSingleProductController", urlPatterns = {"/auth/GetSingleProduct"})
public class GetSingleProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();
        try {
            int productid = Integer.parseInt(req.getParameter("productId"));
            int productQTY = Integer.parseInt(req.getParameter("productQTY"));
            ProductDTO product = new ProductDAO().getById(productid);

            if (product != null) {

                if (product.getQty() >= productQTY) {
                    map.put("message", "Success");
                    map.put("data", product);
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                } else {
                    map.put("message", "Product out of stock");
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                }

            } else {
                map.put("message", "Product not found");
                JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                out.print(res);
            }
        } catch (Exception e) {
            map.put("message", "Something went wrong");
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }

    }

}
