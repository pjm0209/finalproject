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
	public String mbti(Model model) {
		logger.info("mbti 목록 페이지");
		
		List<MbtiSurveyVO> list=mbtiSurveyService.selectAllMbtiSurvey();
		logger.info("mbti 목록 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "admin/mbti/mbti";
	}
	
	@GetMapping("/mbtiWrite")
	public String mbtiWrite_get(@RequestParam(required = false,defaultValue = "0") int mbtiServeyNo, Model model) {
		logger.info("mbti 질문지 등록 페이지");
		
		if(mbtiServeyNo!=0) {
			MbtiSurveyVO vo=mbtiSurveyService.selectByNoMbtiSurvey(mbtiServeyNo);
			
			model.addAttribute("vo", vo);
		}
		
		return "admin/mbti/mbtiWrite";
	}
	
	@PostMapping("/mbtiWrite")
	public String mbtiWrite_post(@ModelAttribute MbtiSurveyVO mbtiSurveyVo, Model model){
		logger.info("mbti 질문 등록 처리, 파라미터 mbtiSurveyVo={}",mbtiSurveyVo);
		
		if(mbtiSurveyVo.getMbtiServeyNo()==0) {
			int cnt=mbtiSurveyService.insertMbtiSurvey(mbtiSurveyVo);
			logger.info("mbti 질문 등록 결과 cnt={}",cnt);
			
			String msg="mbti 질문 등록 실패",url="/admin/mbti/mbtiWrite";
			if(cnt>0) {
				msg="MBTI 질문이 등록되었습니다.";
				url="/admin/mbti/mbti";
			}
		}else {
			int cnt=mbtiSurveyService.updateMbtiSurvey(mbtiSurveyVo);
			logger.info("mbti 질문 수정 결과 cnt={}",cnt);
			
			String msg="mbti 질문 수정 실패",url="/admin/mbti/mbtiWrite";
			if(cnt>0) {
				msg="MBTI 질문이 수정되었습니다.";
				url="/admin/mbti/mbti";
			}
		}
		
		model.addAttribute("msg", model);
		model.addAttribute("url", model);
		
		return "common/message";
	}
}