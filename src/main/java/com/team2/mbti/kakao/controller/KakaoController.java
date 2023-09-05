package com.team2.mbti.kakao.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.member.model.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class KakaoController{

	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);
	
	private final MemberService memberService;
	private final KakaoService kakaoService;
	
	@RequestMapping("/")
	public String kakaoLogin(HttpSession session, @RequestParam("code") String code) {
		logger.info("카카오 로그인 처리, code={}", code);
		
		String accessToken = getKakaoAccessToken(code);
		session.setAttribute("access_token", access_Token); //로그아웃 할때 사용 
				
		HashMap<String, Object> userInfo = KakaoService.getUserInfo(access_Token);
		
		
		

		return "";
		
	}
}

