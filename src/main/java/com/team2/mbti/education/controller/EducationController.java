package com.team2.mbti.education.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/education")
public class EducationController {
	private static final Logger logger = LoggerFactory.getLogger(EducationController.class);
	
	@GetMapping("/list")
	public String list_get(Model model) {
		logger.info("교육 리스트 페이지 보여주기");
		
		model.addAttribute("title", "교육 관리");
		
		return "admin/education/list";
		
	}
	
	@GetMapping("/applicantList")
	public String appliList_get(Model model) {
		logger.info("신청자 관리 페이지 보여주기");
		
		model.addAttribute("title", "신청자 조회");
		
		return "admin/education/applicantList";
		
	}
	
	@GetMapping("/location")
	public String location_get(Model model) {
		logger.info("교육장 관리 페이지 보여주기");
		
		model.addAttribute("title", "교육장 관리");
		
		return "admin/education/location";
		
	}
}
