/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pasin
 */
public class TestUrl {
    public static void main(String[] args) {
        String url = "/e_com_j2ee/admin/index.jsp";
        System.out.println(url.substring(url.lastIndexOf("/")+1, url.length()));
    }
}
