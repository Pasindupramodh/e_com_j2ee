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
public class CustomerDTO {
    private Integer id;
     private String fname;
     private String lname;
     private String mobile;
     private String email;
     private String gender;
     private String status;
     private AddressDTO address;
}
