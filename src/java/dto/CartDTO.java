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
public class CartDTO {
    private Double total;
     private Double discount;
     private Date createdAt;
     private Date updatedAt;
     private List<CartItemDTO> cartItemDTOs;
}
