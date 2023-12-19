/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;
import lombok.Data;

/**
 *
 * @author REDTECH
 */
@Data
public class OrderStatusDTO {
    private int id;
     private SystemUserDTO systemUser;
     private String status;
     private Date date;
}
