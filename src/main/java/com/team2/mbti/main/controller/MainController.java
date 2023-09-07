package com.team2.mbti.main.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.board.model.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private final BoardService boardService;
	
	@GetMapping("/index")
	public String index_get(Model model) {
		logger.info("메인화면 출력");
		
		List<Map<String, Object>> faqList = boardService.selectFaqList();
		
		model.addAttribute("faqList", faqList);
		
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