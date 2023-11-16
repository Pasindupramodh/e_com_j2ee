/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pasin
 */
public class TestInputValidation {
     static boolean validateInputs(String... s ){
        for(String s1 : s){
            if(s1 == null || s1.isEmpty()){
                return false;
            }
        }
        return true;
    }
     public static void main(String[] args) {
         System.out.println(validateInputs("a","","dds"));
    }
}
