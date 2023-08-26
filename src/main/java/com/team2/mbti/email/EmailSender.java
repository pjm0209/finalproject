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
			String sender) throws MessagingException{
		MimeMessage message = mailSender.createMimeMessage();
		message.setSubject(subject);	//제목
		message.setText(content);	//내용
		message.setRecipient(RecipientType.TO, new InternetAddress(receiver));	//받는사람
		message.setFrom(new InternetAddress(sender));	//보내는사람
		mailSender.send(message);	//메일 보내기
		
	}
}
