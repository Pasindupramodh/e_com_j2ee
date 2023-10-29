/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;
import lombok.Data;
import model.UserType;

/**
 *
 * @author pasin
 */
@Data
public class SystemUserDTO {

    private Integer id;
    private Integer loginId;
    
    private String userType;
    private String fname;
    private String lname;
    private String mobile;
    private String email;
    private Date createdAt;
    private Date updatedAt;
    private boolean isActive;
    private String updatedByName;
    private Integer updatedById;
    private String createdByName;
    private Integer createdById;
}
