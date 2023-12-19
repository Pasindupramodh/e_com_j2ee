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
public class PaymentStatusDTO {

    private int id;
    private String statusCode;
    private String status;
}
