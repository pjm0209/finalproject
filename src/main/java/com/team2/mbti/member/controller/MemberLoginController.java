 package com.team2.mbti.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.member.model.MemberService;
import com.team2.mbti.member.model.MemberVO;

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
	
	@GetMapping("/member/memberLogin")
	public String login_get() {
		logger.info("로그인 화면");
		
		return "/main/member/memberLogin";
	}
	
	@PostMapping("/member/memberLogin")
	public String memberLogin_post(@RequestParam(required =  false) String userid, @RequestParam(required =  false) String pwd,
			@RequestParam(required =  false) String chkSave, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		logger.info("회원 로그인 처리, 파라미터 userid={}, pwd={}, chkSave={}", userid, pwd, chkSave);
		
		int result = memberService.loginCheck(userid, pwd);
		logger.info("회원 로그인 체크 결과, result={}", result);
		
		String msg = "회원 로그인 체크 실패", url = "/main/member/memberLogin";
		if(result == MemberService.LOGIN_OK) {
			msg = userid + "회원님이 로그인되었습니다.";
			url = "/main/index";
			
			MemberVO no = memberService.selectByUserid(userid);
			
		    logger.info("MemberVO: {}", no);
		    
		    String userName = no.getName();
		    logger.info("user name: {}", userName);
			
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("name", userName);
			session.setAttribute("no", no.getNo());
			
			//request.getSession().setAttribute("userid", userid);
			
			Cookie ck = new Cookie("ck_userid", userid);
			ck.setPath("/");
			if(chkSave!=null) {
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}						
		}else if(result == MemberService.PWD_DISAGREE) {
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
		
		session.removeAttribute("userid");
				
		return "redirect:/main/index";	
	}
	
	@RequestMapping("/member/agreement")
	public String agreement() {
		logger.info("약관동의 화면");
		
		return "main/member/agreement";
	}
	
	@RequestMapping("/member/memberRegister")
	public String memberRegister() {
		logger.info("회원가입 화면");
				
		return "main/member/memberRegister";
	}
	
	@PostMapping("/member/memberRegister")
	public String memberRegister_post(@ModelAttribute MemberVO membervo, Model model){
		logger.info("회원가입 처리, 파라미터 membervo={}",membervo);
		
		int cnt = memberService.insertMember(membervo);
		
		logger.info("회원 가입 완료, result = {}",cnt);		
		String msg = "회원 가입에 실패하였습니다.", url = "/member/memberRegister";
		
		if(cnt > 0) {
			msg = membervo.getUserid()+"님 회원가입을 축하드립니다.";
			url = "/main/member/memberLogin";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	
	}
		
	@RequestMapping("/member/forgot-id")
	public String forgot_id() {
		logger.info("아이디 찾기 화면");
	    
		return "main/member/forgot-id";
	}
	
	@RequestMapping(value = "/member/findIdResult", method = RequestMethod.GET)
	public String search_pwd(HttpServletRequest request, Model model, MemberVO searchVO) {
		logger.info("아이디 찾기 결과 처리 화면");
	    
		return "main/member/findIdResult";
	}
		
	@RequestMapping(value="/member/forgot-pwd", method = RequestMethod.GET)
	public String forgot_pwd_get() {
		logger.info("비밀번호 찾기 화면");
		
		return "main/member/forgot-pwd";
	}
	
	@RequestMapping(value="/member/forgot-pwd", method = RequestMethod.POST)
	public String forgot_pwd_post(@ModelAttribute MemberVO membervo, HttpServletResponse response) {
		logger.info("비밀번호 찾기 처리");
		
		return "main/member/forgot-pwd";
	}
	
	@RequestMapping("/member/findPwdResult")
	public String findPwdResult() {
		logger.info("비밀번호 찾기 결과 화면");
		
		return "main/member/findPwdResult";
	}	
	
	@ResponseBody
	@RequestMapping("/member/checkId")
	public int checkId(@RequestParam String userid, Model model) {
		//1
		logger.info("아이디 중복확인 파라미터, userid={}", userid);

		//2
		int result=0;
		result = memberService.selectCheckId(userid);
		logger.info("중복확인 결과 result={}", result);
		
		//4
		return result;
	}
	
}