/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.HibernateUtil;
import dto.AddressDTO;
import dto.CartDTO;
import dto.CartItemDTO;
import dto.CustomerDTO;
import dto.OrderDTO;
import dto.OrderItemDTO;
import dto.OrderStatusDTO;
import dto.PaymentStatusDTO;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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
import model.SystemUser;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

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
            order.setLastStatus("Pending");
            order.setAddress(address);

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
                Product product = productDAO.getById(String.valueOf(cartItemDTO.getProductDTO().getId()));

                OrderItem orderItem = new OrderItem();
                orderItem.setDiscount(cartItemDTO.getUnitDiscount());
                orderItem.setOrder(order);
                orderItem.setProduct(product);
                orderItem.setQty(Double.valueOf(cartItemDTO.getQty()));
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

    public boolean saveOrderViProduct(Customer customer, Address address, String errorCode, String reason, String orderId, String paymentId, Product product, int productQTY) {
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
            order.setDiscount(product.getDiscountPrice() * productQTY);
            order.setEstimatedDeliveryDate(estimateDelivery);
            order.setOrderDate(currentDate);
            order.setOrderDeliveredCustomerDate(null);
            order.setOrderId(orderId);
            order.setTotal((product.getProductPrice() - product.getDiscountPrice()) * productQTY);
            order.setUpdateDate(currentDate);
            order.setPaymentStatus(paymentStatus);
            order.setLastStatus("Pending");
            order.setAddress(address);

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

            OrderItem orderItem = new OrderItem();
            orderItem.setDiscount(product.getDiscountPrice());
            orderItem.setOrder(order);
            orderItem.setProduct(product);
            orderItem.setQty(Double.valueOf(productQTY));
            orderItem.setTotaldiscount(product.getDiscountPrice() * productQTY);
            orderItem.setUnitprice(product.getProductPrice());

            session.persist(orderItem);

            transaction.commit();

            return true;
        } catch (Exception e) {

            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getPendingOrders() {

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            criteria.add(Restrictions.eq("lastStatus", "Pending"));
            List<Order> orders = criteria.list();

            return getOrderDTOS(orders);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getConfirmed() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            criteria.add(Restrictions.eq("lastStatus", "Confirmed"));
            List<Order> orders = criteria.list();

            return getOrderDTOS(orders);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getInDeliveryOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            criteria.add(Restrictions.eq("lastStatus", "Out For Delivery"));
            List<Order> orders = criteria.list();

            return getOrderDTOS(orders);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getFinishedOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            criteria.add(Restrictions.eq("lastStatus", "Delivered"));
            List<Order> orders = criteria.list();

            return getOrderDTOS(orders);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getRejectedOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            criteria.add(Restrictions.eq("lastStatus", "Rejected"));
            List<Order> orders = criteria.list();

            return getOrderDTOS(orders);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getOrdersByCustomer(Customer customer){
         Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            criteria.add(Restrictions.eq("customer", customer));
            criteria.addOrder(org.hibernate.criterion.Order.asc("orderDate"));
            List<Order> orders = criteria.list();

            return getOrderDTOS(orders);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
    
    List<OrderDTO> getOrderDTOS(List<Order> orders) {
        List<OrderDTO> dTOs = new ArrayList<>();

        for (Order order : orders) {
            if (order.getPaymentStatus().getStatusCode().equals("200")) {
                OrderDTO orderDTO = new OrderDTO();

                AddressDTO addressDTO = new AddressDAO().getById(order.getAddress().getId());

                Customer customer = order.getCustomer();

                CustomerDTO customerDTO = new CustomerDTO();
                customerDTO.setEmail(customer.getEmail());
                customerDTO.setFname(customer.getFname());
                customerDTO.setGender(customer.getGender());
                customerDTO.setId(customer.getId());
                customerDTO.setLname(customer.getLname());
                customerDTO.setMobile(customer.getMobile());

                List<OrderItemDTO> orderItemDTOs = new ArrayList<>();

                for (OrderItem orderItem : order.getOrderItems()) {
                    OrderItemDTO orderItemDTO = new OrderItemDTO();
                    orderItemDTO.setDiscount(orderItem.getDiscount());
                    orderItemDTO.setId(orderItem.getId());
                    orderItemDTO.setQty(orderItem.getQty());
                    orderItemDTO.setTotaldiscount(orderItem.getTotaldiscount());
                    orderItemDTO.setUnitprice(orderItem.getUnitprice());
                    orderItemDTO.setProduct(new ProductDAO().getById(orderItem.getProduct().getId()));
                    orderItemDTOs.add(orderItemDTO);

                }

                List<OrderStatusDTO> orderStatusDTOs = new ArrayList<>();

                for (OrderHasOrderStatus ohos : order.getOrderHasOrderStatuses()) {
                    OrderStatusDTO orderStatusDTO = new OrderStatusDTO();
                    orderStatusDTO.setDate(ohos.getDate());
                    orderStatusDTO.setId(ohos.getOrderStatus().getId());
                    orderStatusDTO.setStatus(ohos.getOrderStatus().getStatus());
                    orderStatusDTOs.add(orderStatusDTO);
                }

                PaymentStatus paymentStatus = order.getPaymentStatus();

                PaymentStatusDTO paymentStatusDTO = new PaymentStatusDTO();
                paymentStatusDTO.setId(paymentStatus.getId());
                paymentStatusDTO.setStatus(paymentStatus.getStatus());
                paymentStatusDTO.setStatusCode(paymentStatus.getStatusCode());

                orderDTO.setAddresss(addressDTO);
                orderDTO.setOrderStatus(orderStatusDTOs);
                orderDTO.setOrderItems(orderItemDTOs);
                orderDTO.setCustomer(customerDTO);
                orderDTO.setDiscount(order.getDiscount());
                orderDTO.setEstimatedDeliveryDate(order.getEstimatedDeliveryDate());
                orderDTO.setOrderDeliveredCustomerDate(order.getOrderDeliveredCustomerDate());
                orderDTO.setOrderDate(order.getOrderDate());
                orderDTO.setLastStatus(order.getLastStatus());
                orderDTO.setOrderId(order.getOrderId());
                orderDTO.setPaymentStatus(paymentStatusDTO);
                orderDTO.setTotal(order.getTotal());
                orderDTO.setTrackingNumber(order.getTrackingNumber());
                orderDTO.setUpdateDate(order.getUpdateDate());
                dTOs.add(orderDTO);
            }
        }
        return dTOs;
    }

    public boolean confirmOrder(String id, SystemUser systemUser) {
        return updateOrder(id, systemUser, "Confirmed", null);
    }

    public boolean rejectOrder(String id, SystemUser systemUser) {
        return updateOrder(id, systemUser, "Rejected", null);
    }

    public boolean deliveryOrder(String id, String trackingNumber, SystemUser systemUser) {
        return updateOrder(id, systemUser, "Out For Delivery", trackingNumber);
    }

    public boolean deliveredOrder(String id, SystemUser systemUser) {
        return updateOrder(id, systemUser, "Delivered", null);
    }

    boolean updateOrder(String id, SystemUser systemUser, String status, String trackingNumber) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction transaction = session.beginTransaction();
            //Get current date of Sri Lanka
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("Asia/Colombo"));
            Date currentDate = calendar.getTime();

            Order order = (Order) session.createCriteria(Order.class)
                    .add(Restrictions.eq("orderId", id))
                    .uniqueResult();
            order.setLastStatus(status);
            if (trackingNumber != null && !trackingNumber.equals("")) {
                order.setTrackingNumber(trackingNumber);
            }

            OrderStatus orderStatus = new OrderStatusDAO().getOrderStatusByStatus(status);

            OrderHasOrderStatus orderHasOrderStatus = new OrderHasOrderStatus();

            orderHasOrderStatus.setDate(currentDate);
            orderHasOrderStatus.setSystemUser(systemUser);
            orderHasOrderStatus.setOrder(order);
            orderHasOrderStatus.setOrderStatus(orderStatus);

            OrderHasOrderStatusId orderHasOrderStatusId = new OrderHasOrderStatusId();
            orderHasOrderStatusId.setOrderId(id);
            orderHasOrderStatusId.setOrderStatusId(orderStatus.getId());

            orderHasOrderStatus.setId(orderHasOrderStatusId);

            session.persist(orderHasOrderStatus);
            session.merge(order);

            transaction.commit();

            return true;

        } catch (Exception e) {
            return false;
        } finally {
            session.close();
        }
    }

    public List<OrderDTO> getUnpaidOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(Order.class);
            List<Order> orders = criteria.list();
            List<OrderDTO> dTOs = new ArrayList<>();
            for (Order order : orders) {
                if (!order.getPaymentStatus().getStatusCode().equals("200")) {
                    OrderDTO orderDTO = new OrderDTO();

                    AddressDTO addressDTO = new AddressDAO().getById(order.getAddress().getId());

                    Customer customer = order.getCustomer();

                    CustomerDTO customerDTO = new CustomerDTO();
                    customerDTO.setEmail(customer.getEmail());
                    customerDTO.setFname(customer.getFname());
                    customerDTO.setGender(customer.getGender());
                    customerDTO.setId(customer.getId());
                    customerDTO.setLname(customer.getLname());
                    customerDTO.setMobile(customer.getMobile());

                    List<OrderItemDTO> orderItemDTOs = new ArrayList<>();

                    for (OrderItem orderItem : order.getOrderItems()) {
                        OrderItemDTO orderItemDTO = new OrderItemDTO();
                        orderItemDTO.setDiscount(orderItem.getDiscount());
                        orderItemDTO.setId(orderItem.getId());
                        orderItemDTO.setQty(orderItem.getQty());
                        orderItemDTO.setTotaldiscount(orderItem.getTotaldiscount());
                        orderItemDTO.setUnitprice(orderItem.getUnitprice());
                        orderItemDTO.setProduct(new ProductDAO().getById(orderItem.getProduct().getId()));
                        orderItemDTOs.add(orderItemDTO);

                    }

                    List<OrderStatusDTO> orderStatusDTOs = new ArrayList<>();

                    for (OrderHasOrderStatus ohos : order.getOrderHasOrderStatuses()) {
                        OrderStatusDTO orderStatusDTO = new OrderStatusDTO();
                        orderStatusDTO.setDate(ohos.getDate());
                        orderStatusDTO.setId(ohos.getOrderStatus().getId());
                        orderStatusDTO.setStatus(ohos.getOrderStatus().getStatus());
                        orderStatusDTOs.add(orderStatusDTO);
                    }

                    PaymentStatus paymentStatus = order.getPaymentStatus();

                    PaymentStatusDTO paymentStatusDTO = new PaymentStatusDTO();
                    paymentStatusDTO.setId(paymentStatus.getId());
                    paymentStatusDTO.setStatus(paymentStatus.getStatus());
                    paymentStatusDTO.setStatusCode(paymentStatus.getStatusCode());

                    orderDTO.setAddresss(addressDTO);
                    orderDTO.setOrderStatus(orderStatusDTOs);
                    orderDTO.setOrderItems(orderItemDTOs);
                    orderDTO.setCustomer(customerDTO);
                    orderDTO.setDiscount(order.getDiscount());
                    orderDTO.setEstimatedDeliveryDate(order.getEstimatedDeliveryDate());
                    orderDTO.setOrderDeliveredCustomerDate(order.getOrderDeliveredCustomerDate());
                    orderDTO.setOrderDate(order.getOrderDate());
                    orderDTO.setOrderId(order.getOrderId());
                    orderDTO.setPaymentStatus(paymentStatusDTO);
                    orderDTO.setTotal(order.getTotal());
                    orderDTO.setTrackingNumber(order.getTrackingNumber());
                    orderDTO.setUpdateDate(order.getUpdateDate());
                    dTOs.add(orderDTO);
                }
            }
            return dTOs;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public OrderDTO getOrderDtoByCusomerAndId(Customer customer , String id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            
            Order order = (Order) session.createCriteria(Order.class)
                    .add(Restrictions.eq("orderId", id))
                    .add(Restrictions.eq("customer", customer))
                    .uniqueResult();
            
            if (order.getPaymentStatus().getStatusCode().equals("200")) {
                OrderDTO orderDTO = new OrderDTO();

                AddressDTO addressDTO = new AddressDAO().getById(order.getAddress().getId());


                CustomerDTO customerDTO = new CustomerDTO();
                customerDTO.setEmail(customer.getEmail());
                customerDTO.setFname(customer.getFname());
                customerDTO.setGender(customer.getGender());
                customerDTO.setId(customer.getId());
                customerDTO.setLname(customer.getLname());
                customerDTO.setMobile(customer.getMobile());

                List<OrderItemDTO> orderItemDTOs = new ArrayList<>();

                for (OrderItem orderItem : order.getOrderItems()) {
                    OrderItemDTO orderItemDTO = new OrderItemDTO();
                    orderItemDTO.setDiscount(orderItem.getDiscount());
                    orderItemDTO.setId(orderItem.getId());
                    orderItemDTO.setQty(orderItem.getQty());
                    orderItemDTO.setTotaldiscount(orderItem.getTotaldiscount());
                    orderItemDTO.setUnitprice(orderItem.getUnitprice());
                    orderItemDTO.setProduct(new ProductDAO().getById(orderItem.getProduct().getId()));
                    orderItemDTOs.add(orderItemDTO);

                }

                List<OrderStatusDTO> orderStatusDTOs = new ArrayList<>();

                for (OrderHasOrderStatus ohos : order.getOrderHasOrderStatuses()) {
                    OrderStatusDTO orderStatusDTO = new OrderStatusDTO();
                    orderStatusDTO.setDate(ohos.getDate());
                    orderStatusDTO.setId(ohos.getOrderStatus().getId());
                    orderStatusDTO.setStatus(ohos.getOrderStatus().getStatus());
                    orderStatusDTOs.add(orderStatusDTO);
                }

                PaymentStatus paymentStatus = order.getPaymentStatus();

                PaymentStatusDTO paymentStatusDTO = new PaymentStatusDTO();
                paymentStatusDTO.setId(paymentStatus.getId());
                paymentStatusDTO.setStatus(paymentStatus.getStatus());
                paymentStatusDTO.setStatusCode(paymentStatus.getStatusCode());

                orderDTO.setAddresss(addressDTO);
                orderDTO.setOrderStatus(orderStatusDTOs);
                orderDTO.setOrderItems(orderItemDTOs);
                orderDTO.setCustomer(customerDTO);
                orderDTO.setDiscount(order.getDiscount());
                orderDTO.setEstimatedDeliveryDate(order.getEstimatedDeliveryDate());
                orderDTO.setOrderDeliveredCustomerDate(order.getOrderDeliveredCustomerDate());
                orderDTO.setOrderDate(order.getOrderDate());
                orderDTO.setLastStatus(order.getLastStatus());
                orderDTO.setOrderId(order.getOrderId());
                orderDTO.setPaymentStatus(paymentStatusDTO);
                orderDTO.setTotal(order.getTotal());
                orderDTO.setTrackingNumber(order.getTrackingNumber());
                orderDTO.setUpdateDate(order.getUpdateDate());
                return orderDTO;
            }
            return null;
        } catch (Exception e) {
            return null;
        }finally{
            session.close();
        }
    }
    
    public OrderItemDTO getOrderByIdAndCustomer(int id, Customer customer) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {

            List<Order> orders = session.createCriteria(Order.class)
                    .add(Restrictions.eq("customer", customer))
                    .list();
            for (Order order : orders) {
                for (OrderItem orderItem : order.getOrderItems()) {
                    if (orderItem.getId() == id) {
                        OrderDTO orderDTO = new OrderDTO();

                        AddressDTO addressDTO = new AddressDAO().getById(order.getAddress().getId());

                        CustomerDTO customerDTO = new CustomerDTO();
                        customerDTO.setEmail(customer.getEmail());
                        customerDTO.setFname(customer.getFname());
                        customerDTO.setGender(customer.getGender());
                        customerDTO.setId(customer.getId());
                        customerDTO.setLname(customer.getLname());
                        customerDTO.setMobile(customer.getMobile());

                        OrderItemDTO orderItemDTO = new OrderItemDTO();
                        orderItemDTO.setDiscount(orderItem.getDiscount());
                        orderItemDTO.setId(orderItem.getId());
                        orderItemDTO.setQty(orderItem.getQty());
                        orderItemDTO.setTotaldiscount(orderItem.getTotaldiscount());
                        orderItemDTO.setUnitprice(orderItem.getUnitprice());
                        orderItemDTO.setProduct(new ProductDAO().getById(orderItem.getProduct().getId()));

                        List<OrderStatusDTO> orderStatusDTOs = new ArrayList<>();

                        for (OrderHasOrderStatus ohos : order.getOrderHasOrderStatuses()) {
                            OrderStatusDTO orderStatusDTO = new OrderStatusDTO();
                            orderStatusDTO.setDate(ohos.getDate());
                            orderStatusDTO.setId(ohos.getOrderStatus().getId());
                            orderStatusDTO.setStatus(ohos.getOrderStatus().getStatus());
                            orderStatusDTOs.add(orderStatusDTO);
                        }

                        PaymentStatus paymentStatus = order.getPaymentStatus();

                        PaymentStatusDTO paymentStatusDTO = new PaymentStatusDTO();
                        paymentStatusDTO.setId(paymentStatus.getId());
                        paymentStatusDTO.setStatus(paymentStatus.getStatus());
                        paymentStatusDTO.setStatusCode(paymentStatus.getStatusCode());

                        orderDTO.setAddresss(addressDTO);
                        orderDTO.setOrderStatus(orderStatusDTOs);
                        orderDTO.setCustomer(customerDTO);
                        orderDTO.setLastStatus(order.getLastStatus());
                        orderDTO.setDiscount(order.getDiscount());
                        orderDTO.setEstimatedDeliveryDate(order.getEstimatedDeliveryDate());
                        orderDTO.setOrderDeliveredCustomerDate(order.getOrderDeliveredCustomerDate());
                        orderDTO.setOrderDate(order.getOrderDate());
                        orderDTO.setOrderId(order.getOrderId());
                        orderDTO.setPaymentStatus(paymentStatusDTO);
                        orderDTO.setTotal(order.getTotal());
                        orderDTO.setTrackingNumber(order.getTrackingNumber());
                        orderDTO.setUpdateDate(order.getUpdateDate());
                        orderItemDTO.setOrder(orderDTO);
                        return orderItemDTO;
                    }
                }
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }

    }
}
