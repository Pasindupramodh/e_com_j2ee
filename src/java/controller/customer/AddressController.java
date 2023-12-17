/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.AddressDAO;
import dao.CustomerDAO;
import dto.AddressDTO;
import dto.CusLoginDTO;
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
import model.Customer;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "AddressController", urlPatterns = {"/auth/Address"})
public class AddressController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();

        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();

        try {

            String defaultAddress = req.getParameter("defaultAddress");
            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String street = req.getParameter("street");
            String streetOptional = req.getParameter("streetOptional");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String zip = req.getParameter("zip");
            String phone = req.getParameter("phone");

            if (defaultAddress.isEmpty() || fname.isEmpty()
                    || lname.isEmpty() || street.isEmpty()
                    || city.isEmpty() || state.isEmpty() || zip.isEmpty()
                    || phone.isEmpty()) {
                map.put("message", "Please fill all required fields..");
                JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                out.print(res);
            } else {
                boolean isDefault = false;

                if (defaultAddress.equals("true")) {
                    isDefault = true;
                }

                CusLoginDTO cusLoginDTO = (CusLoginDTO) req.getSession().getAttribute("customer");
                Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());

                AddressDAO addressDAO = new AddressDAO();
                List<AddressDTO> addressDTOs = addressDAO.saveAddress(customer, fname, lname, street, streetOptional, city, state, zip, phone, isDefault);

                if (addressDTOs != null) {
                    map.put("message", "Success");
                    map.put("data", addressDTOs);
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                } else {
                    map.put("message", "Can't save try again...");
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                }
            }

        } catch (Exception e) {
            map.put("message", "Something went wrong..");
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();

        try {
            CusLoginDTO cusLoginDTO = (CusLoginDTO) req.getSession().getAttribute("customer");
            Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());

            AddressDAO addressDAO = new AddressDAO();
            List<AddressDTO> addressDTOs = addressDAO.getAllAddressByCustomer(customer, null);
            if (addressDTOs == null || addressDTOs.isEmpty()) {
                map.put("isEmpty", true);
                JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                out.print(res);
            } else {
                map.put("isEmpty", false);
                map.put("data", addressDTOs);
                JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                out.print(res);
            }
        } catch (Exception e) {
            map.put("isEmpty", true);
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);
        }
    }

}
