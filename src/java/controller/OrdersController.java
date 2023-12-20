/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.razorpay.Payment;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.razorpay.Refund;
import dao.OrderDAO;
import dao.SystemUserDAO;
import dto.OrderDTO;
import dto.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SystemUser;
import org.json.JSONException;
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
        }else if(type.equals("confirm")){
            List<OrderDTO> confirmOrders = new OrderDAO().getConfirmed();
            map.put("data", confirmOrders);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }else if(type.equals("out")){
            List<OrderDTO> delieryOrders = new OrderDAO().getInDeliveryOrders();
            map.put("data", delieryOrders);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }else if(type.equals("finished")){
            List<OrderDTO> delieryOrders = new OrderDAO().getFinishedOrders();
            map.put("data", delieryOrders);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }else if (type.equals("reject")){
            List<OrderDTO> delieryOrders = new OrderDAO().getRejectedOrders();
            map.put("data", delieryOrders);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }else if(type.equals("unpaid")){
            List<OrderDTO> delieryOrders = new OrderDAO().getUnpaidOrders();
            map.put("data", delieryOrders);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String type = req.getParameter("type");
        UserData userData = (UserData) req.getSession().getAttribute("user");
        SystemUser systemUser = new SystemUserDAO().getUserById(userData.getId());
        if (!id.isEmpty() || !type.isEmpty()) {
            if (type.equals("confirm")) {
                boolean confirmOrder = new OrderDAO().confirmOrder(id, systemUser);
                if (confirmOrder) {
                    resp.getWriter().print("Success");
                } else {
                    resp.getWriter().print("Error");
                }
            } else if (type.equals("reject")) {
//                boolean confirmOrder = new OrderDAO().confirmOrder(id,systemUser);
                try {
                    RazorpayClient razorpay = new RazorpayClient("rzp_test_n8CzHm5PubcRlA", "J10aqKZq5QYNQudoCdQxl2Xi");
                    List<Payment> payments = razorpay.orders.fetchPayments(id);
                    JSONObject toJson = payments.get(0).toJson();
                    String paymentId = toJson.getString("id");

                    JSONObject refundRequest = new JSONObject();
                    refundRequest.put("amount", toJson.getInt("amount"));
                    refundRequest.put("speed", "normal");
                    JSONObject notes = new JSONObject();
                    notes.put("notes", "Refund for order reject");
                    refundRequest.put("notes", notes);
                    refundRequest.put("receipt", "Receipt " + id);

                    razorpay.payments.refund(paymentId, refundRequest);
                    boolean rejectOrder = new OrderDAO().rejectOrder(id, systemUser);
                    if (rejectOrder) {
                        resp.getWriter().print("Success");
                    } else {
                        resp.getWriter().print("Error");
                    }
                } catch (RazorpayException e) {
                } catch (JSONException ex) {
                    Logger.getLogger(OrdersController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else if(type.equals("tracking")){
                String trackingNumber = req.getParameter("trackingNumber");
                if(!trackingNumber.isEmpty()){
                    boolean isUpdated = new OrderDAO().deliveryOrder(id,trackingNumber, systemUser);
                    if (isUpdated) {
                        resp.getWriter().print("Success");
                    } else {
                        resp.getWriter().print("Error");
                    }
                }
            }else if(type.equals("delivered")){
                 boolean isUpdated = new OrderDAO().deliveredOrder(id, systemUser);
                    if (isUpdated) {
                        resp.getWriter().print("Success");
                    } else {
                        resp.getWriter().print("Error");
                    }
            }
        }
    }

}
