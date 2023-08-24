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

}
