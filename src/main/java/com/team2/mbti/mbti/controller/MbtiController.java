package com.team2.mbti.mbti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/mbti")
public class MbtiController {
	
	@RequestMapping("/mbti")
	public String mbtiList() {
		
		return "admin/mbti/mbti";
	}
}
