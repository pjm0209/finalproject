package com.team2.mbti.main.education.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team2.mbti.common.ConstUtil;
import com.team2.mbti.common.PaginationInfo;
import com.team2.mbti.education.model.EducationListVO;
import com.team2.mbti.education.model.EducationService;
import com.team2.mbti.education.model.EducationVO;
import com.team2.mbti.educationLike.model.EducationLikeService;
import com.team2.mbti.educationLike.model.EducationLikeVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main")
public class MainEducationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainEducationController.class);
	private final EducationService educationService;
	private final EducationLikeService educationLikeService;

	@RequestMapping("/education/info")
	public String eduInfo() {
		logger.info("교육 소개 페이지 보여주기");
		
		return "main/education/info";
	}

	
	@RequestMapping("/education/list")
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
		
		list = educationService.selectAllList(vo);
		logger.info("교육 목록 결과 list.size={}", list.size());
		int totalRecord=educationService.getTotalRecordEducation(vo);
		logger.info("교육 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "main/education/list";
	}
	
	@ResponseBody
	@RequestMapping("/education/apply")
	public int eduApply(@ModelAttribute EducationVO vo, HttpSession session){
		logger.info("신청 등록 처리, 파라미터 vo={}", vo);
		int no = (int)session.getAttribute("no");
		vo.setNo(no);
		
		int cnt = educationService.selectEducationFlag(vo);
		
		if(cnt < 1) {
			cnt = educationService.insertApply(vo);
			logger.info("신청 등록 처리 결과 cnt={}", cnt);
		} else {
			cnt = 2;
		}
		
		return cnt;
	}
	
	
	@RequestMapping("/education/location")
	public String eduLocation(@ModelAttribute EducationVO vo, Model model) {
		logger.info("교육장 위치 페이지 보여주기, 파라미터 vo={}", vo);
		
		List<EducationVO> list = educationService.selectAllLocName();
		model.addAttribute("list", list);
		
		return "main/education/location";
	}
	
	
	@ResponseBody
	@RequestMapping("/education/locationAjax")
	public EducationVO ajaxLocation(@RequestParam(defaultValue = "0") int epNo) {
		logger.info("해당 교육장 위치 보여주기");
		
		EducationVO vo = educationService.selectByNoLocation(epNo);
		
		return vo;
	}
	
	
	@RequestMapping("/mypage/education")
	public String myEdu(@ModelAttribute EducationVO vo, @ModelAttribute EducationLikeVO likeVo,HttpSession session, Model model) {
		logger.info("마이 교육 페이지 보여주기, vo={}", vo);
		
		int no = (int) session.getAttribute("no");
		vo.setNo(no);

		List<EducationVO> list = educationService.selectMyAllEdu(vo);
		
		List<EducationVO> payList = educationService.myPayEdu(vo);
		logger.info("payList: {}", payList);
		List<EducationVO> finList = educationService.myFinishEdu(vo);
		logger.info("finList={}", finList);
		List<Map<String, Object>> likeList = educationLikeService.selectByNoEduLike(no);
		logger.info("찜하기 리스트 보여주기, likeList={}", likeList);

		model.addAttribute("list", list);
		model.addAttribute("payList", payList);
		model.addAttribute("finList", finList);
		model.addAttribute("likeList", likeList);
		
		return "main/mypage/education";
	}
	
	
	@RequestMapping("/mypage/applyCan")
	public String applyCancel(@RequestParam (defaultValue = "0") int [] eduAppNo, Model model) {
		logger.info("신청한 교육 취소 처리, 파라미터 eduAppNo={}", eduAppNo);

		int cnt = educationService.cancelApplicant(eduAppNo);
		
		String msg="", url="/main/mypage/education";
		if(cnt>0) {
			msg="선택한 교육 신청이 취소되었습니다.";
		}else {
			msg="선택한 교육 신청을 취소하는 도중 에러가 발생하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	
	@ResponseBody
	@RequestMapping("/mypage/payAjax")
	public String applyFinish(@RequestParam int eduAppNo,@RequestParam String eduName,@RequestParam int eduPrice) {
		logger.info("신청 교육 결제 완료 처리, 파라미터 eduAppNo={},eduName={},eduPrice={}", eduAppNo,eduName,eduPrice);
		
		int cnt = educationService.applyPayFinish(eduAppNo);
		
		EducationVO vo= new EducationVO();
		vo.setEduAppNo(eduAppNo);
		vo.setEduName(eduName);
		vo.setEduPrice(eduPrice);
		
		String msg="";
		if(cnt>0) {
			msg="신청한 교육의 결제가 완료되었습니다.";
			int cnt2 = educationService.insertSalesByEdu(vo);
			logger.info("교육 결제 매출 넘겨주기, cnt2={}", cnt2);
		}else {
			msg="신청한 교육의 결제를 진행하는 도중 에러가 발생하였습니다.";
		}
		
		return msg;
	}
	
	

	
}	
