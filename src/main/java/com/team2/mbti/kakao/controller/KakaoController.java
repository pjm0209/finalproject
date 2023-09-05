package com.team2.mbti.kakao.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.kakao.model.KakaoService;
import com.team2.mbti.member.model.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/oauth")
@RequiredArgsConstructor
public class KakaoController{

	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);
	
	private final MemberService memberService;
	private final KakaoService kakaoService;
	
	@RequestMapping("/")
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpSession session) {
		logger.info("카카오 로그인 처리, code={}", code);
		
		String access_Token = kakaoService.getKakaoAccessToken(code);
		logger.info("토큰 받아오기 access_Token={}", access_Token);
		
		session.setAttribute("access_token", access_Token); //로그아웃 할때 사용
		logger.info("로그아웃 처리 access_Token={}", access_Token);
				
		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
		logger.info("카카오 회원 정보 불러오기 userInfo={}", userInfo);
		
		return "redirect:/";
		
	}


}

