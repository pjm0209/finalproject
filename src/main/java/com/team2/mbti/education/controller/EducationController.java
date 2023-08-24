package com.team2.mbti.education.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.education.model.EducationListVO;
import com.team2.mbti.education.model.EducationService;
import com.team2.mbti.education.model.EducationVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/education")
@RequiredArgsConstructor
public class EducationController {
	private static final Logger logger = LoggerFactory.getLogger(EducationController.class);
	
	private final EducationService educationService;
	
	@GetMapping("/educationWrite")
	public String eduWrite_get(Model model) {
		logger.info("교육 등록 페이지");
		
		List<EducationVO> list = educationService.getTeaName();
		logger.info("강사 이름 조회 결과, list.size={}", list.size());
		
		List<EducationVO> list2 = educationService.getEpName();
		logger.info("교육장 조회 결과, list.size={}", list2.size());
		
		model.addAttribute("title", "교육 등록");
		model.addAttribute("teaNameList", list);
		model.addAttribute("epNameList", list2);
		
		return "admin/education/educationWrite";
	}
	
	@PostMapping("/educationWrite")
	public String eduWrite_post(@ModelAttribute EducationVO vo, Model model){
		logger.info("교육 등록 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.insertEducation(vo);
		logger.info("교육 등록 처리 결과 cnt={}", cnt);
		
		String msg="교육 등록에 실패하였습니다.",url="/admin/education/educationWrite";
		if(cnt>0) {
			msg="교육이 성공적으로 등록되었습니다.";
			url="/admin/education/list?eduNo="+vo.getEduNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/educationEdit")
	public String eduEdit_get(@RequestParam(defaultValue = "0") int eduNo, Model model) {
		logger.info("교육 수정 페이지");
		
		List<EducationVO> list = educationService.getTeaName();
		logger.info("강사 이름 조회 결과, list.size={}", list.size());
		
		List<EducationVO> list2 = educationService.getEpName();
		logger.info("교육장 조회 결과, list.size={}", list2.size());
		
		EducationVO vo = educationService.selectByNoEducation(eduNo);
		
		model.addAttribute("title", "교육 수정");
		model.addAttribute("vo", vo);
		model.addAttribute("teaNameList", list);
		model.addAttribute("epNameList", list2);
		
		return "admin/education/educationWrite";
	}
	
	@PostMapping("/educationEdit")
	public String eduEdit_post(@ModelAttribute EducationVO vo, Model model){
		logger.info("교육 수정 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.updateEducation(vo);
		logger.info("교육 수정 처리 결과 cnt={}", cnt);
		
		String msg="교육 수정에 실패하였습니다.",url="/admin/education/list";
		if(cnt>0) {
			msg="교육이 성공적으로 수정되었습니다.";
			url="/admin/education/list";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/list")
	public String list(@ModelAttribute EducationVO vo, Model model) {
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
		
		return "admin/education/list";
		
	}
	
	
	@RequestMapping("/eduDelete")
	public String eduDelete(@ModelAttribute EducationListVO listVo, Model model) {
		logger.info("교육 삭제 처리, 파라미터 listVo={}", listVo);
		
		List<EducationVO> list = listVo.getEducationItems();

		int cnt = educationService.deleteEducation(list);
		
		String msg="", url="/admin/education/list";
		if(cnt>0) {
			msg="선택한 교육이 삭제되었습니다.";
		}else {
			msg="선택한 교육을 삭제하는 도중 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	
	@RequestMapping("/applicantList")
	public String appliList(@ModelAttribute EducationVO vo, Model model) {
		logger.info("신청자 관리 페이지 보여주기, 파라미터 vo={}", vo);
		
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
		
		list = educationService.selectAllApplicant(vo);
		logger.info("신청자 목록 결과 list={}", list);
		int totalRecord=educationService.getTotalRecordApplicant(vo);
		logger.info("신청자 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/education/applicantList";
	}
	
	@RequestMapping("/appliDelete")
	public String appliDelete(@ModelAttribute EducationListVO listVo, Model model) {
		logger.info("신청자 거절 처리, 파라미터 listVo={}", listVo);
		
		List<EducationVO> list = listVo.getEducationItems();

		int cnt = educationService.deleteApplicant(list);
		
		String msg="", url="/admin/education/applicantList";
		if(cnt>0) {
			msg="선택한 신청자가 거절되었습니다.";
		}else {
			msg="선택한 신청자를 거절하는 도중 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/appliUpdate")
	public String appliUpdate(@ModelAttribute EducationListVO listVo) {
		logger.info("신청자 승인 처리, 파라미터 listVo={}", listVo);
		
		List<EducationVO> list = listVo.getEducationItems();
		
		int cnt = educationService.updateApplicant(list);
		logger.info("신청자 승인처리 결과 cnt: {}", cnt);
		
		return "redirect:/admin/education/applicantList";
	}
	
	
	@RequestMapping("/location")
	public String locationList(@ModelAttribute EducationVO vo, Model model) {
		logger.info("교육장 관리 페이지 보여주기, 파라미터 vo={}", vo);
		
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
		
		list = educationService.selectAllLocation(vo);
		logger.info("교육장 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordLocation(vo);
		logger.info("교육장 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/education/location";
	}
	
	@GetMapping("/locationWrite")
	public String locWrite_get(Model model) {
		logger.info("교육장 등록 페이지");
		
		List<EducationVO> list = educationService.getEpName();
		logger.info("교육장 조회 결과, list.size={}", list.size());
		
		model.addAttribute("title", "교육장 등록");
		model.addAttribute("epNameList", list);
		
		return "admin/education/locationWrite";
	}
	
	@PostMapping("/locationWrite")
	public String locWrite_post(@ModelAttribute EducationVO vo, Model model){
		logger.info("교육장 등록 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.insertLocation(vo);
		logger.info("교육장 등록 처리 결과 cnt={}", cnt);
		
		String msg="교육장 등록에 실패하였습니다.",url="/admin/education/locationWrite";
		if(cnt>0) {
			msg="교육장이 성공적으로 등록되었습니다.";
			url="/admin/education/location?epNo="+vo.getEpNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@GetMapping("/locationEdit")
	public String locEdit_get(@RequestParam(defaultValue = "0") int epNo, Model model) {
		logger.info("교육장 수정 페이지");
		
		List<EducationVO> list = educationService.getEpName();
		logger.info("교육장 조회 결과, list.size={}", list.size());
		
		EducationVO vo = educationService.selectByNoLocation(epNo);
		
		model.addAttribute("title", "교육장 수정");
		model.addAttribute("vo", vo);
		model.addAttribute("epNameList", list);
		
		return "admin/education/locationWrite";
	}
	
	@PostMapping("/locationEdit")
	public String locEdit_post(@ModelAttribute EducationVO vo, Model model){
		logger.info("교육장 수정 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.updateLocation(vo);
		logger.info("교육장 수정 처리 결과 cnt={}", cnt);
		
		String msg="교육장 수정에 실패하였습니다.",url="/admin/education/location";
		if(cnt>0) {
			msg="교육장이 성공적으로 수정되었습니다.";
			url="/admin/education/location";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/locDelete")
	public String locDelete(@ModelAttribute EducationListVO listVo, Model model) {
		logger.info("교육장 삭제 처리, 파라미터 listVo={}", listVo);
		
		List<EducationVO> list = listVo.getEducationItems();

		int cnt = educationService.deleteLocation(list);
		
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
	
	
	@RequestMapping("/teacher")
	public String teacherList(@ModelAttribute EducationVO vo, Model model) {
		logger.info("강사 관리 페이지 보여주기, 파라미터 vo={}", vo);
		
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
		
		list = educationService.selectAllTeacher(vo);
		logger.info("강사 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordTeacher(vo);
		logger.info("강사 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/education/teacher";
		
	}
	
	
	@RequestMapping("/teaDelete")
	public String teaDelete(@ModelAttribute EducationListVO listVo, Model model) {
		logger.info("강사 삭제 처리, 파라미터 listVo={}", listVo);
		
		List<EducationVO> list = listVo.getEducationItems();

		int cnt = educationService.deleteTeacher(list);
		
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
	
	
	@GetMapping("/teacherWrite")
	public String teaWrite_get(Model model) {
		logger.info("강사 등록 페이지");
		
		model.addAttribute("title", "강사 등록");
		
		return "admin/education/teacherWrite";
	}
	
	@PostMapping("/teacherWrite")
	public String teaWrite_post(@ModelAttribute EducationVO vo, Model model){
		logger.info("강사 등록 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.insertTeacher(vo);
		logger.info("강사 등록 처리 결과 cnt={}", cnt);
		
		String msg="강사 등록에 실패하였습니다.",url="/admin/education/teacherWrite";
		if(cnt>0) {
			msg="강사가 성공적으로 등록되었습니다.";
			url="/admin/education/teacher";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@GetMapping("/teacherEdit")
	public String teaEdit_get(@RequestParam(defaultValue = "0") int eduTeaNo, Model model) {
		logger.info("강사 수정 페이지");
		
		EducationVO vo = educationService.selectByNoTeacher(eduTeaNo);
		
		model.addAttribute("title", "강사 수정");
		model.addAttribute("vo", vo);
		
		return "admin/education/teacherWrite";
	}
	
	@PostMapping("/teacherEdit")
	public String teaEdit_post(@ModelAttribute EducationVO vo, Model model){
		logger.info("강사 수정 처리, 파라미터 vo={}", vo);
		
		int cnt=educationService.updateTeacher(vo);
		logger.info("강사 수정 처리 결과 cnt={}", cnt);
		
		String msg="강사 정보 수정에 실패하였습니다.",url="/admin/education/teacher";
		if(cnt>0) {
			msg="강사 정보가 성공적으로 수정되었습니다.";
			url="/admin/education/teacher";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
