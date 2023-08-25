package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/member")
@RequiredArgsConstructor
public class MemberMyPageController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberMyPageController.class);
	
	private final MemberService memberService;
	
	@RequestMapping("/mypage")
	public String mypage() {
		logger.info("마이페이지 화면");
		
		return "main/member/mypage";
	}
	
	@RequestMapping("/memberEdit")
	public String memberEdit() {
		logger.info("회원정보 수정");
		
		return "main/member/memberEdit";
	}

}
