/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.OrderDAO;
import dto.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "OrdersController", urlPatterns = {"/admin/api/Orders"})
public class OrdersController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        PrintWriter out = resp.getWriter();

        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();

        if (type.equals("pending")) {
            List<OrderDTO> pendingOrders = new OrderDAO().getPendingOrders();
            map.put("data", pendingOrders);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }
    }

}
