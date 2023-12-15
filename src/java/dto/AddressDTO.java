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
public class AddressDTO {
    private Integer id;
     private CityDTO city;
     private String fname;
     private String lname;
     private String phone;
     private String addressLine1;
     private String addressLine2;
     private String zipcode;
     private Boolean isDefault;
}
