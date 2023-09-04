package com.team2.mbti.email;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class EmailSender {

	private final JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, String receiver, 
			String sender) throws MessagingException {
		System.out.println("ㅇㅘㅆ니?");
		MimeMessage message = mailSender.createMimeMessage();
		message.setSubject(subject);
		message.setText(content);
		message.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		message.setFrom(new InternetAddress(sender));
		mailSender.send(message);		
		System.out.println("ㅇㅘㅆ니?22");
	}
	
    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        
        String str = "";

        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
}








