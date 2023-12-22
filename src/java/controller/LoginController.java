/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import dto.UserData;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Login;
import model.SystemUser;

/**
 *
 * @author pasin
 */
@WebServlet(name = "Login", urlPatterns = {"/admin/api/Login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        LoginDAO loginDAO = new LoginDAO();
        Login login = loginDAO.login(username,password);
        if(login == null){
            out.print("User Not Found");
        }else if(!login.getStatus().equals("Active")){
            out.print("Your Account Is Not Not Active");
        }else{
            SystemUser systemUser = (SystemUser) login.getSystemUsers().toArray()[0];
            UserData userData = new UserData();
            userData.setFname(systemUser.getFname());
            userData.setLname(systemUser.getLname());
            userData.setId(systemUser.getId());
            userData.setUserType(systemUser.getUserType().getUserType());
            HttpSession session = req.getSession(false);
            session.setAttribute("user", userData);
            out.print("Sucess");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String id = req.getParameter("id");
        LoginDAO loginDAO = new LoginDAO();
        boolean isUpdate = loginDAO.update(username, password, id);
        if(isUpdate){
            out.write("Success");
        }else{
            out.write("Errors");
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
