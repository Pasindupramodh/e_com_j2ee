/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dao.SystemUserDAO;
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
@WebServlet(name = "UpdateProductController", urlPatterns = {"/admin/api/UpdateProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 15,
        maxFileSize = 1024 * 1024 * 15,
        maxRequestSize = 1024 * 1024 * 15,
        location = "/temp"
)
public class UpdateProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         Part productImage = req.getPart("productImage");
         String id = req.getParameter("id");
        String productName = req.getParameter("product_name");
        String discount = req.getParameter("discount");
        String qty = req.getParameter("qty");
        String price = req.getParameter("price");
        String brand = req.getParameter("brand");
        String tag = req.getParameter("tags");
        String published = req.getParameter("published");
        String shortDesc = req.getParameter("short_desc");
        String productDescription = req.getParameter("productDescription");

        PrintWriter out = resp.getWriter();

        //check input values are empty or not
        boolean isValid = validateInputs(productName, discount, qty, price, brand, tag, published, shortDesc, productDescription);
        
        if (isValid) {
                try {
                    double dis = Double.parseDouble(discount);
                    double qt = Double.parseDouble(qty);
                    double pri = Double.parseDouble(price);
                    int brandId = Integer.parseInt(brand);
                    int productId = Integer.parseInt(id);
                    if (dis < 0) {
                        out.write("Discount must be 0 or higher");
                    } else if (qt < 0) {
                        out.write("Quentity must be 0 or higher");
                    } else if (pri < 0) {
                        out.write("Price must be 0 or higher");
                    } else {
                        boolean publishe = true;
                        if (published.equals("0")) {
                            publishe = false;
                        }
                        String[] tags = tag.split(",");

                        //Get current date of Sri Lanka
                        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
                        Date currentDate = calendar.getTime();

                        //Get loged in user details
                        UserData userData = (UserData) req.getSession().getAttribute("user");
                        SystemUser systemUser = new SystemUserDAO().getUserById(userData.getId());

                        ProductDAO productDAO = new ProductDAO();
                        boolean status = false;
                        
                        if (productImage.getSubmittedFileName() != null) {
                            status = productDAO.update(getServletContext(),productId, productImage, productName, dis, qt, pri, brandId, tags, publishe, shortDesc, productDescription, currentDate, systemUser);

                        }else{
                            status = productDAO.update( productId, productName, dis, qt, pri, brandId, tags, publishe, shortDesc, productDescription, currentDate, systemUser);

                        }
                        
                        if (status) {
                            out.write("Success");
                        } else {
                            out.write("Cant Update Product");
                        }
                        
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.write("Something went wrong try again");
                }
            
        } else {
            out.write("Fill all fields");
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
