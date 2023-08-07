package com.team2.mbti.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.common.SearchVO;
import com.team2.mbti.member.model.MemberService;
import com.team2.mbti.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private final MemberService memberService;
	
	@RequestMapping("/memberList")
	public String memberList(@ModelAttribute SearchVO vo,@RequestParam(required = false) String searchCondition,
			Model model) {
		logger.info("회원 목록 페이지, 파라미터 vo={}, condition={}", vo, searchCondition);
		
		List<MemberVO> list = memberService.selectAllMember(vo);
		
		logger.info("회원 목록 결과 list.size={}", list.size());
		model.addAttribute("list", list);
		int totalRecord=memberService.getTotalRecordMember(vo);
		logger.info("회원 전체 검색 결과 totalRecord={}",totalRecord);
		
		return "admin/member/memberList";
	}
	
	@RequestMapping("/member")
	public String member() {
		logger.info("회원 관리 페이지");
		
		return "admin/member/memberList";
	}
	
	
	
}
