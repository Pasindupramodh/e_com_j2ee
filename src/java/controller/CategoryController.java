/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.SystemUserDAO;
import dto.CategoryDTO;
import dto.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.SystemUser;
import org.json.JSONArray;

/**
 *
 * @author pasin
 */
@WebServlet(name = "Category", urlPatterns = {"/Category"})
public class CategoryController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {

            String name = req.getParameter("name");
            String desc = req.getParameter("desc");
            String icon = req.getParameter("ico");

            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            //Get loged in user details
            UserData userData = (UserData) req.getSession().getAttribute("user");

            Category category = new Category();
            category.setCategoryName(name);
            category.setCategoryIcon(icon);
            category.setCategoryDesc(desc);
            category.setSystemUserByCreatedBy(new SystemUserDAO().getUserById(userData.getId()));
            category.setSystemUserByUpdatedBy(new SystemUserDAO().getUserById(userData.getId()));
            category.setCreatedAt(currentDate);
            category.setUpdatedAt(currentDate);
            category.setIsActive(Boolean.TRUE);

            if (new CategoryDAO().save(category)) {
                out.write("Success");
            } else {
                out.write("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        if (new CategoryDAO().getAllCategoriess() == null) {
            out.write("not found");
        } else {
            List<CategoryDTO> categories = new CategoryDAO().getAllCategoriess();

            if (categories.isEmpty()) {
                out.write("not found");
            } else {
                JSONArray array = new JSONArray(categories);
                out.print(array);

            }
        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        PrintWriter out = resp.getWriter();
        try {
            if (new CategoryDAO().delete(Integer.parseInt(id))) {
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
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String desc = req.getParameter("desc");
        String icon = req.getParameter("icon");
        PrintWriter out = resp.getWriter();

        //Get loged in user details
        UserData userData = (UserData) req.getSession().getAttribute("user");
        SystemUser systemUser = new SystemUserDAO().getUserById(userData.getId());
        
        if (new CategoryDAO().update(id, name, desc, icon,systemUser)) {
            out.write("Success");
        } else {
            out.write("error");
        }

    }

}
