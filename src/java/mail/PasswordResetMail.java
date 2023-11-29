/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mail;

import io.rocketbase.mail.model.HtmlTextEmail;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;

/**
 *
 * @author pasin
 */



public class PasswordResetMail extends Mailable{
    private String to;
    private String token;

    public PasswordResetMail(String to, String token) {
        this.to = to;
        this.token = token;
    }

    @Override
    public void build(Message message) throws MessagingException {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("Password reset Email");

        String appUrl = "http://localhost:8082/e_com_j2ee";
        String verifyUrl = appUrl+"/admin/ResetPassword.jsp?token=" + token;

        // generate html/text content
        HtmlTextEmail content = getEmailTemplateBuilder()
                .header()
                .and()
                .text("Reset Password").h1().center().and()
                .text("To reset your password click on the button below.This link only valid for 30 Minutes").center().and()
                .text("If you did not make this request, then you can ignore this email.").center().and()
                .button("Reset Password", verifyUrl).red().and()
                .text("If you have trouble paste this link into your browser").center().and()
                .html("<a href=\""+verifyUrl+"\">"+verifyUrl+"</a>").and()
                .copyright(appUrl).url(appUrl).suffix(". All rights reserved.")
                .build();

        message.setContent(content.getHtml(), "text/html");

    }
}