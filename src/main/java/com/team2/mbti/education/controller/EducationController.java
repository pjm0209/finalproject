package com.team2.mbti.education.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.common.SearchVO;
import com.team2.mbti.education.model.EducationService;
import com.team2.mbti.education.model.EducationVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/education")
@RequiredArgsConstructor
public class EducationController {
	private static final Logger logger = LoggerFactory.getLogger(EducationController.class);
	
	private final EducationService educationService;
	
	@GetMapping("/list")
	public String list_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("교육 리스트 페이지 보여주기");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		List<EducationVO> list = null;
		String condition=searchVo.getSearchCondition();
		String keyword=searchVo.getSearchKeyword();
		logger.info("condition={},keyword={}",condition,keyword);
			
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		searchVo.setBlockSize(ConstUtil.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		list = educationService.selectAllEducation(searchVo);
		logger.info("교육 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordLocation(searchVo);
		logger.info("교육 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/education/list";
		
	}
	
	@RequestMapping("/eduDelete")
	public String eduDelete(@ModelAttribute EducationVO vo, Model model) {
		logger.info("교육 삭제 처리, 파라미터 vo={}", vo);
		
		int cnt = educationService.deleteEducation(vo.getEduNo());
		
		String msg="", url="/admin/education/list";
		if(cnt>0) {
			msg="선택한 교육이 삭제되었습니다.";
		}else {
			msg="선택한 교육울 삭제하는 도중 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	
	@GetMapping("/applicantList")
	public String appliList_get(Model model) {
		logger.info("신청자 관리 페이지 보여주기");
		
		model.addAttribute("title", "신청자 조회");
		
		return "admin/education/applicantList";
		
	}
	
	
	@GetMapping("/location")
	public String location_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("교육장 관리 페이지 보여주기, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		List<EducationVO> list = null;
		String condition=searchVo.getSearchCondition();
		String keyword=searchVo.getSearchKeyword();
		logger.info("condition={},keyword={}",condition,keyword);
			
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		searchVo.setBlockSize(ConstUtil.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		list = educationService.selectAllLocation(searchVo);
		logger.info("교육장 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordLocation(searchVo);
		logger.info("교육장 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/education/location";
	}

	
	@RequestMapping("/locDelete")
	public String locDelete(@ModelAttribute EducationVO vo, Model model) {
		logger.info("교육장 삭제 처리, 파라미터 vo={}", vo);
		
		int cnt = educationService.deleteLocation(vo.getEpNo());
		
		String msg="", url="/admin/education/location";
		if(cnt>0) {
			msg="선택한 교육장이 삭제되었습니다.";
		}else {
			msg="선택한 교육장을 삭제하는 도중 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@GetMapping("/teacher")
	public String teacher_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("강사 관리 페이지 보여주기, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		List<EducationVO> list = null;
		String condition=searchVo.getSearchCondition();
		String keyword=searchVo.getSearchKeyword();
		logger.info("condition={},keyword={}",condition,keyword);
			
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		searchVo.setBlockSize(ConstUtil.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		list = educationService.selectAllTeacher(searchVo);
		logger.info("강사 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordTeacher(searchVo);
		logger.info("강사 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/education/teacher";
		
	}
	
	
	@RequestMapping("/teaDelete")
	public String teaDelete(@ModelAttribute EducationVO vo, Model model) {
		logger.info("강사 삭제 처리, 파라미터 vo={}", vo);
		
		int cnt = educationService.deleteTeacher(vo.getEduTeaNo());
		
		String msg="", url="/admin/education/teacher";
		if(cnt>0) {
			msg="선택한 강사가 삭제되었습니다.";
		}else {
			msg="선택한 강사를 삭제하는 도중 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
}
