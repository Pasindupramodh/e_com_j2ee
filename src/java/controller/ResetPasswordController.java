/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import io.fusionauth.jwt.InvalidJWTSignatureException;
import io.fusionauth.jwt.JWTExpiredException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.JwtTokenUtil;

/**
 *
 * @author pasin
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/admin/api/ResetPassword"})
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");
        String newPassword = req.getParameter("new_password");
        String rePassword = req.getParameter("repassword");
        System.out.println(token);
        PrintWriter out = resp.getWriter();
        try {
            JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();

            String userName = jwtTokenUtil.getUsernameFromToken(token);

            if (newPassword.isEmpty() || rePassword.isEmpty()) {
                out.print("Fill all fields");
            } else if (!newPassword.equals(rePassword)) {
                out.print("Passwords didn't match");
            } else {
                LoginDAO loginDAO = new LoginDAO();
                System.out.println("asasas" + userName);
                boolean status = loginDAO.updatePassword(userName, newPassword);
                if(status){
                    out.print("Updated");
                }else{
                    out.print("Something went wrong");
                }
            }

        } catch (JWTExpiredException | InvalidJWTSignatureException | NullPointerException ex) {
            ex.printStackTrace();
            out.print("Password reset link has expired..!");
        } catch (Exception ex) {
            ex.printStackTrace();
            out.print("Something went wrong");
            //ex.printStackTrace();
        }
    }

}
