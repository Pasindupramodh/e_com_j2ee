/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BrandDao;
import dao.CategoryDAO;
import services.FileUpload;
import dao.SystemUserDAO;
import dto.BrandDTO;
import dto.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.ws.rs.WebApplicationException;
import model.Brand;
import model.Category;
import model.SystemUser;
import org.json.JSONArray;

/**
 *
 * @author pasin
 */
@WebServlet(name = "Brand", urlPatterns = {"/Brand"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 15,
        maxFileSize = 1024 * 1024 * 15,
        maxRequestSize = 1024 * 1024 * 15,
        location = "/temp"
)
public class BrandController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();

        String brandName = req.getParameter("brand_name");
        String brandDesc = req.getParameter("brand_desc");
        String category = req.getParameter("category");

        Part part = req.getPart("brand_img");
        
        //Get current date of Sri Lanka
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
        Date currentDate = calendar.getTime();

        //Get loged in user details
        UserData userData = (UserData) req.getSession().getAttribute("user");
        SystemUser systemUser = new SystemUserDAO().getUserById(userData.getId());
        try {
            Category categoryModel = new CategoryDAO().getById(Integer.parseInt(category));
            FileUpload.FileItem fileItem = new FileUpload(getServletContext()).upload("brands", part.getInputStream(), part);
            if (fileItem != null) {
                String imagePath = fileItem.getFullUrl();
                Brand brand = new Brand();
                brand.setBrandDesc(brandDesc);
                brand.setBrandImage(imagePath);
                brand.setBrandName(brandName);
                brand.setIsActive(Boolean.TRUE);
                brand.setCategory(categoryModel);
                brand.setSystemUserByCreatedBy(systemUser);
                brand.setSystemUserByUpdatedBy(systemUser);
                brand.setCreatedAt(currentDate);
                brand.setUpdatedAt(currentDate);
                if(new BrandDao().save(brand)){
                    out.print("Success");
                }else{
                    out.print("error");
                }
            } else {
                out.print("error");
            }
        } catch (Exception e) {
            out.print("error");
        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        PrintWriter out = resp.getWriter();
        try {
            if (new BrandDao().delete(Integer.parseInt(id))) {
                out.write("success");
            } else {
                out.write("error");
            }
        } catch (Exception e) {
            out.write("error");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String brandName = req.getParameter("brand_name");
        String brandDesc = req.getParameter("brand_desc");
        String category = req.getParameter("category");

        try {
            Part part = req.getPart("brand_img");
            resp.getWriter().write("Image");
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            resp.getWriter().write("No Image");
        }
        
        System.out.println("Date "+brandName);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String category = req.getParameter("category");
        BrandDao brandDao = new BrandDao();
        PrintWriter out = resp.getWriter();
        List<BrandDTO> brandDTOs = brandDao.getByCategory(category);
        JSONArray array;
        if(brandDTOs == null){
            throw new WebApplicationException("Brand Not Found");
        }else{
            
            array = new JSONArray(brandDTOs);
                out.print(array);
        }
        } catch (Exception e) {
        }
    }
    
    
    

    
}
