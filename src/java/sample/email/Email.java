/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.email;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import sample.tea.Cart;
import sample.tea.TeaDTO;

/**
 *
 * @author DELL
 */
public class Email {

    public boolean sendEmail(String email, String name, Cart cart) {
        boolean test = false;

        String toEmail = email;
        String fromEmail = "minhhieutb321@gmail.com";
        String password = "mhezhvupjnessnss";

        try {
            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            //set email message details
            MimeMessage mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject("Purchase confirmation letter from MERI:");
            String message = name+",\n"
                    + "Thank you for ordering from Meri.\n"
                    + "\n"
                    + "Your order "+cart.getSize()+ " has been shipped.Include:";
            for (TeaDTO tea : cart.getCart().values()) {
                message += "\n - " + tea.getName() + " - Quantity: " + tea.getQuantity();
            }
            message += "\nTotal: " + cart.getTotal()+"$"+ "\nThank you for trusting our products!!!";
            //set message text
            mess.setText(message, "utf-8");
            Transport.send(mess);
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

}
