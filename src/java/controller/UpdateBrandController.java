/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDao;
import dao.SystemUserDAO;
import dto.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
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
@WebServlet(name = "UpdateBrand", urlPatterns = {"/UpdateBrand"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 15,
        maxFileSize = 1024 * 1024 * 15,
        maxRequestSize = 1024 * 1024 * 15,
        location = "/temp"
)
public class UpdateBrandController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {

            String brandName = req.getParameter("brand_name");
            String brandDesc = req.getParameter("brand_desc");
            String category = req.getParameter("category");
            String brandId = req.getParameter("brand_id");
            if (brandDesc.isEmpty() || brandId.isEmpty() || brandName.isEmpty() || category.isEmpty()) {
                out.write("Fill all fields");
            } else {
                Part part = req.getPart("brand_img");

                //Get loged in user details
                UserData userData = (UserData) req.getSession().getAttribute("user");
                SystemUser systemUser = new SystemUserDAO().getUserById(userData.getId());
                boolean isUpdated;
                if (part.getSubmittedFileName() != null) {
                    //If update image selected
                    isUpdated = new BrandDao().update(systemUser, Integer.parseInt(brandId), brandName, brandDesc, Integer.parseInt(category), part, getServletContext());
                } else {
                    //If update image not seleced
                    isUpdated = new BrandDao().update(systemUser, Integer.parseInt(brandId), brandName, brandDesc, Integer.parseInt(category));
                }
                if(isUpdated){
                    out.write("Success");
                }else{
                    out.write("Connot Update try again...");
                }
            }

        } catch (Exception e) {
            out.write("Cant update try again...");
        }

    }

}
