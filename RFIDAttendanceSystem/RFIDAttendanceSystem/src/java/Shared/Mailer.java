/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Shared;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;    
/**
 *
 * @author mohnish
 */
public class Mailer {
 
   
    public synchronized void sendMail(String to,String subject,String mailMessage){
            //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "587");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "587");    
          props.put("mail.smtp.starttls.enable", "true");
          //get Session   
          Session session = Session.getInstance(props,    
           new javax.mail.Authenticator() {    
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication("niit.vpe.studentservices@gmail.com","P*1niitvpe#2");  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(subject); 
           message.setText(mailMessage);    
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully : "+to);    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
    }
    
    
    
    
    
    
    
}
