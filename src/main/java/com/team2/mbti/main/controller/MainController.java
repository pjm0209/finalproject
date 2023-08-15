package com.team2.mbti.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@GetMapping("/index")
	public String index_get() {
		return "main/index";
	}
	
	@GetMapping("/portfolio-details")
	public String portfolio_details_get() {
		return "main/portfolio-details";
	}
	
	@GetMapping("/inner-page")
	public String inner_page_get() {
		return "main/inner-page";
	}
	
	@RequestMapping("/top")
	public String test_top() {
		return "main/inc/top";
	}
	
	@RequestMapping("/bottom")
	public String test_bottom() {
		return "main/inc/bottom";
	}
}