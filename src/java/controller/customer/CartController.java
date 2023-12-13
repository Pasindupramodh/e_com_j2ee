/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CartDAO;
import dto.CartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "CartController", urlPatterns = {"/Cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            CartDAO cartDAO = new CartDAO();
            HttpSession session = req.getSession();
            if (session.getAttribute("customer") == null) {
                String message = cartDAO.addToSessionCart(session, id);
                out.print(message);
            }else{
                String message = cartDAO.addToCart(session, id);
                out.print(message);
            }
        } catch (Exception e) {
            out.print("Something went wrong try again latter");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            CartDAO cartDAO = new CartDAO();
            HttpSession session = req.getSession();
            if (session.getAttribute("customer") == null) {
                String message = cartDAO.deleteFromSessionCart(session, id);
                out.print(message);
            }else{
                String message = cartDAO.deleteFromCart(session, id);
                out.print(message);
            }
        } catch (Exception e) {
            out.print("Something went wrong try again latter");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        Map<String, Object> map = new HashMap<>();

        CartDAO cartDAO = new CartDAO();
        CartDTO cartDTO = cartDAO.getCart(req.getSession());
        Gson gsone = new Gson();
        if (cartDTO == null) {
            map.put("isEmpty", true);

            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        } else {
            map.put("isEmpty", false);
            map.put("data", gsone.toJsonTree(cartDTO).getAsJsonObject());

            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         PrintWriter out = resp.getWriter();
         
         try {
            Gson gsone = new Gson();
             HttpSession httpSession = req.getSession();
             
             int id = Integer.parseInt(req.getParameter("id"));
             int qty = Integer.parseInt(req.getParameter("qty"));
             
             CartDAO cartDAO = new CartDAO();
             
             if(httpSession.getAttribute("customer")==null){
                 Map<String , Object> map = cartDAO.updateSessionCart(httpSession,id,qty);
                 JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                 out.print(res);
             }else{
                 Map<String , Object> map = cartDAO.updateCart(httpSession,id,qty);
                 JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                 out.print(res);
             }
             
        } catch (Exception e) {
            out.print("Something went wrong");
        }
    }

    
    
}
