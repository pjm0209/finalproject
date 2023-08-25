package com.team2.mbti.main.education.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/education")
public class MainEducationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainEducationController.class);

	@RequestMapping("/list")
	public String eduList() {
		logger.info("교육 리스트 페이지 보여주기");
		
		return "main/education/list";
	}
	
	
	
	
}
