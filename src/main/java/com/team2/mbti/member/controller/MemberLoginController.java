package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.member.model.MemberService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MemberLoginController {
	private static final Logger logger=LoggerFactory.getLogger(MemberLoginController.class);

	private final MemberService memberService;
	
	@GetMapping("/main")
	public String login() {
		logger.info("회원 로그인 화면");
		
		return "login/memberLogin";
	}
	
	@PostMapping("/main")
	public String login_post(@RequestParam String userid, @RequestParam String pwd,
			@RequestParam(required = false) String chkSave,
			HttpServletRequest request, HttpServletResponse response, 
			Model model) {
		
		logger.info("로그인 처리, 파라미터 userid={}, pwd={}, chkSave={}", 
				userid, pwd, chkSave);
		
		int result=memberService.loginCheck(userid, pwd);
		logger.info("로그인 처리 결과, result={}", result);
		
		String msg="로그인 처리 실패", url="/login/login";
		if(result==MemberService.LOGIN_OK) {
			msg=userid + "님 로그인되었습니다.";
			url="/";
			
			HttpSession session=request.getSession();
			session.setAttribute("userid", userid);
			
			Cookie ck = new Cookie("ck_userid", userid);
			ck.setPath("/");
			if(chkSave!=null) { 
				ck.setMaxAge(1000*24*60*60); 
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.USERID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		
		session.invalidate();
		
		return "redirect:/";
	}
}
