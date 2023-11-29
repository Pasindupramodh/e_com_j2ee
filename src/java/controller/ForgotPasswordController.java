/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LoginDAO;
import dto.TokenDetailsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mail.PasswordResetMail;
import model.Login;
import model.SystemUser;
import org.json.JSONArray;
import org.json.JSONObject;
import provider.MailServiceProvider;
import util.JwtTokenUtil;

/**
 *
 * @author pasin
 */
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/admin/api/ForgotPassword"})
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String currentToken = req.getParameter("token");

        LoginDAO loginDAO = new LoginDAO();

        Login login = loginDAO.getByUserName(userName);

        PrintWriter out = resp.getWriter();

        Map<String, Object> data = new HashMap<>();
        JSONObject jsonObject;

        try {
            if (login == null) {

                data.put("status", "User Not found");

                jsonObject = new JSONObject(data);

                out.print(jsonObject);
            } else {
                SystemUser systemUser = (SystemUser) login.getSystemUsers().toArray()[0];
                TokenDetailsDTO tokenDetailsDTO = new TokenDetailsDTO();
                tokenDetailsDTO.setEmail(systemUser.getEmail());
                System.out.println("Token = " + currentToken);
                JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();

                boolean sendMail = false;

                if (currentToken == null || currentToken.isEmpty()) {
                    sendMail = true;
                } else {
                    try {
                        if (!jwtTokenUtil.validateToken(currentToken, tokenDetailsDTO)) {
                            sendMail = true;
                        } else {
                            Date expireDate = jwtTokenUtil.getExpireDateFromToken(currentToken);
                            Date current = new Date();

                            long diffInMillies = Math.abs(expireDate.getTime() - current.getTime());
                            long diff = TimeUnit.MINUTES.convert(diffInMillies, TimeUnit.MILLISECONDS);
                            if (diff == 0) {
                                diff = TimeUnit.SECONDS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                                data.put("status", "Try again after " + diff + " Seconds");
                            } else {
                                data.put("status", "Try again after " + diff + " Minutes");
                            }

                            jsonObject = new JSONObject(data);

                            out.print(jsonObject);
                        }
                    } catch (io.fusionauth.jwt.JWTExpiredException e) {
                        sendMail = true;
                    }

                }
                if (sendMail) {
                    String token = jwtTokenUtil.generateAccessToken(tokenDetailsDTO);
                    Date expireDate = jwtTokenUtil.getExpireDateFromToken(token);

                    PasswordResetMail mail = new PasswordResetMail(systemUser.getEmail(), token);
                    MailServiceProvider.getInstance().sendMail(mail);
                    data.put("status", "Success");
                    data.put("accessToken", token);
                    data.put("expireIn", expireDate);
                    System.out.println("Token "+token);
                    System.out.println("Name "+jwtTokenUtil.getUsernameFromToken(token));

                    jsonObject = new JSONObject(data);

                    out.print(jsonObject);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
