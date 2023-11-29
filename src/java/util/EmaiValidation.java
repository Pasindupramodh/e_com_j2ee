/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ASUS
 */
public class EmaiValidation {
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",Pattern.CASE_INSENSITIVE);
    public static Boolean validate(String emailStr){
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
        
    }
    public static void main(String[] args) {
        System.out.println(validate("pasindu@gmail.com"));
    }
}

class pi{
    public static final Pattern VALID_NIC_REGEX=Pattern.compile("^[0-9]{9}+[VvxX]{1,1}$");
    
    public static boolean validateNIC(String NIC){
        Matcher matcher = VALID_NIC_REGEX.matcher(NIC);
        return matcher.find();
    }
   
}
class MobileValidation {
    public static final Pattern VALID_MOBILE_REGEX = 
            Pattern.compile("^(?:[+0]9)?[0-9]{10}$",Pattern.CASE_INSENSITIVE);
    public static Boolean validateNumber(String emailStr){
        Matcher matcher = VALID_MOBILE_REGEX.matcher(emailStr);
        return matcher.find();
        
    }
    
}
