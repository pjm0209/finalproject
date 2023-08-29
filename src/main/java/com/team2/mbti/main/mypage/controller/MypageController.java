package com.team2.mbti.main.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/mypage")
	public String mypage() {
		logger.info("마이페이지");
		
		return "main/mypage/mypage";
	}
	
	@RequestMapping("/mbtiResult")
	public String mbtiResult() {
		logger.info("마이페이지 - 나의 mbti 결과 페이지");
		
		return "main/mypage/mbtiResult";
	}
}
