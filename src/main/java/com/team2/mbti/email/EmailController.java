package com.team2.mbti.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/member")
@RequiredArgsConstructor
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final EmailSender emailSender;
	
	@RequestMapping("/emailTest")
	public void email() {
		logger.info("화면 보기");
	}
	
	@RequestMapping("/sendEmail")
	public String sendEmail() {
		logger.info("시작");
		String receiver ="kiki4701@naver.com"; //받는 사람의 이메일 주소
		String subject="문의에 대한 답변입니다. 안녕하세요";
		String content="왜 그것도 못하고 있어요";
		String sender="yongjin818@naver.com";	//보내는 사람의 이메일 주소
					
		//앞서 설정한 본인의 Naver Email
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");
		} catch (MessagingException e) {
			logger.info("메일 발송 실패 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	

}
