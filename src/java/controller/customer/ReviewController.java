/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.CustomerDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dto.CusLoginDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Product;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "ReviewController", urlPatterns = {"/auth/Review"})
public class ReviewController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product = req.getParameter("product");
        String stars = req.getParameter("stars");
        String review = req.getParameter("review");
        String anonymous = req.getParameter("isanonymous");

        PrintWriter out = resp.getWriter();

        if (product.isEmpty() || stars.isEmpty() || review.isEmpty() || anonymous.isEmpty()) {
            out.print("Please fill all...");
        } else {
            try {
                Product product1 = new ProductDAO().getById(product);
                CusLoginDTO cusLoginDTO = (CusLoginDTO) req.getSession().getAttribute("customer");
                Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());
                if (product1 != null && customer != null) {
                    int starCount = Integer.parseInt(stars);
                    boolean isAnonymous = true;
                    if(anonymous.equals("false")){
                        isAnonymous = false;
                    }
                    boolean isSave = new ReviewDAO().saveReview(product1,customer,isAnonymous,starCount,review);
                    if(isSave){
                        out.print("Success");
                    }else{
                        out.print("Something went wrong...");
                    }
                }else{
                    out.print("Something went wrong...");
                }
                
            } catch (Exception e) {
                out.print("Something went wrong...");
            }

        }

    }

}
