package utils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class EmailUtil {
    public static boolean sendEmail(String host, String port, final String email,final String password,
                                    String toAddress,String subject, String message) throws AddressException, MessagingException{
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host); //SMTP Host
        properties.put("mail.smtp.port", port); //TLS Port
        properties.put("mail.smtp.auth", "true"); //enable authentication
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        };
        Session session = Session.getInstance(properties, auth);

        Message msg =  new MimeMessage(session);

        msg.setFrom(new InternetAddress(email));
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO,toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(message);
        try{
            Transport.send(msg);
        }catch (Exception e){
            return false;
        }
        return true;
    }
    public static String getRandom(){
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d",number);
    }
}
