package com.team2.mbti.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.admin.model.AdminService;
import com.team2.mbti.member.model.MemberService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminLoginController {	
	private static final Logger logger=LoggerFactory.getLogger(AdminLoginController.class);
	
	private final AdminService adminService;

	@GetMapping("/login")
	public String login_get() {
		logger.info("관리자 로그인 화면");
		return "/admin/login";
	}
	
	@PostMapping("/login")
	public String adminLogin_post(@RequestParam String adminId, @RequestParam String adminPwd,
			@RequestParam(required = false) String chkSave,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		
		logger.info("관리자 로그인 처리, 파라미터 adminId={}, adminPwd={}, chkSave={}",
				adminId, adminPwd, chkSave);
		
		int result=adminService.loginCheck(adminId, adminPwd);
		logger.info("로그인 체크 결과, result={}", result);
		
		String msg="로그인 체크 실패", url="/admin/login";
		if(result==MemberService.LOGIN_OK) {
			msg=adminId + " 관리자님 로그인되었습니다.";
			url="/admin/index";
			
			HttpSession session=request.getSession();
			session.setAttribute("adminId", adminId);
			
			request.getSession().setAttribute("adminId", adminId);
			
			Cookie ck = new Cookie("ck_adminId", adminId);
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
			msg="아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		
		session.setAttribute("adminId", "");	
		
		return "redirect:/admin/login";
				
	}

}
