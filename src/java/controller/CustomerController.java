/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CustomerDAO;
import dao.OrderDAO;
import dto.CustomerDTO;
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

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/admin/api/Customer"})
public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();
        List<CustomerDTO> allCustomers = new CustomerDAO().getAllCustomers();
        map.put("data", allCustomers);
        JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
        out.print(res);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean isUpdated = new CustomerDAO().updatecustomerStatus(id);
            if(isUpdated){
                out.write("Success");
            }else{
                out.write("Error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

}
