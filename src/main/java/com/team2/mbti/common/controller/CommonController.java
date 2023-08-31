package com.team2.mbti.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	
	@GetMapping("/loginFirst")
	public String loginFirst(Model model) {
		model.addAttribute("msg", "먼저 로그인하세요!");
		model.addAttribute("url", "/admin/login");
		
		return "common/message";
	}
	
	@GetMapping("/loginFirst2")
	public String loginFirst2(Model model) {
		model.addAttribute("msg", "먼저 로그인하세요!");
		model.addAttribute("url", "/main/member/memberLogin");
		
		return "common/message";
	}
}