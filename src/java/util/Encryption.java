/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author pasin
 */
public class Encryption {
    public static String encrypt(String source){
        String md5 = "";
        try{
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(source.getBytes(), 0, source.length());
            BigInteger integer = new BigInteger(1, digest.digest());
            md5 = integer.toString(16);
        }catch (Exception ex){
            return null;
        }

        return md5;
    }
}