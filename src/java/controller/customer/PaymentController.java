/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import dao.AddressDAO;
import dao.CartDAO;
import dao.CustomerDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.CusLoginDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Address;
import model.Customer;
import model.Product;

/**
 *
 * @author REDTECH
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/auth/Payment"})
public class PaymentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        try {

            String paymentStatus = req.getParameter("paymentStatus");
            String errorCode = req.getParameter("errorCode");
            String reason = req.getParameter("reason");
            String orderId = req.getParameter("orderId");
            String paymentId = req.getParameter("paymentId");
            int productId = Integer.parseInt(req.getParameter("productId"));
            int addressId = Integer.parseInt(req.getParameter("addressId"));

            if (paymentStatus.equals("success")) {
                errorCode = "200";
                reason = "Success";
            }
            //Get Loged in customer 
            CusLoginDTO cusLoginDTO = (CusLoginDTO) req.getSession().getAttribute("customer");
            Customer customer = new CustomerDAO().getByEmail(cusLoginDTO.getEmail());

            //Get address by id
            Address address = new AddressDAO().getAddressModelById(addressId);

            OrderDAO orderDAO = new OrderDAO();

            if (productId == 0) {

                //get customer's cart
                CartDTO cart = new CartDAO().getCart(req.getSession());

                boolean isSaved = orderDAO.saveOrderViCart(customer, address, errorCode, reason, orderId, paymentId, cart, req.getSession());
                if (isSaved) {
                    new ProductDAO().updateQTY(cart);
                    out.print("Success");
                }
            } else {
                System.out.println(req.getParameter("productQTY"));
                int productQTY = Integer.parseInt(req.getParameter("productQTY"));
                Product product = new ProductDAO().getById(req.getParameter("productId"));
                boolean isSaved = orderDAO.saveOrderViProduct(customer, address, errorCode, reason, orderId, paymentId, product, productQTY);
                if (isSaved) {
                    new ProductDAO().updateQTY(product.getId(), productQTY);
                    out.print("Success");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.print("Something went wrong");
        }

    }

}
