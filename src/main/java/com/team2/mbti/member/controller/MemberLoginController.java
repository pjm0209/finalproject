package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.member.model.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MemberLoginController {
	private static final Logger logger=LoggerFactory.getLogger(MemberLoginController.class);
	
	private final MemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		logger.info("로그인 화면");
		
		return "main/member/memberLogin";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberRegister")
	public String register() {
		logger.info("회원가입 화면");
				
		return "main/member/memberRegister";
	}
	
	
}







