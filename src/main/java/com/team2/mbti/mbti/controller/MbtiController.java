package com.team2.mbti.mbti.controller;

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
import com.team2.mbti.common.SearchVO;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyListVO;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyService;
import com.team2.mbti.mbtisurvey.model.MbtiSurveyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/mbti")
public class MbtiController {
	private static final Logger logger = LoggerFactory.getLogger(MbtiController.class);
	
	private final MbtiSurveyService mbtiSurveyService;
	
	@RequestMapping("/mbti")
	public String mbti(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("mbti 목록 페이지, 파라미터 searchVo={}",searchVo);
		String condition=searchVo.getSearchCondition();
		String keyword=searchVo.getSearchKeyword();
		logger.info("condition={},keyword={},keyword.toUpperCase()={}",condition,keyword,keyword.toUpperCase());
		if(condition.equals("question_type_no")) {
			if(keyword.equalsIgnoreCase("F")) {
				searchVo.setSearchKeyword("1");
			}else if(keyword.equalsIgnoreCase("P")) {
				searchVo.setSearchKeyword("2");
			}else if(keyword.equalsIgnoreCase("M")) {
				searchVo.setSearchKeyword("3");
			}
		}
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		
		searchVo.setBlockSize(ConstUtil.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(ConstUtil.MBTI_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MbtiSurveyVO> list=mbtiSurveyService.selectAllMbtiSurvey(searchVo);
		logger.info("mbti 목록 결과 list.size={}",list.size());
		int totalRecord=mbtiSurveyService.getTotalRecordMbti(searchVo);
		logger.info("mbti 전체 검색 결과 totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/mbti/mbti";
	}
	
	@GetMapping("/mbtiWrite")
	public String mbtiWrite_get(@RequestParam(required = false,defaultValue = "0") int mbtiSurveyNo, Model model) {
		logger.info("mbti 질문지 등록 페이지");
		
		if(mbtiSurveyNo!=0) {
			MbtiSurveyVO vo=mbtiSurveyService.selectByNoMbtiSurvey(mbtiSurveyNo);
			
			model.addAttribute("vo", vo);
		}
		
		return "admin/mbti/mbtiWrite";
	}
	
	@PostMapping("/mbtiWrite")
	public String mbtiWrite_post(@ModelAttribute MbtiSurveyVO mbtiSurveyVo, Model model){
		logger.info("mbti 질문 등록 처리, 파라미터 mbtiSurveyVo={}",mbtiSurveyVo);
		
		String question=mbtiSurveyVo.getQuestion();
		
		question=question.substring(question.indexOf(">")+1,question.lastIndexOf("<"));
		mbtiSurveyVo.setQuestion(question);
		
		String msg="mbti 질문 등록 실패",url="/admin/mbti/mbtiWrite";
		boolean closePopup=false;
		if(mbtiSurveyVo.getMbtiSurveyNo()==0) {
			int cnt=mbtiSurveyService.insertMbtiSurvey(mbtiSurveyVo);
			logger.info("mbti 질문 등록 결과 cnt={}",cnt);
			
			if(cnt>0) {
				msg="MBTI 질문이 등록되었습니다.";
				url="/admin/mbti/mbti";
				
				closePopup=true;
			}
		}else {
			int cnt=mbtiSurveyService.updateMbtiSurvey(mbtiSurveyVo);
			logger.info("mbti 질문 수정 결과 cnt={}",cnt);
			
			if(cnt>0) {
				msg="MBTI 질문이 수정되었습니다.";
				url="/admin/mbti/mbti";
				closePopup=true;
			}else {
				msg="mbti 질문 수정 실패";
				url="/admin/mbti/mbtiWrite";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("closePopup", closePopup);
		
		return "common/message";
	}
	
	@RequestMapping("/mbtiDelete")
	public String mbtiDelete(@ModelAttribute MbtiSurveyListVO surveyListVo,Model model) {
		logger.info("선택한 질문지 삭제 처리, 파라미터 surveyListVo=",surveyListVo);
		
		List<MbtiSurveyVO> list=surveyListVo.getSurveyItems();
		
		int cnt=mbtiSurveyService.deleteMultiMbtiSurvey(list);
		String msg="",url="/admin/mbti/mbti";
		if(cnt>0) {
			msg="선택한 질문들을 삭제하였습니다.";
		}else {
			msg="선택한 질문을 삭제하는 도중 에러가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/mbtiStatistics")
	public String mbtiStatistics() {
		logger.info("mbti 유형별 통계 페이지");
		
		return "admin/mbti/mbtiStatistics";
	}

}