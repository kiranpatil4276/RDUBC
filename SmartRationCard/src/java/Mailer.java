
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class  Mailer {
	
	static String subject = "Request Confirmation" ;
	
	public static void setSubject(String sub){
		subject = sub;
	}

   public static void sendEmail(String mssg, String emailid) {
        try {
            String sender="testingproject2017.18@gmail.com";
        	// String sender="shindetrupti302@gmail.com";
            //String pass="shindetrupti203";
        	 String pass="testingpassword22@";
        	Properties props = new Properties();
        	
        	
            props.put("mail.transport.protocol", "smtps");
            props.put("mail.smtps.host", "smtp.gmail.com");
            props.put("mail.smtps.auth", "true");
            props.put("mail.smtps.quitwait", "false");

            Session mailSession = Session.getDefaultInstance(props);
            mailSession.setDebug(true);
            Transport transport = mailSession.getTransport();

            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject);
            message.setContent(mssg, "text/plain");
            message.setFrom(new InternetAddress(sender));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailid));
            
           
           
            transport.connect("smtp.gmail.com", 465, sender, pass);
            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
            transport.close();

        } catch (Exception ert) {
        	System.out.println(ert);
            System.out.println("\n Email Sending Error\n No Internet connection.");
        }
    }
/*    
   public static void main(String args[]){
	   Mailer.sendEmail("this is a trial mail", "achyutwalse007@gmail.com");
   }
   */
}
