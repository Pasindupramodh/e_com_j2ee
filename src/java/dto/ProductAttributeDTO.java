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
public class ProductAttributeDTO {
    private Integer id;
     private ProductDTO product;
     private String attributeName;
     private String attributeType;
     private List<AttributeVariantDTO> attributeVariants;
}
