/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CityDAO;
import dao.ProvinceDAO;
import dto.CityDTO;
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
import model.Province;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "CityController", urlPatterns = {"/auth/City"})
public class CityController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        Map<String, Object> map = new HashMap<>();
        Gson gsone = new Gson();
        try {
            int state = Integer.parseInt(req.getParameter("state"));

            Province province = new ProvinceDAO().getById(state);

            if (province != null) {
                List<CityDTO> cityDTOs = new CityDAO().getCityByProvince(province);

                if (cityDTOs != null && !cityDTOs.isEmpty()) {
                    map.put("status", "Success");
                    map.put("data", cityDTOs);
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                } else {
                    map.put("status", "Cities Not Found");
                    JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                    out.print(res);
                }

            } else {
                map.put("status", "Province Not Found");
                JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
                out.print(res);
            }

        } catch (Exception e) {

            map.put("status", "Something went wrong");
            JsonObject res = gsone.toJsonTree(map).getAsJsonObject();
            out.print(res);

        }
    }

}
