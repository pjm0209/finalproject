package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/member/forgot-id")
	public String forgot_id() {
		logger.info("아이디 찾기 화면");
		
		return "main/member/forgot-id";
	}
	
	@RequestMapping("/member/forgot-pwd")
	public String forgot_pwd() {
		logger.info("비밀번호 찾기 화면");
		
		return "main/member/forgot-pwd";
	}
	
	@ResponseBody
	@RequestMapping("/member/checkId")
	public int checkId(@RequestParam String userid, Model model) {
		//1
		logger.info("아이디 중복확인 파라미터, userid={}", userid);

		//2
		int result=0;
		result = memberService.selectCheckId(userid);
		logger.info("중복확인 결과 result={}", result);
		
		//4
		return result;
	}
}