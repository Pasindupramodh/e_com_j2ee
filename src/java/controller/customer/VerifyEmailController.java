/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CusLoginDAO;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CusLogin;

/**
 *
 * @author pasin
 */
@WebServlet(name = "VerifyEmailController", urlPatterns = {"/verify"})
public class VerifyEmailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");
        CusLoginDAO cusLoginDAO = new CusLoginDAO();
        CusLogin cusLogin = cusLoginDAO.getByVC(token);
        if (cusLogin == null) {
            resp.getWriter().print("no customer");
        } else {

            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            cusLogin.setStatus(Boolean.TRUE);
            cusLogin.setVerifiedAt(currentDate);
            
            boolean status = cusLoginDAO.update(cusLogin);
            if(status){
                resp.sendRedirect("signin.jsp?status=0");
            }else{
                resp.getWriter().print("error");
            }
            
        }
    }

}
