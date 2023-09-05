package com.team2.mbti.introduction.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/Introduction")
@RequiredArgsConstructor
public class MainIntroductionController {
	private static final Logger logger = LoggerFactory.getLogger(MainIntroductionController.class);
	
	@RequestMapping("/info")
	public String info() {
		logger.info("소개 화면");
		
		return "main/Introduction/info";	
	}
	
	@RequestMapping("/Vision")
	public String Vision() {
		logger.info("비전  화면");
		
		return "main/Introduction/Vision";	
	}
	

}
