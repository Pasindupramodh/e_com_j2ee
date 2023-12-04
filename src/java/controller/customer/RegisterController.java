/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mail.VerificationMail;
import model.CusLogin;
import model.Customer;
import provider.MailServiceProvider;
import util.EmaiValidation;
import util.Encryption;

/**
 *
 * @author pasin
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/Register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        
//        VerificationMail mail = new VerificationMail("pasindupramodh6@gmail.com", "1234-1234-1234");
//        MailServiceProvider.getInstance().sendMail(mail);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       PrintWriter out = resp.getWriter();
       String fname = req.getParameter("fname");
       String lname = req.getParameter("lname");
       String gender = req.getParameter("gender");
       String email = req.getParameter("email");
       String password = req.getParameter("password");
        System.out.println(email);
       if(fname == null || fname.isEmpty() || lname == null || lname.isEmpty()){
           out.print("Fill name fields");
       }else if(password.isEmpty() || password == null || password.length() <=5){
           out.print("Password must contains atleast 5 characters");
       }else if(!EmaiValidation.validate(email)){
           out.print("Invalid Email");
       }else{
           CustomerDAO customerDAO = new CustomerDAO();
           if(customerDAO.getByEmail(email) != null){
               out.print("Email already exists.");
           }else{
               String verificationCode = UUID.randomUUID().toString();
               
               CusLogin cusLogin = new CusLogin();
               cusLogin.setPassword(Encryption.encrypt(password));
               cusLogin.setStatus(Boolean.FALSE);
               cusLogin.setUsername(email);
               cusLogin.setVerifyCode(verificationCode);
               
               
               
               Customer customer = new Customer();
               customer.setFname(fname);
               customer.setLname(lname);
               customer.setEmail(email);
               customer.setGender(gender);
               customer.setCusLogin(cusLogin);
               
               if(customerDAO.save( cusLogin, customer)){
                   VerificationMail mail = new VerificationMail(email, verificationCode);
                   MailServiceProvider.getInstance().sendMail(mail);
                   out.print("Sucess");
               }else{
                   out.print("Something Went Wrong");
               }
               
           }
       }
       
       out.print(req.getParameter("gender"));
       
    }

    
}
