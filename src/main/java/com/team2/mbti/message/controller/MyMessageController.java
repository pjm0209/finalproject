package com.team2.mbti.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/mypage")
public class MyMessageController {
	private static final Logger logger = LoggerFactory.getLogger(MyMessageController.class);
	
	@GetMapping("/myMessage")
	public String myMessage_get() {
		logger.info("내 쪽지함 페이지");
		
		return "main/mypage/myMessage";
	}
}
