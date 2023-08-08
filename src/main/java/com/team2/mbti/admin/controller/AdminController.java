package com.team2.mbti.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.admin.model.AdminService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService adminService;
	
	@GetMapping("/index")
	public String index_get(Model model) {
		model.addAttribute("title", "관리자 페이지");
		
		return "admin/index";
	}

	@GetMapping("/login")
	public String login_get() {
		return "admin/login";
	}

	@GetMapping("/register")
	public String register_get(Model model) {
		
		return "admin/register";
	}

	@GetMapping("/tables")
	public String tables_get(Model model) {
		model.addAttribute("title", "회원목록");
		
		return "admin/tables";
	}

	@GetMapping("/cards")
	public String cards_get() {
		return "admin/cards";
	}

	@GetMapping("/charts")
	public String charts_get() {
		return "admin/charts";
	}
	
	@GetMapping("/forgot-password")
	public String forgot_password_get(Model model) {
		model.addAttribute("title", "비밀번호 찾기");
		
		return "admin/forgot-password";
	}
	
	@GetMapping("/buttons")
	public String buttons_get() {
		return "admin/buttons";
	}
	
	@GetMapping("404")
	public String a404_get() {
		return "admin/404";
	}
	
	@GetMapping("blank")
	public String blank_get() {
		return "admin/blank";
	}

	@GetMapping("/utilities-animation")
	public String utilities_animation_get() {
		return "admin/utilities-animation";
	}

	@GetMapping("/utilities-border")
	public String utilities_border_get() {
		return "admin/utilities-border";
	}

	@GetMapping("/utilities-color")
	public String utilities_color_get() {
		return "admin/utilities-color";
	}

	@GetMapping("/utilities-other")
	public String utilities_other_get() {
		return "admin/utilities-other";
	}
	

}