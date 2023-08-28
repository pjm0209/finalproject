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

	@RequestMapping("/info")
	public String eduInfo() {
		logger.info("교육 소개 페이지 보여주기");
		
		return "main/education/info";
	}

	
	@RequestMapping("/list")
	public String eduList() {
		logger.info("교육 목록 페이지 보여주기");
		
		return "main/education/list";
	}
	
	
	@RequestMapping("/location")
	public String eduLocation() {
		logger.info("교육장 위치 페이지 보여주기");
		
		return "main/education/location";
	}
	
}
