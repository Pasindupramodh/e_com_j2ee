/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import lombok.Data;

/**
 *
 * @author REDTECH
 */
@Data
public class OrderItemDTO {

    private Integer id;
    private ProductDTO product;
    private Double qty;
    private Double unitprice;
    private Double discount;
    private Double totaldiscount;
    private OrderDTO order;
}
