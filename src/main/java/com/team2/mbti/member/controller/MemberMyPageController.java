package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.member.model.MemberService;
import com.team2.mbti.member.model.MemberVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/member")
@RequiredArgsConstructor
public class MemberMyPageController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberMyPageController.class);
	
	private final MemberService memberService;
		
	@GetMapping("/memberEdit")
	public String memberEdit_get(HttpSession session, Model model) {
		
		String userid=(String) session.getAttribute("userid");
		
		logger.info("회원 정보 수정 화면, 파라미터 userid={}", userid);
		
		MemberVO membervo = memberService.selectByUserid(userid);
		logger.info("회원 정보 수정 화면, 정보 조회결과 membervo={}", membervo);
				
		model.addAttribute("membervo",membervo);
		
		return "main/member/memberEdit";
	}
	
	@PostMapping("/memberEdit")
	public String memberEdit_post(@ModelAttribute MemberVO membervo, HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userid");
		membervo.setUserid(userid);

		logger.info("회원 수정 처리, 파라미터 vo={},", membervo);

		int result = memberService.loginCheck(membervo.getUserid(), membervo.getPwd());
		logger.info("비밀번호 체크 결과, result={}", result);

		String msg = "회원 수정 실패!", url = "/member/memberEdit";
		
		if(result==MemberService.LOGIN_OK) {
			
			int cnt = memberService.updateMember(membervo);
			logger.info("회원 정보 수정 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg = "회원 수정 성공!";
				url = "/main/member/mypage";
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		} 

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@GetMapping("/memberOut")
	public String memberOut_get(HttpSession session) {
		String userid=(String) session.getAttribute("userid");
		logger.info("회원 탈퇴 화면, userid={}", userid);

		return "main/member/memberOut";
	}
	
	@PostMapping("/memberOut")
	public String memberOut_post(@RequestParam String pwd, HttpSession session,
			HttpServletResponse response, Model model) {

		String userid=(String)session.getAttribute("userid");
		logger.info("회원 탈퇴 처리, pwd={}, userid={}" ,pwd, userid);

		int result=memberService.loginCheck(userid, pwd);
		logger.info("비밀번호 체크 결과, result={}", result);
		
		String msg="회원 탈퇴 실패",url="/member/memberOut";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.updateMemberOut(userid);
			logger.info("회원탈퇴 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg="회원 탈퇴 성공";
				url="/main/index";

				session.invalidate();
				
				Cookie ck = new Cookie("ck_userid", userid);
				ck.setPath("/");
				ck.setMaxAge(0); 
				response.addCookie(ck);
			}
		}else if(result==MemberService.PWD_DISAGREE) {
			msg="비밀번호가 틀렸습니다";
			url="/main/member/memberOut";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

}
