package com.team2.mbti.main.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.board.model.BoardService;
import com.team2.mbti.member.model.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private final MemberService memberService;
	private final BoardService boardService;
	
	@GetMapping("/index")
	public String index_get(@RequestParam(required = false, defaultValue = "N") String kakaoIdFlag,HttpSession session, Model model) {
		String userid=(String)session.getAttribute("userid");
		logger.info("메인 index 페이지, 파라미터 userid={}, kakaoIdFlag={}",userid,kakaoIdFlag);
		
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