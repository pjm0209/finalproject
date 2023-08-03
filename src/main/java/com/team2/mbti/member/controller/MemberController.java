package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/memberList")
	public String memberList() {
		logger.info("회원 목록 페이지");
		
		return "admin/member/memberList";
	}
	
	@RequestMapping("/member")
	public String member() {
		logger.info("회원 관리 페이지");
		
		return "admin/member/memberList";
	}
}
