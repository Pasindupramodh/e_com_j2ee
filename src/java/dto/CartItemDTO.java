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
public class CartItemDTO {

    private Integer id;
    private int variantId;
    private int qty;
    private Double unitprice;
    private Double total;
    private Double unitDiscount;
    private Double discount;
    private ProductDTO productDTO;
    
}
