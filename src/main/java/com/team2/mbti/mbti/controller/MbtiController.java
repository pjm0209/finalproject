package com.team2.mbti.mbti.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/mbti")
public class MbtiController {
	private static final Logger logger = LoggerFactory.getLogger(MbtiController.class);
	
	@RequestMapping("/mbti")
	public String mbtiList() {
		logger.info("mbti 목록 페이지");
		
		return "admin/mbti/mbti";
	}
}