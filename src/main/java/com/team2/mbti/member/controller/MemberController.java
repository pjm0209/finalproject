package com.team2.mbti.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
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
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		vo.setBlockSize(ConstUtil.BLOCK_SIZE);
		vo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MemberVO> list = memberService.selectAllMember(vo);
		logger.info("회원 목록 결과 list.size={}", list.size());
		int totalRecord=memberService.getTotalRecordMember(vo);
		logger.info("회원 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/member/memberList";
	}
	
	@RequestMapping("/member")
	public String member() {
		logger.info("회원 관리 페이지");
		
		return "admin/member/memberList";
	}
	
	@RequestMapping("/memberDelete")
	public String memberDelete(@ModelAttribute MemberVO membervo, Model model){
		logger.info("회원 탈퇴 처리, 파라미터 membervo={}", membervo);
		
		int cnt = memberService.deleteMember(membervo.getNo());
		
		String msg="", url="/admin/member/memberList";
		
		if(cnt > 0) {
			msg="선택한 회원이 탈퇴되었습니다.";
		}else {
			msg="회원을 탈퇴하는중에 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
		
	
}
