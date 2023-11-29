/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.List;
import lombok.Data;

/**
 *
 * @author pasin
 */
@Data
public class ProductDTO {
    private Integer id;
     private BrandDTO brand;
     private String productName;
     private Double qty;
     private Double productPrice;
     private Double discountPrice;
     private String shortDescription;
     private String description;
     private Boolean published;
     private List<TagDTO> tags;
     private List<ProductAttributeDTO> productAttributes;
     private List<GalleryDTO> galleries;
}
