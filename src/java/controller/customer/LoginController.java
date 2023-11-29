/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CusLoginDAO;
import dto.CusLoginDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CusLogin;
import model.Customer;
import util.Encryption;

/**
 *
 * @author pasin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/Login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            PrintWriter out = resp.getWriter();
        
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        if(email.isEmpty() || email == null || password.isEmpty() || password == null){
            out.print("Please Fill All fields..");
        }else{
            CusLoginDAO cusLoginDAO = new CusLoginDAO();
            CusLogin cusLogin = cusLoginDAO.getByEmail(email);
            
            if(cusLogin != null){
                if(cusLogin.getPassword().equals(Encryption.encrypt(password))){
                    if(cusLogin.getVerifiedAt() != null){
                        System.out.println(cusLogin.getStatus());
                       if(cusLogin.getStatus()){
                           
                           HttpSession session = req.getSession();
                           
                           Customer customer = (Customer) cusLogin.getCustomers().toArray()[0];
                           
                           CusLoginDTO cusLoginDTO = new CusLoginDTO();
                           cusLoginDTO.setFname(customer.getFname());
                           cusLoginDTO.setLname(customer.getLname());
                           cusLoginDTO.setId(customer.getId());
                           cusLoginDTO.setEmail(customer.getEmail());
                           
                           session.setAttribute("customer", cusLoginDTO);
                           
                           out.print("Success");
                           
                       }else{
                           out.print("Your account is band cantact us for more details");
                       }
                    }else{
                        out.print("Please verify your Email...");
                    }
                }else{
                    out.print("Invalid Email or Password");
                }
            }else{
                out.print("Invalid Email or Password");
            }
            
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }

    
}
