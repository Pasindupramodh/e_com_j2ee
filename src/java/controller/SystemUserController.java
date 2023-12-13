/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SystemUserDAO;
import dto.SystemUserDTO;
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
import model.Login;
import model.SystemUser;
import model.UserType;
import org.json.JSONArray;
import util.Encryption;

/**
 *
 * @author pasin
 */
@WebServlet(name = "SystemUser", urlPatterns = {"/admin/api/SystemUser"})
public class SystemUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String user_type = req.getParameter("user_type");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        //Encrypt Passwprd using MD5
        String encrypt = Encryption.encrypt(password);
        
        //Get current date of Sri Lanka
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
        Date currentDate = calendar.getTime();
        
        //Get loged in user details
        UserData userData = (UserData) req.getSession().getAttribute("user");
        
        
        SystemUserDAO systemUserDAO = new SystemUserDAO();
        UserType userTypeById = systemUserDAO.getUserTypeById(Integer.valueOf(user_type));
        
        Login login = new Login();
        login.setCreatedAt(currentDate);
        login.setUpdatedAt(currentDate);
        login.setUsername(username);
        login.setPassword(encrypt);
        login.setStatus("Active");
        
        SystemUser systemUser = new SystemUser();
        systemUser.setCreatedAt(currentDate);
        systemUser.setSystemUserByCreatedBy(systemUserDAO.getUserById(userData.getId()));
        systemUser.setSystemUserByUpdatedBy(systemUserDAO.getUserById(userData.getId()));
        systemUser.setUpdatedAt(currentDate);
        systemUser.setEmail(email);
        systemUser.setFname(fname);
        systemUser.setLname(lname);
        systemUser.setMobile(mobile);
        systemUser.setUserType(userTypeById);
        systemUser.setIsActive(true);
        systemUser.setLogin(login);
        
        String response = systemUserDAO.save(login,systemUser,userData);
        resp.getWriter().write(response);
    }

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SystemUserDAO systemUserDAO = new SystemUserDAO();
        List<SystemUserDTO> dtos = systemUserDAO.getAllSystemUsers();
        JSONArray array = new JSONArray(dtos);
        resp.getWriter().print(array);
    }
 
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        SystemUserDAO systemUserDAO = new SystemUserDAO();
        systemUserDAO.delete(Integer.parseInt(id));
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter writer = resp.getWriter();
        
        String id = req.getParameter("id");
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String user_type = req.getParameter("user_type");
        
        UserData userData = (UserData) req.getSession().getAttribute("user");
        
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
        Date currentDate = calendar.getTime();
        
        SystemUserDAO systemUserDAO = new SystemUserDAO();
        SystemUser systemUser = systemUserDAO.getUserById(Integer.parseInt(id));
        systemUser.setFname(fname);
        systemUser.setLname(lname);
        systemUser.setMobile(mobile);
        systemUser.setEmail(email);
        systemUser.setUserType(systemUserDAO.getUserTypeById(Integer.parseInt(user_type)));
        systemUser.setUpdatedAt(currentDate);
        systemUser.setSystemUserByUpdatedBy(systemUserDAO.getUserById(userData.getId()));
        
        boolean isUpdate = systemUserDAO.update(systemUser);
        
        if(isUpdate){
            writer.write("Success");
        }else{
            writer.write("Error");
        }
        
    }
    
    
}
