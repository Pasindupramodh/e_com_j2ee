/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;
import java.util.List;
import lombok.Data;

/**
 *
 * @author REDTECH
 */
@Data
public class OrderDTO {

    private String orderId;
    private CustomerDTO customer;
    private PaymentStatusDTO paymentStatus;
    private AddressDTO addresss;
    private Date orderDate;
    private Date updateDate;
    private Date estimatedDeliveryDate;
    private Double total;
    private Double discount;
    private String trackingNumber;
    private String lastStatus;
    private Date orderDeliveredCustomerDate;
    private List<OrderStatusDTO> orderStatus;
    private List<OrderItemDTO> orderItems;
}
