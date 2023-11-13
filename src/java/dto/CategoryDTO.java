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
public class CategoryDTO {
    private int id;
    private String categoryName;
    private String categoryDesc;
    private String categoryIcon;
    private boolean status;
}
