/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import lombok.Data;

/**
 *
 * @author pasin
 */
@Data
public class AttributeVariantDTO {
    private Integer id;
     private GalleryDTO gallery;
     private ProductAttributeDTO productAttribute;
     private String variantName;
     private Double price;
     private Double discountPrice;
     private Integer qty;
     
}
