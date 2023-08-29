package com.team2.mbti.main.education.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.education.model.EducationService;
import com.team2.mbti.education.model.EducationVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/education")
public class MainEducationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainEducationController.class);
	private final EducationService educationService;

	@RequestMapping("/info")
	public String eduInfo() {
		logger.info("교육 소개 페이지 보여주기");
		
		return "main/education/info";
	}

	
	@RequestMapping("/list")
	public String eduList(@ModelAttribute EducationVO vo, Model model) {
		logger.info("교육 리스트 페이지 보여주기 condition: {}", vo.getSearchCondition());
		
		PaginationInfo pagingInfo = new PaginationInfo();
		List<EducationVO> list = null;
		String condition=vo.getSearchCondition();
		String keyword=vo.getSearchKeyword();
		logger.info("condition={},keyword={}",condition,keyword);
		
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		vo.setBlockSize(ConstUtil.BLOCK_SIZE);
		vo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		list = educationService.selectAllEducation(vo);
		logger.info("교육 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordEducation(vo);
		logger.info("교육 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/education/list";
	}
	
	
	@RequestMapping("/apply")
	public String eduApply(@ModelAttribute EducationVO vo, Model model){
		logger.info("신청 등록 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.insertApply(vo);
		logger.info("신청 등록 처리 결과 cnt={}", cnt);
		
		String msg="신청 등록에 실패하였습니다.",url="/main/education/list";
		if(cnt>0) {
			msg="신청이 성공적으로 등록되었습니다.";
			url="/main/education/list?eduNo="+vo.getEduNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/location")
	public String eduLocation() {
		logger.info("교육장 위치 페이지 보여주기");
		
		return "main/education/location";
	}
	
	
	
}
