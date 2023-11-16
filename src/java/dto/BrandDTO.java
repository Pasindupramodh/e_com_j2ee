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
public class BrandDTO {

    private Integer id;
    private CategoryDTO category;
    private String brandName;
    private String brandDesc;
    private String brandImage;
}
