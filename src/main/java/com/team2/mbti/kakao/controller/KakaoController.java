package com.team2.mbti.kakao.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.kakao.model.KakaoService;
import com.team2.mbti.member.model.MemberDAO;
import com.team2.mbti.member.model.MemberService;
import com.team2.mbti.member.model.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/oauth")
@RequiredArgsConstructor
public class KakaoController{

	private static final Logger logger = LoggerFactory.getLogger(KakaoController.class);
	
	private final KakaoService kakaoService;
	private final MemberDAO memberDao;
	
	@RequestMapping("/kakao")
	public String kakaoRegister(@RequestParam String code, HttpServletRequest request,Model model) {
		logger.info("카카오 로그인 처리, code={}", code);
		
		String access_Token = kakaoService.getKakaoAccessToken(code);
		logger.info("토큰 받아오기 access_Token={}", access_Token);
				
		Map<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
		logger.info("카카오 회원 정보 불러오기 userInfo={}", userInfo);
		
		String id=(String)userInfo.get("userid");
		String name=(String)userInfo.get("name");
		
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setUserid(id);
		
		int cnt=memberDao.getKakaoIdCount(vo);
		logger.info("로그인 여부 cnt={}",cnt);
		
		MemberVO vo2=memberDao.selectByUserid(id);
		logger.info("회원 번호 뽑아오기 결과 vo2={}",vo2);
		
		String msg="로그인 실패",url="/main/index";
		if(cnt>0) {
			msg="로그인 성공";
			url="/main/index?kakaoIdFlag=Y";
			HttpSession session =request.getSession();
			
			session.setAttribute("no", vo2.getNo());
			session.setAttribute("name", name);
			session.setAttribute("userid", id);
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}

