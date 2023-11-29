/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SystemUserDAO;
import dao.VarientDAO;
import dto.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.SystemUser;

/**
 *
 * @author pasin
 */
@WebServlet(name = "UpdateProductVarientController", urlPatterns = {"/admin/api/UpdateProductVarient"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 15,
        maxFileSize = 1024 * 1024 * 15,
        maxRequestSize = 1024 * 1024 * 15,
        location = "/temp"
)
public class UpdateProductVarientController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        Part image = req.getPart("varientImage");
        String id = req.getParameter("id");
//        System.out.println(productId);
        String varientName = req.getParameter("varient_name");
        String discount = req.getParameter("discount");
        String qty = req.getParameter("qty");
        String price = req.getParameter("price");

        boolean isValid = validateInputs(id, varientName, discount, qty, price);

        if (isValid) {

            try {
                double dis = Double.parseDouble(discount);
                int qt = Integer.parseInt(qty);
                double pri = Double.parseDouble(price);
                int variantId = Integer.parseInt(id);
                if (dis < 0) {
                    out.write("Discount must be 0 or higher");
                } else if (qt < 0) {
                    out.write("Quentity must be 0 or higher");
                } else if (pri < 0) {
                    out.write("Price must be 0 or higher");
                } else {

                    //Get current date of Sri Lanka
                    Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                    Date currentDate = calendar.getTime();

                    //Get loged in user details
                    UserData userData = (UserData) req.getSession().getAttribute("user");
                    SystemUser systemUser = new SystemUserDAO().getUserById(userData.getId());

                    VarientDAO varientDAO = new VarientDAO();

                    boolean status = false;
                    
                    if (image.getSubmittedFileName() != null) {
                        status = varientDAO.update(getServletContext(), variantId, varientName, dis, qt, pri, image, currentDate, systemUser);
                    } else {
                        status = varientDAO.update(variantId, varientName, dis, qt, pri, currentDate, systemUser);
                    }
                    
                    if (status) {
                        out.print("Success");
                    } else {
                        out.print("Something went wrong");
                    }
                    
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.print("Something went wrong");
            }

        } else {
            out.print("Fill All Fields");
        }
    }

    boolean validateInputs(String... s) {
        for (String s1 : s) {
            if (s1 == null || s1.isEmpty()) {
                return false;
            }
        }
        return true;
    }

}
