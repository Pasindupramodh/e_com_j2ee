/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CusLoginDAO;
import dto.TokenDetailsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mail.PasswordResetMailCustomer;
import model.CusLogin;
import org.json.JSONObject;
import provider.MailServiceProvider;
import util.JwtTokenUtil;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String currentToken = req.getParameter("token");

        CusLoginDAO loginDAO = new CusLoginDAO();

        CusLogin login = loginDAO.getByEmail(email);

        PrintWriter out = resp.getWriter();

        Map<String, Object> data = new HashMap<>();
        JSONObject jsonObject;

        try {
            if (login == null) {

                data.put("status", "User Not found");

                jsonObject = new JSONObject(data);

                out.print(jsonObject);
            } else {
                
                TokenDetailsDTO tokenDetailsDTO = new TokenDetailsDTO();
                tokenDetailsDTO.setEmail(login.getUsername());
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

                    PasswordResetMailCustomer mail = new PasswordResetMailCustomer(login.getUsername(), token);
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
