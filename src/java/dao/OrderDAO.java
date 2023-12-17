/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.CartDTO;
import dto.CartItemDTO;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.http.HttpSession;
import model.Address;
import model.Customer;
import model.Order;
import model.OrderHasOrderStatus;
import model.OrderHasOrderStatusId;
import model.OrderItem;
import model.OrderStatus;
import model.PaymentStatus;
import model.Product;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author REDTECH
 */
public class OrderDAO {

    public boolean saveOrderViCart(Customer customer, Address address,
            String errorCode, String reason, String orderId,
            String paymentId, CartDTO cart, HttpSession httpSession) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            Transaction transaction = session.beginTransaction();

            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            calendar.add(Calendar.DATE, 5);
            Date estimateDelivery = calendar.getTime();

            PaymentStatus paymentStatus = new PaymentStatusDAO().getExistPaymentStatus(reason, errorCode);

            if (paymentStatus == null) {
                paymentStatus = new PaymentStatus();
                paymentStatus.setStatus(reason);
                paymentStatus.setStatusCode(errorCode);
                session.persist(paymentStatus);
            }

            Order order = new Order();

            order.setCustomer(customer);
            order.setDiscount(cart.getDiscount());
            order.setEstimatedDeliveryDate(estimateDelivery);
            order.setOrderDate(currentDate);
            order.setOrderDeliveredCustomerDate(null);
            order.setOrderId(orderId);
            order.setTotal(cart.getTotal());
            order.setUpdateDate(currentDate);
            order.setPaymentStatus(paymentStatus);

            session.persist(order);

            OrderStatus orderStatus = new OrderStatusDAO().getOrderStatusByStatus("Pending");

            OrderHasOrderStatus orderHasOrderStatus = new OrderHasOrderStatus();

            orderHasOrderStatus.setDate(currentDate);
            orderHasOrderStatus.setOrder(order);
            orderHasOrderStatus.setOrderStatus(orderStatus);

            
            OrderHasOrderStatusId orderHasOrderStatusId = new OrderHasOrderStatusId();
            orderHasOrderStatusId.setOrderId(orderId);
            orderHasOrderStatusId.setOrderStatusId(orderStatus.getId());
            
            orderHasOrderStatus.setId(orderHasOrderStatusId);
            
            session.persist(orderHasOrderStatus);

            for (CartItemDTO cartItemDTO : cart.getCartItemDTOs()) {

                //Get product by id 
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getById(String.valueOf(cartItemDTO.getId()));

                OrderItem orderItem = new OrderItem();
                orderItem.setDiscount(cartItemDTO.getUnitDiscount());
                orderItem.setOrder(order);
                orderItem.setProduct(product);
                orderItem.setQty(cartItemDTO.getQty());
                orderItem.setTotaldiscount(cartItemDTO.getDiscount());
                orderItem.setUnitprice(cartItemDTO.getUnitprice());
                
                session.persist(orderItem);
            }

            transaction.commit();
            
            
            
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
            CartDAO cartDAO = new CartDAO();
            cartDAO.delete(cart);
        }
    }

}
